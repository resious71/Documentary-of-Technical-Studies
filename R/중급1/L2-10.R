### 차원축소

library(Rtsne)
library(ggplot2)

ds = iris[, -5]
nrow(ds)

# 중복 데이터 제거 (2건)
dup = which(duplicated(ds))
dup
ds = ds[-dup,]
ds

ds.y = iris$Species[-dup]
ds.y

# 차원축소 실행함수
tsne = Rtsne(ds, dims = 2, perplexity=10)
tsne

# 축소결과 시각화
df.tsne = data.frame(tsne$Y)
head(df.tsne)

ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) + 
  geom_point(size=2)

# 3차원 산점도 작성

library(rgl)
library(car)
library(mgcv)
library(view3d)

tsne = Rtsne(ds, dims =3, perplexity=10)
df.tsne = data.frame(tsne$Y)
head(df.tsne)

scatter3d(x=df.tsne$X1, y = df.tsne$X2, z=df.tsne$X3)

point = as.integer(ds.y)
color = c("red", "green", "blue")

scatter3d(x=df.tsne$X1, y = df.tsne$X2, z=df.tsne$X3,
          point.col = color[point], 
          surface = F)
