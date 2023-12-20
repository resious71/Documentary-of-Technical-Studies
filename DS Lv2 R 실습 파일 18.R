####  의사결정나무 모델: 분류 및 회귀나무
# 
# 1. 의사결정나무 모델 개요
#    - 분류나 예측      
#    - 분류 나무 (Classification Tree)
#       + 종속변수가 명목형인 경우 사용하는 의사결정나무 모델
#       + 범주형 목표 변수를 기준으로 마디를 나눔 ==> 끝마디에 포함된 자료의 범주가 분류 결과 값이 됨 
#       + 각 노드 분류 알고리즘은 이진 분류 시 지니지수(Gini index) 기반의 CART 사용
#       + 과적합 방지 및 모델 단순화를 위해 Depth, Impurity 등 관련 설정 활용 
#    - 회귀 나무(Regression Tree) : 예측
#       + 종속변수가 연속형인 경우 사용하는 의사결정나무 모델
#          ==> 끝마디에 포함된 자료의 평균값이 각 끝마디의 회귀값이 됨 
#       + 각 노드 분류에는 평균과 표준편차를 활용
#       + 과적합 방지 및 모델 단순화를 위해 Depth, Impurity 등 관련 설정 활용
# 
# 2. 주요 함수 소개
#    - rpart - rpart()
#       + 의사결정나무 알고리즘을 수행하기 위해 사용하는 rpart 함수
#       + 종속변수 속성에 따라서 자동으로 분류 또는 회귀 모델을 생성
#       + 모델 학습 세부 설정은 controls 인자에 rpart.control() 함수로 지정
#    - rpart - rpart.control() 
#       + rpart() 함수로 의사결정나무 모델 학습 시, 세부 설정을 지정하는 rpart의 함수
#       + 모델 생성 최대 깊이인 maxdepth 등 다양한 인자로 세부 설정 가능

install.packages("rpart")
library("rpart")

df = iris
df[ , "is_setosa"] = (df$Species == "setosa") + 0
head(df, 2)

model = rpart(is_setosa ~ ., data = df[, -5])
model
plot(model)

install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(model)

model = rpart(is_setosa ~ ., data = df[, -5],
              control = rpart.control(maxdepth = 2))
model
rpart.plot(model)

####
bike = read.csv("../Rex/bike.csv")
head(bike,2)
model = rpart(registered ~ temp + humidity + weather,
              data = bike)
rpart.plot(model)

model = rpart(registered ~ temp + humidity + weather,
              data = bike,
              control = rpart.control(maxdepth = 1))
rpart.plot(model)

################################################################################
# Q1. 당뇨병 발병 여부를 예측하기 위하여 의사결정나무를 사용하고자 한다.
#     이때 혈당, 혈압 임신 횟수를 기반으로 예측했을 때 예측 정확도는?
#     - diabetes.csv 파일 사용
#     - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율을 80%으로 설정
#     - seed를 123으로 설정
#
#     1) 69%
#     2) 70%
#     3) 71%
#     4) 72%

df = read.csv("../Rex/diabetes.csv")
head(df,2)
df[, "Outcome"] = as.character(df$Outcome)

library(caTools)
set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.8)
df_train = df[idx_train, ]
df_test = df[!idx_train, ]
nrow(df_train)
nrow(df_test)

head(df_train,2)
model = rpart(formula = Outcome ~ Glucose + BloodPressure +  Pregnancies, 
                data = df_train)
pred = predict(model, df_test)
head(pred)
pred_class = ifelse(pred[, 2] > 0.5, 1,0)

library(Metrics)
accuracy(actual = df_test$Outcome, predicted = pred_class)
  
# Q2. 환자의 BMI를 예측하기 위하여 회귀나무를 사용하고자 한다. 이 때 혈당, 혈압, 
#     피부 두께를 독립변수로 했을 경우 RMSE는 얼마인가?
#     - diabetes.csv 파일 사용
#     - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율을 80%으로 설정
#     - seed를 123으로 설정
#
#     1) 7.0
#     2) 7.1
#     3) 7.2
#     4) 7.3

df = read.csv("../Rex/diabetes.csv")
head(df,2)

library(caTools)
set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.8)
df_train = df[idx_train, ]
df_test = df[!idx_train, ]
nrow(df_train)
nrow(df_test)

model = rpart(formula = BMI ~ Glucose + BloodPressure +  SkinThickness, 
              data = df_train)
pred = predict(model, df_test)

rmse(actual = df_test$BMI, predicted = pred)

# Q3. 분류나무의 파라미터를 바꿔가면서 성능 평가를 하려고 한다.
#     당뇨 발병 여부를 종속변수로 하고 혈당, 혈압, 임신 횟수, BMI, 나이를 
#     독립변수로 하고 Depth를 3에서 6까지 변화시킬 때 그 결과로 틀린 것은?
#     - diabetes.csv 파일 사용
#     - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율을 70%으로 설정
#     - seed를 345으로 설정
#
#     1) Depth 3, 정확도: 0.75 
#     2) Depth 4, 정확도: 0.76
#     3) Depth 5, 정확도: 0.75
#     4) Depth 6, 정확도: 0.78

df = read.csv("../Rex/diabetes.csv")
head(df,2)
df[, "Outcome"] = as.character(df$Outcome)

library(caTools)
set.seed(345)
idx_train = sample.split(df, SplitRatio = 0.7)
df_train = df[idx_train, ]
df_test = df[!idx_train, ]
nrow(df_train)
nrow(df_test)

library(Metrics)
df_acc = data.frame()
for(depth in 3:6){
  model = rpart(formula = Outcome ~ Glucose + BloodPressure + Pregnancies + Age, 
                data = df_train,
                control = rpart.control(maxdepth = depth))
  pred = predict(model, df_test)
  pred_class = ifelse(pred[,2] > 0.5, 1, 0)
  
  df_acc_sub = data.frame(depth = depth,
                          acc = accuracy(actual = df_test$Outcome,
                                         predicted = pred_class))
  df_acc = rbind(df_acc, df_acc_sub)
}
df_acc



