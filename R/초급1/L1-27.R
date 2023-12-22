# 단일변수 (범주형, 연속형)에 대한 분석 후 데이터 시각화 (그래프로 표현)

favorite = c("WINTER", "SUMMER", "SPRING", "SUMMER", "SUMMER",
             "SPRING", "FALL", "FALL", "SUMMER", "FALL")
class(favorite)
length(favorite)

table(favorite)                          # 범주형 데이터에서 빈도수 출력
table(favorite)/length(favorite)         # 비율 계산

ds = table(favorite)
class(ds)
str(ds)
ds                                       # factor

# 막대 그래프

c = c("green", "red", "yellow", "white")

barplot(ds, main="Favorite seasons", col = c)

# 원 그래프
pie(ds, main="Favorite seasons", col = c)


favorite.color = c(2,3,1,1,1,3,1,1,4,1,2,1)
length(favorite.color)
favorite.color
ds = table(favorite.color)
class(ds)

barplot(ds, main = "Favorite colors", col = c)

# names() 를 이용해 자료값에 이름 부여
names(ds) = c
barplot(ds, main = "Favorite colors", col = c)

pie(ds, main="Favorite seasons", col = c)


height = c(9, 15, 20, 6)
name = c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
barplot(height, names.arg = name, main="부서별 영업 실적", 
        col = rainbow(length(height)), xlab = "부서", ylab="엽업 실적(억원")

###
x = c(9, 15, 20, 6)
label = c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
pie(x, main="부서별 영업 실적")
pie(x, init.angle=90, labels=label, main="부서별 영업 실적")

pct = round(x/sum(x)*100)            # 각 항목의 비율
label = paste(label, pct)
label = paste(label, '%')
label
pie(x, init.angle=90, labels=label, col = rainbow(length(x)), main="부서별 영업 실적")

