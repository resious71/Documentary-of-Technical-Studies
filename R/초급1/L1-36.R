# 상관 분석 

#음주량
beers = c(5,2,9,8,3,7,3,5,3,5)
# 혈중 알콜 농도
bal = c(0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05)

data = data.frame(beers, bal)
dim(data)
head(data)

# 산점도 그리기
plot(bal~beers, data)
# lm()은 회귀식을 구하는 함수
res = lm(bal~beers, data)
class(res)

abline(res)

# 상관계수를 구하는 함수
# -1 <= r <= 1
cor(beers, bal)
cor.test(beers, bal)

### iris 데이터셋의 4개의 변수의 상관계수
cor(iris[, 1:4])

cor(mtcars$mpg, mtcars$disp)     # 연비와 배기량  --> 상관 계수가 -1에 가깝다.
plot(mtcars$mpg, mtcars$disp)

cor(mtcars$mpg, mtcars$wt)       # 연비와 중량

