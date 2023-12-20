# mlbench 패키지의 BostonHousing 데이터셋은 보스턴 지역의 지역 정보 및 평균 주택가격(medv) 정보가 저장되어 있다. 
# 다른 변수를 이용하여 medv를 예측하는 모델을 만드시오
# (단, chas 변수는 모델을 만들 때 제외한다.)

# (1) 전체 변수를 이용하여 평균 주택가격(medv)를 예측하는 회귀모델을 만들고 회귀식을 만드시오
# (2) 평균 주택가격(medv)을 예측하는데 도움이되는 변수들만 사용하여 예측하는 회귀모델을 만드시오
# (3) (1),(2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교해 보시오 


##################### (1)

library(mlbench)
data("BostonHousing")
head(BostonHousing)

ds = BostonHousing[, -4]
head(ds)

mod = lm(medv~., data = ds)
summary(mod)

# 회귀식 
medv = 36.891960  
       -0.113139 * ds$crim 
       + 0.047052 * ds$zn
       + 0.040311 * ds$indus  ...


coef(mod)
modv = coef(mod)[1] + coef(mod)[2]*ds$crim + coef(mod)[2]*ds$indus ...

################### (2)

library(MASS)
mod2 = stepAIC(mod)
mod

modv = coef(mod)[1] + coef(mod)[2]*ds$crim + coef(mod)[2]*ds$zn ...


################### (3)
summary(mod)                  # Adjusted R-squared:  0.7291
summary(mod2)                 # Adjusted R-squared:  0.7299

