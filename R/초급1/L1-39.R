###############################################################################
# Boston Housing 데이터 셋
# - 미국 보스턴 지역의 주택 가격 정보와 주택 가격에 영향을 미치는 여러 요소들에 대한 정보를 담고 있음
# - 총 14개 변수로 구성되어 있는데, 여기에는 이중에서 5개의 변수만 선택해 분석 
# mlbench 패키지에서 제공

library(mlbench)
data("BostonHousing")
BostonHousing

# 변수 : 설명
# crim : 지역의 1인당 범죄율
# rm : 주택 1가구당 방의 개수
# dis : 보스턴의 5개 직업 센터까지의 거리
# tax : 재산세율
# medv : 주택 가격

myds = BostonHousing[, c("crim", "rm", "dis", "tax", "medv")]
myds

# grp 변수 추가 
# - grp는 주택 가격을 상(H), 중(M), 하(L)로 분류한 것으로 25.0 이상이면 상(H), 
#   17.0 이하이면 하(L), 나머지는 중(M)으로 분류

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
table(myds$grp)

# 히스토그램에 의한 관측값의 분포 확인
par(mfrow = c(2,3))
for(i in 1:5){
  hist(myds[,i], main=colnames(myds)[i], col="green")
}
par(mfrow = c(1,1))
# - rm(방의 개수), medv(주택가격), 변수만 종 모양의 정규분포에 가깝고, crim(1인당 범죄율), 
#   dis(직업센터까지의 거리)는 관측값들이 한쪽으로 쏠려서 분포함
# - tax는 중간에 관측값이 없는 빈 구간이 존재하는 특징임
# - 이런 경우는 데이터 분석결과를 부동산 전문가와 함께 분석을 해볼 필요성이 있음

# 그룹별 관측값 분포 확인

boxplot(myds$crim~myds$grp, main="1인당 범죄율")
# - 주택 가격이 높은 지역이나 중간 지역의 범죄율이 낮고, 주택 가격이 낮은 지역의 범죄율이 높게 나타남

boxplot(myds$rm ~ myds$grp, main="방의 개수")
# - 주택 가격이 높으면 방의 개수도 많다는 것을 알 수 있음
# - 주택 가격이 중간인 지역과 하위인 지역의 방의 개수 평균은 큰 차이가 나지 않음
# - 중간 그룹의 방의 개수가 5.2~6.8 사이로 비교적 균일한 반면 하위그룹의 방의 개수는 
#   4.5~7.2 사이로 넓게 퍼져 있는 것을 알 수 있음

# 다중 산점도를통한 변수 간 상관 관계의 확인
pairs(myds[, -6])

# - medv(주택 가격)과 양의 상관성이 있는 변수 rm(가구당 방의 개수)인데,
#   가구당 방의 개수가 많으면 집이 넓으니 주택 가격이 높을 것으로 보임
# - 상태적으로 crim(1인당 범죄율)은 주택 가격과 음의 상관성이 있는 것으로 보이는데,
#   이것은 범죄율이 높을수록 주택 가격이 떨어진다는 의미로 해석이 가능함

# 그룹 정보를 포함한 변수 간 상관 관계 확인

point = as.integer(myds$grp)                       # 점 모양 지정
color = c("red", "green", "blue")                  # 점의 색 지정
pairs(myds[, -6], pch=point, col=color[point])

# - (crim-medv), (rm-medv), (dis-medv), (tax-medv) 산점도에서 그룹별로 분포 위치가 뚜렷하게 구분
# - 주택 가격 중간 그룹(녹색)은 상위그룹(빨강),하위그룹(파란색)에 비해 주택 가격 변동폭이 좁음 

# 변수간 상관계수의 확인
cor(myds[, -6])


