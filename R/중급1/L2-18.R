### 지도 위에 데이터 표시하기

# 데이터 준비
library(ggmap)
library(ggplot2)

register_google(key="adfdaf....")

gc = geocode(enc2utf8("용인"))
gc

cen = as.numeric(gc)
cen

map = get_googlemap(center = cen,
                    maptype = "roadmap",
                    marker = gc)             # marker 매개변수 사용

head(wind)
dim(wind)

sp = sample(1:nrow(wind), 50)                              # 데이터 샘플링  
sp

df = wind[sp,]
df

cen = c(mean(df$lon), mean(df$lat))                        # 지도의 중심점 계산  
gc = data.frame(lon=df$lon, lat=df$lat)                    # 측정위치 좌표값 데이터
head(gc)

# 측정 위치에 마커 표시하기

map = get_googlemap(center=cen,
                    maptype="roadmap",
                    zoom=6,
                    marker=gc)
ggmap(map)

# 풍속을 원의 크기로 표시하기
map = get_googlemap(center=cen,                            # 마커없는 지도 가져오기
                    maptype="roadmap",
                    zoom=6,
                    marker=gc)
ggmap(map)                                                 # 지도를 저장
gmap + geom_point(data=df,
                  aes(x=lon, y=lat, size=spd),
                  alpha = 0.5,                             # 투명도
                  col = "green") +                             
  scale_size_continuous(range=c(1,14))                     # 원의 크기 조절     
