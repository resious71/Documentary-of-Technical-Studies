# 다중변수 자료의 분석과 탐색
# 산점도 : 2개의 변수로 구성된 자료의 분표를 알아보는 그래프

mtcars
dim(mtcars)
class(mtcars)


wt = mtcars$wt                           # 중량자료 추출
mpg = mtcars$mpg                         # 연비 추출

# plot()는 2개의 변수를 가지고 산점도를 그린다.
plot(x = wt, y = mpg,
     main = "중량-연비 그래프",
     xlab = "중량",
     ylab = "연비",
     col = "blue",
     pch = 19)


# 여러 변수들 간의 산점도는 pairs()를 이용하면 된다.

vars = c("mpg", "disp", "drat", "wt")    # 문자형 백터 
target = mtcars[, vars]
head(target, 4)
class(target)

pairs(target,
      main="다중 변수 그래프")

# 그룹정보가 있는 산점도
irisdata = iris[, 3:4]
head(irisdata)
point = as.numeric(iris$Species)   # Species는 품종 팩터타입 --> 숫자 타입으로 변환
point
class(point)
color = c("red", "green", "blue")

plot(x = irisdata,
     main = "품종별 산점도",
     pch=c(point),
     col = color[point])

pairs(x = irisdata,
     main = "품종별 산점도",
     pch=c(point),
     col = color[point])


