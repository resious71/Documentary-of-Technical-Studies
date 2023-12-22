#### 지도와 데이터 
#
# 4. 지도위에 데이터 표시
#  - 구글맵 위에는 마커나 텍스트뿐만 아니라 ggplot 패키지를 이용하여 원과 같은 도형도 표시할 수 있음
#  - ggmap 패키지에서 제공하는 wind 데이터셋을 이용하여 지도 위에 데이터를 표시하는 방법을 실습
#  - wind 데이터셋은 미국 루이지애나주 부근의 여러 지점에서 측정한 바람에 대한 정보를 담고 있으며
#    다음 예제에서 측정 위치에서의 풍속(spd)를 원의 크기로 표현
#

library(ggmap)
sp = sample(1:nrow(wind), 50)                              # 50개 데이터 샘플링
df = wind[sp,]
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
                  col = "blue") +                             
  scale_size_continuous(range=c(1,14))                     # 원의 크기 조절     






