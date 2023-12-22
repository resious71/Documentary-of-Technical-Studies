### 차원축소
#
# 1. 차원 축소의 개념
#  - 산점도는 2차원 평면상에 두 변수의 값으로 좌표로 정하여 위치를 나타내는 방법으로
#    데이터의 분포를 관찰할 수 있는 시각화 도구
#  - 변수가 4개인 4차원 데이터에 대한 산점도는 어떻게 그릴 수 있는가? --> 4차원을 2차원으로 축소
#  - 차원 축소(dimension reduction)란 고차원 데이터를 2,3 차원 데이터로 축소하는 기법을 말하는데
#    2,3 차원으로 축소된 데이터로 산점도를 작성하여 데이터 분포를 확인하면 고차원상의 데이터 분포를 추정 가능
#  - 어떻게 차원을 축소하는가? --> 3차원상의 물체에 빛을 비추면 2차원 평면에 물체의 그림자가 
#    생기는 것과 비슷한 방법 (3차원이 2차원으로 축소됨)
#  - 데이터의 차원을 축소하면 원래 가지고 있던 정보의 손실이 일어남
#
# 2. R을 이용한 차원 축소
# 2.2 4차원을 2차원으로 축소 

library(Rtsne)  
library(ggplot2)
ds = iris[, -5]                                   # 품종 정보 제외

# 중복 데이터 제거
dup = which(duplicated(ds))
dup                                              # 143번째 행 중복
ds = ds[-dup,]                           
ds.y = iris$Species[-dup]

# t-SNE 실행
tsne = Rtsne(ds, dims=2, perplexity=10)          # 중복을 제외한 품종 정보

# 축소 결과 시각화
df.tsne = data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) + 
  geom_point(size=2)

# 2.2 4차원 데이터를 3차원 산점도로 작성하기

install.packages(c("rgl", "car"))
library("car")
library("rgl")
library("mgcv")

tsne = Rtsne(ds, dims=3, perplexity=10)
df.tsne = data.frame(tsne$Y)
head(df.tsne)

# 회귀면이 포함된 3차원 산점도
scatter3d(x=df.tsne$X1, Y=df.tsne$X2, z=df,tsne$X3)

# 회귀면이 없는 3차원 산점도
points = as.integer(ds.y)
color = c('red','green','blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df,tsne$X3,
          points.col = color[points],      # 점의 색을 품종별로 다르게
          surface=F)                        # 회귀면을 표시하지 않음  

