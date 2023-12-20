#### 단순 회귀분석
# 1. 단순회귀 분석 개요
#   - 단순 회귀분석의 특징
#     + 연속형 종속변수와 독립변수간 선형 관계 및 설명력을 확인하는 기법
#     + 종속변수와 독립변수가 각각 하나인 경우의 단순 선형 회귀 모형
#     + 설명력과 더불어 오차 평가 지표로 모델의 성능을 평가
#
# 2. 주요 함수 소개  
#   - base-formula() : 텍스트 입력을 formula로 바꿔주는 기본함수 
#   - base-lm() : 선형회귀분석을 실시하는 기본함수
#       + 주로 데이터프레임 형태의 데이터를 입력하여 선형회귀분석 실시
#       + formula 인자에는 텍스트 또는 formula() 함수를 활용하여 종속변수와 독립변수 지정
#       + summary() 함수에 lm() 함수로 생성한 모델 객체를 입력하여 분석 레포트 출력
#   - base-predict() : 학습한 모델을 기반으로 예측값을 생성할 때 사용하는 기본 함수 
#       + 모델과 모델 기반 예측값을 생산할 데이터 필요

df = iris
head(df,2)

model = lm(Sepal.Length ~ Sepal.Width, data=df)
# model = lm(formula("Sepal.Length ~ Sepal.Width"), data=df)
summary(model)

model2 = lm(Petal.Length ~ Petal.Width, data=df)
summary(model2)

pred = predict(model2, df)
pred

# 2. 주요 함수 소개 
#   - Metrics - mse() : Mean Squared Error를 계산하는 Metrics의 함수
#       + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출
#   - Metrics - rmse() : Root Mean Squared Error를 계산하는 Metrics의 함수
#       + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출
#   - Metrics - mae() : Mean Absolute Error 를 계산하는 Metrics의 함수
#       + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출
#   - Metrics - mape() : Mean Absolute Percentage Error를 계산하는 Metrics의 함수 
#       + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출

install.packages("Metrics")
library(Metrics)
rmse(actual = df$Petal.Length, predicted = pred)

### 
# 3. 선형회귀 분석의 4가지 주요 가정
#    - 선형성
#    - 정규성
#    - 등분산성  : 산점도, 히스토그램, Q-Q Plot, 왜도와 첨도
#    - 독립성
#    ==> 선형성을 제외한 속성은 모두 error에 관한 사항
#     N(O, a^2)iid

# 선형성이 없는 경우 --> 데이터 변환, 다항회귀, 가법 모형 (smooth function)
# 정규성 문제 --> 데이터 변환, 일반화 선형 모델
# 등분산성 문제 --> 데이터 변환(이상치 제거), 가중 선형 회귀 (분산 역수 --> 계산량이 크다) :: 잔차 그래프로 확인   
# 독립성 문제 --> 자기 회귀 모델 (평활법 ???)   
#
# 4. 다른 이유가 있는 데이터
#    - Outlines: 데이터변환, Robust Regression,Quantile Regression
#    - 다중공선성: 독립변수 간 상관관계가 있는 경우 --> 상관분석, VIF로 확인  
#         --> Feature Engineering, Regularization (Ridge/LASSO, Elastic, PCR, PLS)
#
#    - 잔차분석   
#       + 잔차 시간화를 통한 회귀 분석 가정 검토 : 등분산 여부 확인 
#    - R^2 : 결정계수  --> 완전한 지표가 아니며, 예측 오차가 아닌 인과 관계에 대한 지표
#       + 변수간 영향을 주는 정도, 또는 인과 관계의 정도를 정량화해서 나타낸 수치
#       + 추정한 선형 모형이 주어진 자료에 얼마나 적합한지 나타냄
#       + 0 <= R^2 <= 1
#       + 독립변수를 추가하면 R^2 값이 상승함  --> Adjusted R^2 사용 

################################################################################
# 종속변수를 registered, 독립변수를 temp로 했을 때 결정계수는?
#   - bike.csv 파일 사용
#   - dplyr 패키지 함수를 활용하고 학습 데이터 비율을 70%로 설정
#   - seed를 123으로 설정
#    
#   1) 0.106 
#   2) 0.101
#   3) 0.152
#   4) 0.116

library(dplyr)

df = read.csv("../Rex/bike.csv")
head(df, 2)
nrow(df)

set.seed(123)
df_train = sample_frac(df, size = 0.7)
nrow(df_train)

model = lm(registered ~ temp, df_train)
summary(model)

###
# 결정계수란(R square)?
#  - 모형의 "설명력"을 뜻함
#  - 회귀식을 통해서 계산된 예측 값이 실제 y값을 얼마나 설명하는지를 뜻함
#     + 의미없는 독립변수의 추가는 R-squared의 값을 약간 증가시킬 수 있다.
#     + 높은 R-Squared는 과적합 문제로부터 자유롭지 않다. (표본을 랜덤하게, Test와 Train으로 구분) 
# 수정된 결정계수(adjusted R square)는 언제 필요?
#  - 다변량 회귀분석에서는 독립변수가 유의하든, 유의하지 않든 독립변수의 수가 많아지면 결정계수(R square)가 높아짐
#  - 이러한 결정계수의 단점을 보완하기 위해 수정된 결정계수가 필요
###


# Q2. 종속변수를 casual, 독립변수를 atemp로 했을 때 RMSE는
#   - bike.csv 파일 사용
#   - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율을 70%으로 설정
#   - seed를 123으로 설정
#
#   1) 1957.2  
#   2) 44.2
#   3) 23.3
#   4) 48.1

library(caTools)
library(Metrics)

df = read.csv("../Rex/bike.csv")
head(df, 2)
nrow(df)

set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.7)

df_train = df[idx_train,]
df_test  = df[!idx_train, ]
nrow(df_train)
nrow(df_test)

model = lm(casual ~ atemp, df_train)
pred = predict(model, df_test)
rmse (df_test$casual, pred)

# Q3. 종속변수를 casual, 독립변수를 atemp로 했을 때 여름과 겨울의 RMSE 차이는 ?
#   - bike.csv 파일 사용
#   - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율을 70%으로 설정
#   - seed를 123으로 설정
#   - RMSE의 차이는 절대값을 취함
# 
#    1) 41.1
#    2) 49.8
#    3) 14.3
#    4) 12.4

library(caTools)
library(Metrics)

df = read.csv("../Rex/bike.csv")
head(df, 2)
nrow(df)

df_s2 = df[df$season == 2,]
df_s4 = df[df$season == 4,]

set.seed(123)
idx_train_s2 = sample.split(df_s2, SplitRatio = 0.7)
idx_train_s4 = sample.split(df_s4, SplitRatio = 0.7)
head(idx_train_s2)

df_train_s2 = df_s2[idx_train_s2,]
df_test_s2  = df_s2[!idx_train_s2,]
df_train_s4 = df_s4[idx_train_s4,]
df_test_s4  = df_s4[!idx_train_s4,]

nrow(df_train_s2)
nrow(df_test_s2)

model_s2 = lm(casual ~ atemp, df_train_s2)
pred_s2 = predict(model_s2, df_test_s2)
rmse_s2 = rmse(actual = df_test_s2$casual, predicted = pred_s2)
rmse_s2

model_s4 = lm(casual ~ atemp, df_train_s4)
pred_s4 = predict(model_s4, df_test_s4)
rmse_s4 = rmse(actual = df_test_s4$casual, predicted = pred_s4)
rmse_s4

abs(rmse_s2 - rmse_s4)
