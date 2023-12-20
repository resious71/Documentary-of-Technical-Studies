#### KNN(K-Nearest Neighbor)
#
# 1. KNN 개요
#   - KNN 분류(Classification)
#     + 새로운 값은 기존의 데이터를 기준으로 가장 가까운 K개의 최근접 값을 기준으로 분류   // 거리 계산 --> dist()
#     + K는 동류의 문제 때문에 짝수는 되도록 피하는 것이 좋음
#     + K가 1에 가까울수록 과적합, K가 클수록 과소적합이 되기 때문에 적절한 K값 선정 필요
#   - KNN 회귀(Regression) 
#     + 기본 개념은 분류모델과 같으며, k개의 인점한 자료의 (가중) 평균으로 예측
# 
# 2. 주요 함수
#   - caret-knn3()
#     + KNN 분류 모델을 학습하기 위한 caret의 함수
#     + x/y/k 인자에 각각 독립변수/종속변수/k를 지정
#     + 예측에 predict() 함수 사용시 평가 데이터에는 학습에 사용한 변수만 정확하게 할당해야 함
#   - caret-knnreg()
#     + KNN 회귀 모델을 학습하기 위한 caret의 함수  
#     + x/y/k 인자에 각각 독립변수/종속변수/k를 지정
#     + 예측에 predict() 함수 사용시 평가 데이터에는 학습에 사용한 변수만 정확하게 할당해야 함
# 

df = iris
head(df, 2)

library(caret)
model = knn3(x = df[, c("Petal.Length", "Petal.Width")],
             y = df$Species,
             k = 3)

# model = knn3(Species ~ Petal.Length + Petal.Width, df, 3)


model
summary(model)

pred = predict(model, df[, c("Petal.Length", "Petal.Width")])
class(pred)

df_pred = as.data.frame(pred)
head(df_pred)

df[, "pred_c_n"] = apply(df_pred, MARGIN = 1, FUN = which.max)
head(df_pred)

table(df[, c("Species", "pred_c_n")])

unique(df$Species)
df[df$pred_c_n == 1, "pred_c_n"] = "setosa"
df[df$pred_c_n == 2, "pred_c_n"] = "versicolor"
df[df$pred_c_n == 3, "pred_c_n"] = "virginica"
table(df[, c("Species", "pred_c_n")])


library("Metrics")

accuracy(df$Species, df$pred_c_n)

################################################################

model = knnreg(x = df[, c("Petal.Length", "Petal.Width")],
             y = df$Sepal.Width,
             k = 5)
model

pred = predict(model, df[, c("Petal.Length", "Petal.Width")])
pred

rmse(actual = df$Sepal.Width, predicted = pred)


############################################################
# Q1. 당뇨 발생 여부를 예측하기위해 임신 횟수, 혈당, 혈압을 사용할 경우 
#     그 정확도는 얼마인가?
#  - diabetes.csv 파일 사용
#  - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율은 70%
#  - seed는 123으로 설정
# 
#     1) 0.72
#     2) 0.64 
#     3) 0.84
#     4) 0.67

df = read.csv("../diabetes.csv")
head(df, 2)

library(caret)
library("caTools")
set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.7)

df_train = df[idx_train, ]
df_test  = df[!idx_train, ]
nrow(df_train)
nrow(df_test)

model = knn3(x = df_train[, c("Pregnancies", "Glucose", "BloodPressure")],
             y = factor(df_train$Outcome))

pred = predict(model, df_test[, c("Pregnancies", "Glucose", "BloodPressure")])

head(pred)
pred = ifelse(pred[,2]>0.5, 1,0)

library("Metrics")
accuracy(actual = df_test$Outcome, predicted = pred)

# Q2.종속변수를 당뇨 발병 여부로 하고, 임식 여부, 혈당, 혈압, 인슐린, 체질량지수를 
#    독립변수로 하여 정확도를 확인했을 때 그 K값과 정확도가 올바르게 연결되지 않은 것은?
#  - diabetes.csv 파일 사용
#  - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율은 80%
#  - seed는 123으로 설정
# 
#     1) K = 3, Acc = 0.73
#     2) K = 5, Acc = 0.78 
#     3) K = 10, Acc = 0.81
#     4) K = 20, Acc = 0.79
# 

library(caret)
library("caTools")
library("Metrics")

df = read.csv("../diabetes.csv")
df[, "is_preg"] = ifelse(df$Pregnancies > 0, 1, 0)
head(df, 2)

set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.8)

df_train = df[idx_train,]
df_test = df[!idx_train,]
nrow(df_train)
nrow(df_test)

x_cols = c("is_preg", "Glucose", "BloodPressure", "Insulin", "BMI")

df_acc = data.frame()

for(k in c(3,5,10,20)){
    print(k)
    model = knn3(x = df_train[, x_cols],
               y = factor(df_train$Outcome),
               k = k)
    pred = predict(model, df_test[, x_cols])
    pred = ifelse(pred[,2]>0.5, 1,0)
    
    df_acc_sub = data.frame(k = k, 
                            acc = accuracy(actual = df_test$Outcome,
                                          predicted = pred))

    df_acc = rbind(df_acc, df_acc_sub)    
}
df_acc


# Q3. 종속변수를 체질량지수로 하고, 임신여부, 혈당, 혈압, 인슐린을 독립변수로 하여 정확도를 확인했을 때  
#     그 K값과 RMSE가 올바르게 연결되지 않은 것은?
#  - diabetes.csv 파일 사용
#  - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비율은 80%
#  - seed는 123으로 설정
# 
#     1) K = 3,  RMSE = 7.976
#     2) K = 5,  RMSE = 7.996
#     3) K = 10, RMSE = 7.982
#     4) K = 20, RMSE = 7.521
#

library(caret)
library("caTools")
library("Metrics")

df = read.csv("../diabetes.csv")
df[, "is_preg"] = ifelse(df$Pregnancies > 0, 1, 0)
head(df, 2)

set.seed(123)
idx_train = sample.split(df, SplitRatio = 0.8)

df_train = df[idx_train,]
df_test = df[!idx_train,]

x_cols = c("is_preg", "Glucose", "BloodPressure", "Insulin")

df_rmse = data.frame()

for(k in c(3,5,10,20)){
  
  model = knnreg(x = df_train[, x_cols],
                 y = df_train$BMI,
                 k = k)
  pred = predict(model, df_test[, x_cols])

  df_rmse_sub = data.frame(k = k, 
                           rmse = rmse(actual = df_test$BMI,
                                        predicted = pred))
  
  df_rmse = rbind(df_rmse, df_rmse_sub)    
}
df_rmse


