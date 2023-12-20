####  로지스틱 회귀분석
#
# 1. 로지스틱 회귀분석 개요
#    - 로지스틱 회귀분석 특징
#      + 이항 로지스틱 회귀분석은 종속변수가 0과1이며 베르누이 분포를 따를 경우 사용 
#      + 모델의 산출 값은 각 데이터가 1이 될 확률이며, 이진 분류를 위해서 경계값(threshold)이 필요
#      + 모델 평가를 위해 각종 분류 관련 지표 및 AUC 활용
#    - 승산비(OR, Odds Ratio)
#      + 특정 독립벼눗를 제외한 나머지 값을 고정하고, 해당 독립변수가 1 증가시 변화하는 승산(odds)의 비
#      
# 2. 주요 함수 소개 
#    - base - glm()
#      + 일반화 선형모형 학습을 위해 사용하는 기본 함수
#      + family 인자에 "binomial"을 입력하면 이항 로지스틱 회귀 학습 가능
#      + 출력 객체의 coefficients 리스트에서 독립 변수 계수 및 절편 정보 확인 가능
#      + exp() 함수를 활용하여 OR 연산 가능

df = iris
head(df, 2)

df[, "is_setosa"] = (df$Species == "setosa") + 0
head(df, 2)

table(df[, c("Species", "is_setosa")])

model = glm(is_setosa ~ ., data = df[, -5], family = "binomial")
summary(model)

pred = predict(model, newdata = df[, -5],
               type = "response")

head(pred)

pred_class = (pred > 0.5) + 0
table(df$is_setosa, pred_class)

#    - Metrics - accuracy()
#      + 분류 정확도(accuracy)를 산출하는 Metrics의 함수
#      + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출 
#    - Metrics - precision()
#      + 분류 정밀도(precision)를 산출하는 Metrics의 함수
#      + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출 
#    - Metrics - recall()
#      + 분류 재현율(recall)를 산출하는 Metrics의 함수
#      + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출 
#    - Metrics - f1()
#      + 분류 결과로 부터 f1 값을 산출하는 Metrics의 함수
#      + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출
#    - Metrics - auc()
#      + 실제값과 예측 확률값을 사용하여 ROC 곡선의 AUC를 산출하는 Metrics의 함수
#      + actual과 predicted 인자에 실제값과 예측값을 할당하여 결과 산출

library(Metrics)
accuracy(actual = df$is_setosa, predicted = pred_class)
f1(actual = df$is_setosa, predicted = pred_class)

df2 = iris
head(df2, 2)
unique(df2$Species)
df2[, "is_v"] = (df2$Species == "virginica") + 0
head(df2, 2)
table(df2[, c("Species", "is_v")])

model2 = glm(is_v ~ ., data = df2[, -5], family = "binomial")
summary(model2)

pred2 = predict(model2, df2[, -5])
pred2_class = (pred2 > 0.5) + 0

table(df2$is_v, pred2_class)
accuracy(actual = df2$is_v, predicted = pred2_class)
recall(actual = df2$is_v, predicted = pred2_class)


model2$coefficients
model2$coefficients[2]
exp(model2$coefficients[2])          # Odd RATIO

auc(actual = df2$is_v, predicted = pred2_class)   # error 없음 , 실제 값이 아닌 확률 값을 넣어야 함

################################################################################
#
# 1. 독립변수를 혈압, 혈당, BMI, 인슐린으로 하고 종속변수를 당뇨 여부로 할 경우,
#    분류 정확도는 얼마인가?
#    - diabetes.csv 파일 사용
#    - caTools 패키지의 sample.split() 함수를 활용하고 비율은 80%으로 설정
#    - seed를 123으로 설정
#
#    1) 0.74
#    2) 0.73
#    3) 0.72
#    4) 0.71

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

library(caTools)
set.seed(123)

idx_train = sample.split(df, SplitRatio = 0.8)
df_train = df[idx_train, ]
df_test = df[!idx_train, ]

model = glm(formula = "Outcome ~ BloodPressure + Glucose + Insulin",
            data = df_train,
            family = "binomial")
pred = predict(model, df_test, type = "response")
pred_class = ifelse(pred > 0.5, 1, 0)
accuracy(actual = df_test$Outcome, pred_class)

# Q2. 독립변수를 혈당, BMI,나이로 하고 종속변수를 당뇨 여부로 할 경우 
#      나이의 승산비는 얼마인가?
#      - diabetes.csv 파일 사용
#
#      1) 0.02
#      2) 1.03
#      3) 1.05
#      4) 0.99

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

model = glm(formula = "Outcome ~ Glucose + BMI + Age",
            data = df_train,
            family = "binomial")
exp(model$coefficients)
round(exp(model$coefficients),3)

# Q3. 독립변수를 혈당, BMI, 나이로 하고 종속변수를 당뇨 여부로 할 경우
#     모델의 AUC는 얼마인가?
#     - diabetes.cvs 파일 사용
#
#     1) 0.84
#     2) 0.83
#     3) 0.82
#     4) 0.81

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

model = glm(formula = "Outcome ~ Glucose + BMI + Age",
            data = df,
            family = "binomial")
pred = predict(model, df, type = "response")
pred_class = ifelse(pred > 0.5, 1, 0)
auc(actual = df$Outcome, pred)           ## 주의 pred_class가 아닌 pred로 해야 함

###############################################################################
# 
# glm(
#      formula   # 모델 포뮬러 
#      data      # 포뮬러를 적용할 데이터 
#      family    # 오차 분포와 링크 함수, 로지스틱 회귀 모델의 경우 "binomial"로 지정
# )

# predict(
#      object      # glm 객체
#      newdata     # 예측을 수행할 대상 데이터
#      type = c("link", "response", "terms")
#          # 예측 결과의 유형 지정 , default = link
#          # link: 선형 독립 변수들의 연산 결과의 크기로 값을 반환
#          # response: 반응변수의 크기로 값을 변환하며 로지스틱 회귀의 경우 확률
#          # terms: 행렬에 모델 포뮬러의 각 변수에 대한 적합된 값을 선형 예측 변수의 크기로 반환
# )

