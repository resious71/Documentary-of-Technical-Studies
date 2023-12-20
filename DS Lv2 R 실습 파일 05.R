#########  표본 추출
#
# 1. 표본 추출 개요
#    (확률적 표본 추출의 종류)
#   - 단순 임의 추출(Simple Random Sampling) : 별도의 규칙이 존재하지 않는 보통의 임의 추출
#   - 층화 표본 추출(Stratified Random Sampling) : 군집별로 지정한 비율 만큼의 데이터를 임의 추출
#   - 계통 추출(Systematic Sampling) : 첫 표본을 무작위로 추출하고 표집 간격 k만큼 떨어진 곳의 데이터 추출
#   - 군집 추출(Cluster Sampling) : 소수의 군집으로 분할하고 일정 수의 소집단을 임의 표본 추출 --> 주기성이 있는 경우 문제 발생 가능성

# 02. 데이터 소개 
#  자전거 대여 데이터 - bike.csv
#   - Capital Bikeshare의 미국 워싱턴 D.C에서 수집된 자전거 대여 이력 데이터
#   - kAGGLE에 공개된 연습용 대회인 Bike Sharing Demand의 Train 데이터

df = read.csv("../bike.csv")
head(df)

# 3. 주요 함수 소개 
# base-set.seed()
#   - 임의 확률 과정의 결과를 고정하기 위한 기본 함수 
#   - 함수 내에 자연수를 입력하여 결과를 고정
#   - 함수의 올바른 적용을 위해 관련 함수와 동시 실행 권장
# base-sample()
#   - 단순 임의 추출을 하기 위한 기본 함수
#   - size와 replace 인자에 각각 표본 추출 개수와 복원추출 여부 설정 가능

sample(1:10, size = 6)

set.seed(123)
sample(1:10, size = 6)
sample(1:10, size = 6, replace = TRUE)

# dplyr-sample_n()
#   - 단순 추출을 하기위한 dplyr의 함수
#   - size와 replace 인자에 각각 표본 추출 개수와 복원추출 여부 설정 가능
# dplyr-sample_frac()
#   - 단순 추출을 하기 위한 dplyr의 함수 
#   - size와 replace 인자에 각각 표본 추출 비율과 복원 추출 여부 설정 가능 

install.packages("dplyr")           # data + plyr
library(dplyr)

df=iris
set.seed(123)
sample_n(df, size=3)
sample_frac(df, size=0.1)   # 10%

install.packages("caTools")
library(caTools)
train_idx = sample.split(Y = df, SplitRatio = 0.7)
df_train = df[train_idx,]
df_test = df[!train_idx,]
nrow(df_train)
nrow(df_test)

# Q1. 주어진 데이터의 1.23%를 추출하면 몇 개의 행이 추출되는가?
#      - bike.csv 파일 사용
          
#       1) 123
#       2) 100
#       3) 108
#       4) 134

df = read.csv("../bike.csv")
nrow(df)
 
sub_df = sample_frac(df, 0.0123) 
nrow(sub_df)

# Q2. Season 기준 5%씩 추출되는 총 행의 개수는 ?
#      - bike.csv 파일 사용
# 
#       1) 545
#       2) 500
#       3) 544
#       5

head(df)
range(df$season)
unique(df$season)

sub_ss1 = df[df$season==1,]
sub_ss2 = df[df$season==2,]
sub_ss3 = df[df$season==3,]
sub_ss4 = df[df$season==4,]

nss1 = sample_frac(sub_ss1, 0.05)
nrow(nss1)
nss2 = sample_frac(sub_ss2, 0.05)
nrow(nss2)
nss3 = sample_frac(sub_ss3, 0.05)
nrow(nss3)
nss4 = sample_frac(sub_ss4, 0.05)
nrow(nss4)

total = nrow(nss1) + nrow(nss2) + nrow(nss3) + nrow(nss4)
print(total)

# group_by 함수 사용
df %>%
  group_by(season) %>%
  sample_frac(size=0.05) %>%
  as.data.frame() -> df_sub
nrow(df_sub)
 
# Q3. 학습과 평가용 데이터 시트로 8:2 분리 시 평가용 데이터의 평균 기온은?
#    - bike.csv 파일 사용
#    - Seed는 123으로 결정
#    - 표본 크기 결정 시 round() 함수 활용
#    - 표본추출 기준 인덱스는 학습 데이터 세트  
#
#     1) 9.84   
#     2) 12.28
#     3) 20.20
#     4) 18.04

df = read.csv("../Rex/bike.csv")

library(caTools)
set.seed(123)
#train_idx = sample.split(Y = df, SplitRatio = 0.8)
train_idx = sample(1:nrow(df), size=round(0.8 * nrow(df)))
df_train = df[train_idx,]
df_test  = df[-train_idx,]

nrow(df_train)
nrow(df_test)

head(df_test)
round(mean(df_test$temp), 3)

# smaple() --> 백터 ,  sample_frac( %) --> data.frame,  sample_n( size)  --> data.frame
