###  상관분석
# 
# 1. 상관관계 개요
#   - 다양한 상관분석
#      + 두 변수의 선형 관계를 확인하기 위해 상관분석을 실시
#      + 두 수치형 변수의 비교는 Pearson's Correlation Coefficient를 확인하며 그 외의 다양한 상관계수가 존재
#      + 상관계수가 0에 가까울수록 선형관계가 약하며, 절대값이 1에 가까울수록 선형관계가 강함
#      + 상관계수가 나와도 산점도를 통해 선형성을 확인해야 함  
#  
#                   |  Quantiative    |       Ordinal       |    Nominal
#    -----------------------------------------------------------------------
#     Quantiative   |  Pearson's      |     Biserial        |   Point Biserial
#     Ordinal       |   Biserial      |   Spearnam/Kendal   |   Rank Biserial
#     Nominal       | Point Biserial  |    Rank Biserial    |  Phi, L, C Lamdba
#                        양적변수             순서형             명목형
#
# 2. 주요 함수 소개
#   - base-cor()
#      + 상관계수를 산출하는 기본 함수
#      + method 인자에 pearson/spearman/Kendall을 입력 시 각각의 상관분석 계수를 산출
#      + 데이터프레임 형태로 두 개 이상의 변수를 한 번에 입력 가능
#   - base-cor.test()
#      + 상관계수 검증을 실시하는 기본함수
#      + 두 개의 1차원 벡터를 입력  
#      + method 인자에 pearson/spearman/kendal을 입력 시 각각의 상관분석 계수를 산출    
#      + 검정통계량, 신뢰구간 등 상세한 상관계수 검증 결과 확인 가능


cor(c(1,3,5,7), 
    c(2,4,6,15))

cor.test(c(1,3,5,7), 
         c(2,4,6,15))            # p-value가 0.05 이하여야 의미

###
bike = read.csv("../bike.csv")
head(bike,2)

t(t(colnames(bike)))

bike_sub = bike[, 8:12]
head(bike_sub)

cor(bike_sub$casual, bike_sub$registered)
cor.test(bike_sub$casual, bike_sub$registered)

cor(bike_sub[, c("casual", "registered")])
cor(bike_sub[, c("casual", "registered")], 
    method = "kendall")

cor(bike_sub)
round(cor(bike_sub),2)


################################################################################
# Q1. 기온, 체감온도, 상대습도, 총 자전거 대여 숫자의 상관관계를 분석하였을 때,
#     가장낮은 상관계수는 얼마인가.
#   - bike.csv 파일 사용
#   - 데이터 속성에 맞는 적절한 상관분석 기법 사용
#   - 자전거 대여 숫자는 casual 변수 사용
# 
#    1) - 0.04
#    2) - 0.35
#    3) - 0.31
#    $  - 0.24

head(bike)
bnames = c("temp", "atemp", "humidity","casual")
round(cor(bike[, bnames]),2)

cor.test(bike$temp, bike$atemp)

# Q2. 계절별로 체감온도와 자전겨 대여 숫자의 상관관계를 알아보고자 한다. 
#     이때 적절한 상관분석 기법을 사용하였을 때 상관 계수로 옳은 것은
#   - bike.csv 파일 사용
#   - 데이터 속성에 맞는 적절한 상관분석 기법 사용
#   - 자전거 대여 숫자는 casual 변수 사용  
#
#    1) 봄: 0.444
#    2) 여름: 0.378
#    3) 가을: 0.382
#    4) 겨울: 0.478

## 필터링이 아닌 AGGREGATE() 함수를 사용하면 ..

df = read.csv("../Rex/bike.csv")
head(df, 2)

for(season in unique(df$season)){
    corr = cor(df[df$season == season, "atemp"],
               df[df$season == season, "casual"])
    print(paste0("season ", season, ": ", round(corr, 3)))
}

aa = df[df$season == 1, c("atemp", "casual")]


library("dplyr")
df %>%
  group_by(season) %>%
  summarise(corr = cor(atemp, casual)) %>%
  as.data.frame()

# Q3. 날씨에 따른 기온과 자전거 대여의 상관계수 변화를 알아보고자 한다.
#     날씨가 맑은 날과 그렇지 않은 날의 상관계수 차이의 절대값은 얼마인가?
#   - bike.csv 파일을 사용하며 weather 변수의 값이 1인 것이 맑은 날
#   - 자전거 대여 숫자는 casual 변수를 사용
#
#       1) 0.464
#       2) 0.448
#       3) 0.167 
#       4) 0.025

df = read.csv("../bike.csv")
head(df, 2)

df[, "is_sunny"] = (df$weather == 1) + 0
head(df, 2)

cor_0 = cor(df[df$is_sunny == 0, "temp"],
            df[df$is_sunny == 0, "casual"])

cor_1 = cor(df[df$is_sunny == 1, "temp"],
            df[df$is_sunny == 1, "casual"])

round(abs(cor_0 - cor_1),3)
