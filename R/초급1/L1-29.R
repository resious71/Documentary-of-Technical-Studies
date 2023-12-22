## 단일변수의 연속형 자료에 대한 분석 
# . 평균과 중앙값

weight = c(60,62,64,65,68,69)
weight.heavy = c(weight, 120)
weight
weight.heavy

# 평균값 비교
# 이상치에 영향을 많이 받음
mean(weight)
mean(weight.heavy)

# 중앙값 비교   -->  중앙값을 데이터을 일렬로 나열할 때, 가운데 있는 값
# 이상치에 영향을 덜 받음
median(weight)
median(weight.heavy)

# 절사 평균
mean(weight, trim=0.2)
mean(weight.heavy, trim=0.2)

# 사분위수에 대한 이해하기
data = c(60, 62, 64, 65, 68, 69, 120)
quantile(data)                              # 사분위수를 구하는 함수  - 25% 단위가 기본
quantile(data, probs = (0:10/10))           # 10% 단위로 끊어서 출력함

summary(object=data)                        # 기본적인 6개 값이 산출된다.

# 산포도 : 평균값을 기준으로 하여 관측값이 퍼저있는 정도를 나타내는 척도
# - 분산과 표준편차를 이용

mydata = c(1:10)
var(mydata)
sd(mydata)

mydata2 = c(60, 62, 64, 65, 68, 69, 120)
mean(mydata2)
var(x = mydata2)

# diff()를 통해 나온 값이 클수록 평균과 많은 관측값들이 떨어져 있다. 
diff(x = range(mydata2))

