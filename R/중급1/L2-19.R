
#### 공공 데이터 포탈  // data.go.kr
# 도로교통공단_시도_시군구별_월별_교통사고(2018)

library("ggmap")
library("ggplot2")

register_google(key="...")

ds.tot = read.csv("도로교통공단_시도_시군구별_월별_교통사고(2018).csv")
ds.tot

df.seoul = subset(ds.tot, 시도 = "서울")
df.seoul                                                 

ds.year = aggregate(ds.seoul[, '발생건수'], by = list(시군구=df.seoul$시군구),
                    FUN=sum)
ds.year

gc = geocode(enc2utf8(as.vector(ds.year$시군구)))
gc 

cen = colMeans(as.matrix(gc))
cen

map = get_googlemap(center=cen,
                    size = c(640, 640),
                    zoom=12,
                    maptype="roadmap")
ggmap(map)

gmap = ggmap(map)
gmap + gemo_point(data = data.frame(gc),
                  aes(x=lon, y=lat, size=ds.year$x),
                  alpha=0.5,
                  col="red") +
  scale_size_continuous(range = c(1,14))


