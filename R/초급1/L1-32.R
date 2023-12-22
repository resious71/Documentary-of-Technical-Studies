# 박스상자그림 - boxplot()

dist = cars$dist
dist
str(dist)
class(dist)

quantile(dist)
summary(dist)

boxplot(x=dist, main="자동차 제동거리")

# 위의 박스상자의 수치적인 내용을 알고 싶으면 stats()를 사용하면 된다.
boxplot.stats(dist)

#### 내장 데이터셋을 이용하여 boxplot() 그리기

# Petal.Length를 기준으로 품종별로 boxplot 그리기
boxplot(Petal.Length~Species, data = iris,
        main = "품종별 꽃잎의 길이")

#####
mag = quakes$mag
head(mag)
boxplot(x=mag, main="지진 발생 강도 분포", 
        xlab="지진", ylab="발생 건수", col = "green")
boxplot.stats(mag)

#### 화면 분할
View(mtcars)
dim(mtcars)

par(mfrow = c(2,2))           # 화면 분할하는데 2행 2열의 차트를 표시
barplot(table(mtcars$carb), 
        main = "Carb boxplot",
        xlab = "Carb",
        ylab = "Freqeuncy",
        col = "blue")

barplot(table(mtcars$cyl), 
        main = "Cyl boxplot",
        xlab = "Cyl",
        ylab = "Freqeuncy",
        col = "green")

barplot(table(mtcars$gear), 
        main = "Gear boxplot",
        xlab = "Gear",
        ylab = "Freqeuncy",
        col = "orange")

barplot(table(mtcars$carb), 
        main = "Carb boxplot",
        xlab = "Carb",
        ylab = "Freqeuncy",
        col = "brown")

par(mfrow = c(1,1)) 
