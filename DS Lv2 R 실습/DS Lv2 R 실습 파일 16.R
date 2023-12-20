#### 나이브 베이즈
#
# 1. 나이브 베이즈 개요
#   - 나이브 베이즈 분류기 특징
#      + 사전 확률 및 추가 정보를 기반으로 사후 확률을 추론하는 통계적 방법인 베이즈 추정 기반 분류
#      + 종속변수 각 범주의 등장 빈도인 사전확률(prior) 설정이 중요
#      + 각 데이터의 사전 확률을 기반으로 사후확률(posterior)을 계산
#
#       p(A|B) = P(A intersection B) / P(B)
#
# 2. 주요 함수 소개   
#   - e1071 - naiveBayse()
#     + 나이브베이즈 분류를 하기 위한 e1071의 함수
#     + predict() 함수로 예측값을 생산할 때 type에 "raw"를 할당
#     + 이진 분류를 예측하는 경우 산출되는 예측갑의 두 번째 변수가 목표 확률값

df = iris
head(df, 2)

df[, "is_setosa"] = ifelse(df$Species == "setosa", 1, 0)
head(df, 2)
table(df[, c("Species", "is_setosa")])

library("e1071")

model = naiveBayes(is_setosa ~ . , data = df[, -5])
model

pred = predict(model, newdata = df[, -5],
               type = "raw")

head(pred)
pred[, 2]

pred_class = ifelse(pred[,2] > 0.5, 1, 0)
pred_class

library("Metrics")
accuracy(actual = df$is_setosa,
         predicted = pred_class)

table(df$is_setosa, pred_class)

############################################################################### 
# 
# Q1. BMI가 0 초과인 데이터만 사용하여 나이브 베이즈 분류를 실시하고자 한다.
#     Outcome을 종속변수로 하고 나머지 변수를 독립벼눗로 할 때 종속변수의 사전 확률은?
#     - diabetes.csv 파일 사용
#     - Outcome 1을 대상으로 사전확률을 계산
#
#     1) 0.68
#     2) 0.64
#     3) 0.35
#     4) 0.41

df = read.csv("../Rex/diabetes.csv")
head(df,2)

df_sub = df[df$BMI != 0, ]
head(df_sub, 2)

prop.table(table(df_sub$Outcome))

# model = naiveBayes(Outcome ~ ., df)
# model

# Q2. 혈당, 혈압, 나이를 독립변수로 하고 당뇨 발병 여부를 종속변수로 했을 때 
#     그 정확도는 얼마인가?
#     - diabetes.csv 파일 사용
#     - Outcome 1을 대상으로 사전확률을 계산한다.    
#
#     1) 77%
#     2) 76%
#     3) 74%
#     4) 72%

df = read.csv("../Rex/diabetes.csv")
head(df,2)

model = naiveBayes(Outcome ~ Glucose + BloodPressure + Age,
                   data = df)
pred = predict(model, df, type = "raw")
pred = pred[,2]

library("Metrics")
accuracy(actual = df$Outcome,
         predicted = ifelse(pred > 0.5, 1, 0))

# Q3. 임신여부, 연령대, BMI, 혈당을 독립변수로 하고 당뇨 발병 여부를 종속변수로 했을 때,
#     나이브 베이즈와 로지스틱 회귀 분석을 실시하고 둘 중 정확도가 높은 모델의 정확도는? 
#     - diabetes.csv 파일 사용  
#     - caTools 패키지의 sample.split() 함수를 활용하고 학습 데이터 비유은 80%로 설정
#     - seed는 123
#     - 연령대는 Age가 21인 경우 20으로, 39일 경우 30으로 계산
#     - 예측 확률값을 구분하기 위한 임계값(threshold)는 0.5한다.
# 
#     1) 72%
#     2) 73%
#     3) 74%
#     4) 75%

df = read.csv("../Rex/diabetes.csv")
head(df,2)

df = df[df$BMI > 0, ]
df[ , "is_preg"] = ifelse(df$Pregnancies > 0, 1, 0)
df[ , "Age_g"] = (df$Age %/% 10 * 10)
head(df)

library(caTools)
set.seed(123)

idx_train = sample.split(df, SplitRatio = 0.8)

df_train = df[idx_train,]
df_test  = df[!idx_train,]

nrow(df_train)
nrow(df_test)

model_n = naiveBayes(Outcome ~ is_preg + Age_g + BMI + Glucose,
                       data = df_train)
pred_n = predict(model_n, df_test, type = "raw")
pred_n = pred_n[,2]

acc_n = accuracy(actual = df_test$Outcome, 
                 predicted = ifelse(pred_n > 0.5, 1, 0))

acc_n

model_l = glm(Outcome ~ is_preg + Age_g + BMI + Glucose,
                     data = df_train,
                     family = "binomial")
pred_l = predict(model_l, df_test, type = "response")
acc_l = accuracy(actual = df_test$Outcome, 
                 predicted = ifelse(pred_l > 0.5, 1, 0))

acc_l

