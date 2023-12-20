#### 다중 회귀분석
#
# 1. 다중 회귀분석 개요
#    - 다중 회귀 분석 특징
#      + 연속형 종속변수와 두 개 이상의 독립변수간 선형관계 및 설명력을 확인하는 기법
#      + 필요시 모델 성능 향상을 위한 파생변수 생성 및 성능 비교 필요
#      + 명목형 변수가 독립변수인 경우, 가변수 변환 후 모델 적합
#    - 다중공선성 문제
#      + 독립변수 간 강한 상관관계를 나타내는 문제
#      + 상관계수를 확인하여 그 값이 높은 것을 사전에 제거
#      + 회귀 모델 생성 이후 분산팽창계수(VIF) 확인(10 이상)하여 관련 변수 처리
#      + 상관계수 행렬도 
#    
# 2. 주요 함수 소개
#    - car - vif()
#      + 모델의 다중공선성 평가 척도인 VIF를 확인하는 car의 함수
#      + 입력은 lm() 함수로 생성한 모델객체를 사용
#    - fastDummies - dummy_cols()
#      + 범주형 컬럼을 지정하여 더미 컬럼 생성
#      + 다중공선성 제거를 위해 remove_first_dummy = TRUE
#      + 원래 커럼을 제거하기 위해  remove_selected_columns = TRUE

bike = read.csv("../Rex/bike.csv")
head(bike, 2)

round(cor(bike[, -1]), 2)

t(t(colnames(bike)))

bike_sub = bike[, 5:10]
head(bike_sub, 2)

model1 = lm(casual ~ . - windspeed, data = bike_sub)
summary(model1)

library(car)
vif(model1)
cor(bike_sub$temp, bike_sub$atemp)  # 다중공선성 문제가 발생하면 1개만 남기고 제거 

model2 = lm(casual ~ . - windspeed - atemp, data = bike_sub)
summary(model2)
vif(model2)

library(fastDummies)

bike_sub$weather

bike_sub_dum = dummy_cols(bike_sub,
                          select_columns = "weather")
head(bike_sub_dum)

model3 = lm(casual ~ . - windspeed, data = bike_sub_dum)
summary(model3)


bike_sub_dum = dummy_cols(bike_sub,
                          select_columns = "weather",
                          remove_first_dummy = TRUE)
head(bike_sub_dum)
model4 = lm(casual ~ . - windspeed -weather, data = bike_sub_dum)
summary(model4)


# Q1. Price를 종속변수로 하고 나머지 수치형 변수를 독립변수로 했을 때,
#    다중공선성의 문제가 있다고 판단되는 변수의 개수는?
#    - diamonds.csv 파일 사용
#    
#    1) 5개
#    2) 4개
#    3) 3개
#    4) 2개

df = read.csv("../Rex/diamonds.csv")
head(df)

t(t(colnames(df)))
df_model = df[, c(1, 5:10)]
head(df_model, 2)

model = lm(formula = "price ~ .", data = df_model)
summary(model)

vif(model)               # 값이 10 이상인 것...

# Q2. price를 종속변수로 하고 carat과 depth를 독립변수로 하여
#    생성한 선형 회귀 모델을 사용하여 알아본 carat이 1이고 depth가 60, table이 55인
#    다이아몬드의 가격은 얼마인가?
#    - diamonds.csv 파일 사용   
# 
#    1) 2818
#    2) 3219
#    3) 4912
#    4) 5681

df = read.csv("../Rex/diamonds.csv")
head(df)

model = lm(formula = "price ~ carat + depth",
           data = df)
df_test = data.frame(carat = 1, depth = 60, table = 55)
pred = predict(model, df_test)
round(pred)

###  cf) 수식으로 처리  price = 4045.333 + (7765.141*carat) + (-102.165*depth)
round(4045.333 + (7765.141*1) + (-102.165 * 60))

# Q3. price를 종속변수로 하고 carat, color, depth를 독립변수로 하여 생성한
#     선형회귀 모델을 사용하여 알아본 carat이 1이고 depth가 50, 
#      color가 E인 다이아몬드의 가격은 얼마인가?
#      - diamonds.csv 파일 사용
#      - 가변수 생성시 remove_first_dummy 인자를 활용하여 가변수 하나 제거
# 
#      1) 6885
#      2) 2142
#      3) 2840
#      4) 4351

df = read.csv("../Rex/diamonds.csv")
head(df)

df_model = df[, c("price", "carat", "color", "depth")]

library(fastDummies)
df_dum = dummy_cols(df_model, select_columns = "color",
                    remove_first_dummy = T,
                    remove_selected_columns = T)
head(df_dum, 2)

model = lm(formula = "price ~ .", 
           data = df_dum)
df_test = df_dum[1,]
df_test

df_test[, "carat"] = 1
df_test[, "depth"] = 50
df_test

predict(model, df_test)

###
### 3 
dia = read.csv("../Rex/diamonds.csv")
head(dia, 2)

library(fastDummies)

dia_dummy = dummy_cols(dia,
                       select_columns = "color",
                       remove_first_dummy = T)

head(dia_dummy,2)

model = lm(price~carat+depth+color_E+color_F+color_G+color_H+color_I+color_J, dia_dummy)
model

test = data.frame( carat   = 1,  
                   depth   = 50,    
                   color_E = 1,      
                   color_F = 0,      
                   color_G = 0,      
                   color_H = 0,      
                   color_I = 0,    
                   color_J = 0)

pred = predict(model, test)
pred
