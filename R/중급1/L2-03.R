### 트리맵
library("treemap")
data("GNI2014")
head(GNI2014)
dim(GNI2014)

treemap( 
  GNI2014, 
  index = c("continent", "iso3"),  # 계층구조(대륙-국가)
  vSize = "population",            # 타일의 크기
  vColor = "GNI",                  # 타일의 컬러  
  type = "value",                  # 타일 컬러링 방법
  #bg.labels = "red",
  title = "World Incomes & Population"
)


###
st = data.frame(state.x77)
head(st)
st = data.frame(st, stname=rownames(st))  # 주의 이름을 stname으로 추가함

treemap( 
  st,
  index = c("stname"),             # 주 이름
  vSize = "Area",                  # 타일의 크기
  vColor = "Income",               # 타일의 컬러  
  type = "value",                   # 타일 컬러링 방법  cf) index, dens
  #bg.labels = "red",
  title = "State's Area & Income"
)

### Bubble Chart ("산점도 위에 버블의 크기로 정보를 표시)
st = data.frame(state.x77)
symbols(st$Illiteracy, st$Murder, 
        circles = st$Population,         # 원으로 나타낼 데이터
        inches = 0.3,                    # 원의 반지름
        fg = "white",                    # 원의 테두리 색
        bg = "lightgray",                # 원의 바탕색 
        lwd = 1.5,
        xlab = "rate of Illiteracy",
        ylab = "crime",
        main = "Crime rate by Illiteracy"
)

text(st$Illiteracy, st$Murder, 
     rownames(st),
     cex = 0.6,
     col = "black"
)



