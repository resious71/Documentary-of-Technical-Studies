# 로지스틱 회귀분석  : 범주형 종속변수
# - 로지스틱 회귀란 회귀모델에서 종속변수 값의 형태가 연속형 숫자가 아닌 범주형 값인 경우를 다루기 위해 만들어진 통계적 방법
# - 주어진 데이터로부터 어떤 범주를 예측하는 분야를 회귀와 구분하여 분류라고 하며, 
# - 분류 문제를 회귀 방법으로 해결하고자 개발된 것이 로지스틱 회귀분석
# - iris 데이터 셋에서 4개의 측정값을 가지고 품종을 예측, 품종이 범주형 값
# - R에서는 로지스틱 회귀 모델은 glm() 함수를 이용

# 로지스틱 회귀 모델 만들기
iris.new = iris
iris.new$Species = as.integer(iris.new$Species)              # 범주형 자료를 정수로 변환, 로지스틱 회귀도 하나의 회귀기법이기 때문에 
head(iris.new)                                               # 종속 변수가 숫자로 표현되어야 한다. 
mod.iris = glm(Species~.,data=iris.new)
summary(mod.iris)

# 로지스틱 회귀분석을 이용한 예측
# - 수작업으로 계산해 품종을 예측하는 대신, 구해 놓은 회귀 모델을 이용해 보다 편리하게 품종을 예측

# 예측 대상 데이터 생성 (데이터 프레임)
unknown = data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) = names(iris)[1:4]
unknown                                                      # 예측 예상 데이터

pred = predict(mod.iris, unknown)                            # 품종 예측
pred                                                         # 예측 결과 출력
round(pred,0)                                                # 예측 결과 출력 (소수점 첫째 자리에서 반올림)

# 실제 품종명 알아보기
pred = round(pred, 0)
pred
levels(iris$Species)
levels(iris$Species)[pred]

# 다수의 데이터에 대한 예측
test = iris[, 1:4]                                           # 예측 대상 데이터 준비
pred = predict(mod.iris, test)                               # 모델을 이용한 예측
pred = round(pred,0)                                 
pred                                                         # 예측 결과 출력   
answer = as.integer(iris$Species)                            # 실제 품종 정보
pred == answer                                               # 예측 품종과 실제 품종이 같은지 비교 
acc = mean(pred == answer)                                   # 예측 정확도 계산
acc                                                          # 예측 정확도 출력  

# 일반적으로 예측 모델을 만들 때 사용하는 데이터를 훈련 데이터라고 부르며, 
# 예측 대상이 되는 데이터를 테스트 데이터라고 부른다.


