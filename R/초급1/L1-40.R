# Boston Housing 데이터셋 분석 

# 1. 데이터 수집
# install.packages("mlbench")
library(mlbench)
data("BostonHousing")
BostonHousing
myds = BostonHousing[, c("crim", "rm", "dis", "tax", "medv")]
myds
nrow(myds)
head(myds,3)

# group 변수 추가 , 그룹별로 처리하기 위함

grp = c()

for(i in 1:nrow(myds)){
  
  if(myds$medv[i] >= 25.0){
    grp[i] = "H"
  }else if(myds$medv[i] <= 17.0){
    grp[i] = "L"
  }else{
    grp[i] = "M"
  }
}

grp = factor(grp)                             # 문자 벡터를 팩터 타입으로 변경
grp = factor(grp, levels=c("H","M", "L"))     # 레벨의 순서를 H, L, M --> H, M, L
myds = data.frame(myds, grp)                  # myds에 grp 열 추가 

str(myds)
head(myds)
tail(myds)
table(myds$grp)

#### 분석 시작
# 1. 히스토그램 작성

par(mfrow = c(2,3))
for(i in 1:5){
  hist(myds[,i], main=colnames(myds)[i], col="green")
}
par(mfrow = c(1,1))

# 2. Boxplot 
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm ~ myds$grp, main="방의 개수")
pairs(myds[, -6])


# 3. 그룹 정보를 포함한 변수 간 상관 관계 확인

point = as.integer(myds$grp)                       # 점 모양 지정
point
color = c("red", "green", "blue")                  # 점의 색 지정
pairs(myds[, -6], pch=point, col=color[point])

# 4. 변수간 상관계수의 확인
cor(myds[, -6])
