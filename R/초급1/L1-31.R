# 히스토그램 => 연속형 데이터를 구간별로 표시하는 그래프
cars
# 자동차의 제동거리만 dis라는 변수에 담고 있음
dist = cars[, 2]
hist( x = dist,
      breaks = 5,                      # 구간의 개수(막대의 개수와 동일)
      col = "green",                   # 막대의 색상
      border = "blue",                 # 막대의 테두리 색깔 
      xlab = "제동거리",
      ylab = " 빈도수",
      ylim = c(0,25),
      main = "제동거리",
      las = 1                        # X축 글씨 방향 (0~3)
)


###  내장 데이터셋 quakes
quakes
head(quakes, 4)
dim(quakes)

# 지진의 강도 
mag = quakes$mag
mag
summary(mag)

hist( x = mag,
      breaks = seq(4, 6.5, by = 0.5),          
      col = rainbow(5),              
      border = "black",                 
      xlab = "지진 강도",
      ylab = "발생 건도",
      main = "지진 발생 강도의 분포",
      las = 1                        
)

