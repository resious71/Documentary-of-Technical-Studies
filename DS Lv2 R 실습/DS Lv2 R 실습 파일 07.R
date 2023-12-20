#### 데이터 전처리: 파생변수 생성
# 
# 1. 파생변수 개요
#    - 파생변수의 정의
#        + 기존 변수를 조합하여 만들어내는 새로운 변수
#    - 파생변수의 예시
#        + 기온, 습도, 풍속을 조합하여 만든 체감온도 변수
#        + 물건 주문 건수와 환불 건수를 조합하여 만든 환불 비율 변수
#        + 기존 방문 매장 정보를 활용한 주 방문 매장 변수
# 
# 2. 주요 함수 소개
#    - base - ifelse()  --> c의 삼항 연산자
#        + 주어진 조건을 기준으로 조건에 따라 두 종류의 결과값을 반환하는 기본 함수
#        + 입력은 TRUE 또는 FALSE로 이루어진 1차원 벡터 필요
#        + 입력이 TRUE일 경우 yes 인자에 입력된 값이 반환되며 no 인자는 그 반대

ifelse(c(1,2,3,4) >2, yes = "up", no = "down")

df = iris
head(df, 2)

df[, "is_setosa"] = ifelse(df$Species == "setosa", yes = 1, no = 0)
head(df, 2)
tail(df, 2)

table(df[, c("Species", "is_setosa")])
prop.table(table(df$Species))
prop.table(table(df[, c("Species", "is_setosa")]), margin = 2)

#    - base - apply()   --> data.frame 기반 연산시 유용  
#        + 축 방향으로 일괄 연산을 실시할 수 있는 기본 함수
#        + MARGIN 인자 설정으로 연산 방향 지정 가능(MARGIN = 1은 row, MARGIN = 2는 column)
#        + 사용자 정의 함수 또는 일회성 함수(lambda)로 복잡한 연산 가능

df = iris
head(df,2)

apply(X = df, MARGIN = 2, FUN = sum)             #error
apply(X = df[,-5], MARGIN = 2, FUN = mean)
apply(X = df[,-5], MARGIN = 2, FUN = max)
apply(X = df[,-5], MARGIN = 1, FUN = max)

df[, "max"] = apply(X=df[,-5], MARGIN = 1, FUN = max)
head(df)


#    - lubridate - ymd() 
#        + 숫자 또는 문자를 입력 받아 표준 날짜 형식을 반환하는 lubridate 함수
#    - lubridate - wday()
#        + 날짜 형식의 문자를 입력 받아 요일을 반환하는 lubridate 함수
#        + week_start 인자에 1을 입력할 경우, 월요일을 기준 값으로 산출

install.packages("lubridate")
library("lubridate")

bike = read.csv("../Rex/bike.csv")
bike

bike[1:4, "datetime"]
date(bike[1:4, "datetime"])
ymd(20771231)
ymd("2077/12/31")
month(bike[1:4, "datetime"])
year(bike[1:4, "datetime"])
day(bike[1:4, "datetime"])

wday(bike[1:4, "datetime"], week_start = 1)
wday(bike[1:4, "datetime"], label = TRUE)
wday(bike[1:4, "datetime"], week_start = 1, label = TRUE)

#    - fastDummies - dummy_cols() 
#       + 명목형 변수를 모델링 가능한 더미변수로 변환(OHE)해주는 fastDummies의 함수 
#       + select_columns 인자에 변환 대상의 명목변수를 지정  
#       + remove_first_dummy 인자에 TRUE를 지정할 경우 첫 번째 더미 변수 제외

head(bike,2)

install.packages("FastDummies")
library(fastDummies)

bike_dum1 = dummy_cols(bike, select_columns = "season")
bike_dum2 = dummy_cols(bike, select_columns = "season", remove_first_dummy = TRUE)

ncol(bike_dum1)
ncol(bike_dum2)

head(bike_dum1,2)
head(bike_dum2,2)

# Q1. temp 변수와 atemp 변수의 차이의 절대값의 평균은 
#    - bike.csv 파일 사용
#    - abs() 함수 활용
#    - 평균 연산 이전에 신규 파생변수 생성 필수
#   
#   1) 23.655 
#   2) 20.231
#   3) 12.452
#   4) 3.509

df = read.csv("../Rex/bike.csv")
df[, "diff"] = abs(df$temp - df$atemp)
head(df, 2)
round(mean(df$diff),3)

# Q2. Casual 값의 최대값이 25가 넘은 총 몇일인가?
#    - bike.csv 파일 사용 
#
#    1) 0
#    2) 1
#    3) 384
#    4) 345

df = read.csv("../Rex/bike.csv")
df[, "date"] = date(df$datetime)
head(df, 2)

df_up25 = df[df$casual > 25,]
length(unique(df_up25$date))

## alternative

df_max = aggregate(data = df,
                   formula("casual ~ date"),
                   FUN = "max")

head(df_max)
df_max = df_max[df_max$casual > 25,]
nrow(df_max)

# Q3. 시간대별 registered 평균을 산출했을 때 값이 가장 큰 시간은?
#     - bike.csv 파일 사용
#     - hour() 함수 활용
#
#     1) 16
#     2) 17
#     3) 18
#     4) 19

df = read.csv("../Rex/bike.csv")
df[, "hour"] = hour(df$datetime)
head(df, 2)

df_agg = aggregate(data = df, registered ~ hour, FUN = "mean")
head(df_agg)

df_agg[df_agg$registered == max(df_agg$registered), ]
df_agg[which.max(df_agg$registered), ]

