# 회귀분석 
# 단순선형 회귀분석
# 용어 
   - 독립변수(independent variable) : 영향을 미치는 요인들 , 설명변수(Expalnatory variable)
   - 종속변수(dependent variable) : 독립변수의 영향에 따라 값이 결정, 반응변수(response variable)
   - 예측모델(prediction model) 또는 예측모형: 독립변수에 해당하는 자료와 종속변수에 해당하는 자료를 모아 관계를 분석하고
                                이를 예측에 사용할 수 있는 통계적 방법으로 정리한 것 
   - 회귀분석(regression analysis): 회귀 이론을 기초로 독립 변수가 종속 변수에 미치는 영향을 파악하여 
                                예측 모델을 도출하는 통계적 방법
   - 독립 변수가 하나인 경우 "단순 회귀(simple regression)", 독립 변수가 두 개 이상인 경우 "다중 회귀(multiple regression)"

# 회귀식                                                        
  - 회귀식 : y = Wx + b   --> W와 b를 구하자.  R에서는 lm()을 통해 구함
  - 단순 선형회귀: 독립변수와 종속변수 사이의 선형 관계를 파악하고 이를 예측에 활용하는 통계적 방법
    ex) 기온(x) 자료를 가지고 아이스크림 판매량(y)를 예측하는 문제 
  - 단순 선형 회귀모델이나 단순 선형 회귀식은 1차식 형태를 가짐
  
head(cars)    
plot(dist~speed, data=cars)                  # 산점도를 통해 선형 관계 확인 // 선형 관계가 없다면 회귀식을 구하는 의미가 없다.
                                             # //종속변수~독립변수 순서로 지정해야 함 (순서 주의)
model = lm(dist~speed, cars)                 # 회귀모델 구하기
model
       
abline(model)                                # 회귀선을 산점도 위에 표시
coef(model)[1]                               # b 값 출력
coef(model)[2]                               # W 값 출력

# 주행속도에 따른 제동거리 구하기

b = coef(model)[1]
W = coef(model)[2]

speed = 30                                   # 주행 속도
dist = W*speed + b                      
dist                                         # 제동 거리

speed = 35
dist = W*speed + b
dist

speed = 40
dist = W*speed + b
dist

# 단순 회귀식을 예측할 때 실제값과 오차가 존재한다. 
# 예상 제동거리, 실제 제동거리, 오차 구하기

speed = cars[,1]
pred = W*speed + b
pred

compare = data.frame(pred, cars[,2], pred-cars[,2])
colnames(compare)=c("예상", "실제", "오차")
head(compare)


