### 특정 지역의 지도 보기
#
# 서울 종로구 근방 지도 보기

library(ggmap)
register_google(key='Axxxxx')              # 구글키 등록
 
gc = geocode(enc2utf8("종로구"))           # 지점의 경도 위도  
gc

cen = as.nemeric(gc)                       # 경도 위도를 숫자로
cen

map = get_googlemap(center=cen)            # 지도 생성
ggmap(map)                                 # 지도 화면 보이기


# 설악산 근방의 지도 보기

# library(ggmap)
# register_google(key='Axxxxx')              # 구글키 등록

gc = geocode(enc2utf8("설악산"))             # 지점의 경도 위도  
gc

cen = as.nemeric(gc)                         # 경도 위도를 숫자로
cen

map = get_googlemap(center=cen,              # 지도 중심점 좌표
        zoom=9,                              # 지도 확대 정도
        size=c(640,640),                     # 지도의 크기
        maptype="roadmap")                   # 지도의 유형
ggmap(map)                                   # 지도 화면 보이기

# 3. 경도와 위도 값을 입력하여 지도 보기
#  - 지명으로 지도를 가져올 수도 있고, 경도와 위도의 값으로 지도를 가져올 수도 있음

# library(ggmap)
# register_google(key='Axxxxx')              # 구글키 등록

cen = c(-118.233248, 34,08015)               
map = get_googlemap(center=cen)              # 지도 생성
ggmap(map)                                   # 지도 화면에 보이기

#
#
