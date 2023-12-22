### 특정 지역의 지도 보기
#
# 서울 종로구 근방 지도 보기

library(ggmap)
register_google(key='Axxxxx')              # 구글키 등록

# gc = geocode(enc2utf8("달성군"))         ## ?? 구지면        
gc = geocode(enc2utf8("종로구"))           # 지점의 경도 위도  
gc

cen = as.nemeric(gc)                       # 경도 위도를 숫자로
cen

map = get_googlemap(center=cen,            # 지도 생성
                    zoom = 18,
                    maptype = "roadmap")   # hybrid
ggmap(map)                                 # 지도 화면 보이기
