### 
# 
# library(ggmap)
# register_google(key='Axxxxx')              # 구글키 등록

gc = geocode(enc2utf8("용인"))
gc
cen = as.numeric(gc)
cen
map = get_googlemap(center = cen,            # 지도의 중심
                    maptype="roadmap",       # 지도의 형태
                    marker=gc)               # 마커의 위치
ggmap(map)
# 
# 
# 여러 마커

# library(ggmap)
# register_google(key='Axxxxx')              # 구글키 등록
library(ggplot2)

names = c("용두암", "성산일출봉", "정방폭포", "중문관광단지", "한라산1100고지", "차귀도")
addr = c("제주시 용두암길 15", "서귀포시 성산읍 성산지", "서귀포시 동홍동 299-3",
         "서귀포시 중문동 2624-1", "서귀포시 색달동 산 1-2", "제주시 한경면 고산리 123")

gc = geocode(enc2utf8(addr)) 
gc
# 관광지 명칭과 좌표값으로 데이터프레임 생성

df = data.frame(name = names,
                lon = gc$loc,
                lat = gc$lat)

df

cen = c(mean(df$lon), mean(df$lat))
map = get_googlemap(center=cen,
                    maptype = "roadmap",
                    zoom = 10,
                    size=c(640, 640),
                    marker=gc)
ggmap(map)

# 명소 이름 지도 위에 표시하기
gmap = ggmap(map)

gmap + gemo_text(data=df,                  # 지도 위에 텍스트 표시
                 aes(x=lon, y=lat),        # 텍스트 위치 (관광지 좌표)
                 size=5,                   # 텍스트 크기
                 label=df$name)            # 텍스트 내용
# 
# 
#
