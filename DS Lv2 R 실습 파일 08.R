#### 데이터 전처리: 데이터 병합
# 
# 1. 데이터 병합 개요
#   - 병합의 종류
#      + 데이터를 이어 붙이는 바인딩(Binding)은 행 또는 열 방향으로 연산 가능
#      + 특정 변수를 기준으로 두 데이터를 엮는(Join)을 많이 사용
#      + 조인 연산 중 Inner Join과 Left Join을 많이 사용
#   - 조인(Join) 상세
#      + Inner Join: 두 데이터 세트의 기준이 되는 변수인 Key 변수가 공통인 행을 반환
#      + Left Join: A세트의 모든 행을 유지하고 B세는 Key 변수를 기준으로 A 세트와 공통인 행을 반환
# 
# 2. 주요 함수 소개
#   - base - rbind()
#      + 두 개 이상의 데이터프레임을 row 기준으로 이어 붙이는 기본 함수
#      + 대상 데이터프레임의 변수 개수, 속성, 이름이 다를 경우 에러 발생 가능성
#   - base - cbind()
#      + 두 개 이상의 데이터프레임을 column 기준으로 이어 붙이는 기본 함수
#      + 대상 데이터프레임의 행 개수가 다를 경우 에러 발생 가능

df = iris

df_1 = df[1:3, ]
df_2 = df[51:53, ]

rbind(df_1, df_2)
rbind(df_1, df_2[,-1])     # error

cbind(df_1, df_2)
cbind(df_1, df_2[-1,])     # error  -->  이름을 변경하라..

#   - dplyr - left_join()
#      + 두 데이터프레임의 Left Join 연산을 수행하는 dplyr의 함수
#      + by 인자에 named vector를 활용하여 각 데이터프레임의 key 변수 지정
#   - dplyr - inner_join()
#      + 두 데이터프레임의 Inner Join 연산을 수행하는 dplyr의 함수
#      + by 인자에 named vector를 활용하여 각 데이터프레임의 key 변수 지정

df = iris
df_a = df[c(1, 51, 102), 4:5]
df_b = df[1:3, 4:5]

library(dplyr)

df_left_join = left_join(x = df_a, y = df_b,
                    by = c("Species" = "Species"))

df_inner_join = inner_join(x = df_a, y = df_b,
                    by = c("Species" = "Species"))

# Q1. A를 B에 Left Join 하였을 때 생성되는 결측 행의 개수는?
#    - join_data_group_members.csv 파일이 A, join_data_member_room.csv 파일이 B
#    - 사용 데이터 파일 인코딩은 UTF-8로 되어 있음 (encoding = "UTF-8")
#
#    1) 0
#    2) 12
#    3) 15
#    4) 5

df_A = read.csv("../Rex/join_data_group_members.csv", encoding = "UTF-8")
df_B = read.csv("../Rex/join_data_member_room.csv", encoding = "UTF-8")
head(df_A,2)
head(df_B,2)

library(dplyr)

df_left_join = left_join(x = df_A, y = df_B,
                         by = c("member" = "name"))

# Q2. 여름과 겨울의 시간대별 registered 평균을 비교할 때 가장 차이가 많이 나는 시각은?
#    - bike.csv 파일 사용
#    - hour 함수 활용
#
#    1) 12
#    2) 13
#    3) 19
#    4) 20

df = read.csv("../Rex/bike.csv")
head(df, 2)

library(lubridate)
df[, "hour"] = hour(df$datetime)
head(df, 2)

df_s2 = df[df$season == 2, ]
df_s4 = df[df$season == 4, ]

df_agg_s2 = aggregate(data = df_s2, 
                      registered ~ hour, FUN = "mean")

df_agg_s4 = aggregate(data = df_s4, 
                      registered ~ hour, FUN = "mean")

df_agg_bind = cbind(df_agg_s2, df_agg_s4)
head(df_agg_bind)

df_agg_bind[, "diff"] = df_agg_bind[,2] - df_agg_bind[,4]
df_agg_bind[which.max(df_agg_bind$diff),]

# Q3. 비가 온 날에 30도가 넘는 시각의 casual의 평균은 얼마인가?
#    - bike.csv 파일 사용
#    - humidity의 최대값이 100인 날을 비가 온 날로 간주
#    - 반올림하여 소수점 둘째 자리까지 표기 
#
#    1) 95.50
#    2) 44.93
#    3) 191.57
#    4) 89.41

df = read.csv("../Rex/bike.csv")
head(df, 2)

library(lubridate)
df[, "date"] = date(df$datetime)
head(df, 2)

df_h100 = aggregate(data = df, humidity ~ date, FUN = max)
head(df_h100, 2)

df_h100 = df_h100[df_h100$humidity == 100,]
head(df_h100, 2)

df_rain = df[df$date %in% df_h100$date,]
head(df_rain, 2)

mean(df_rain[df_rain$temp > 30, "casual"])






