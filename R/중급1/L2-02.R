## 3. 버블차트
#  - 버블 차트(bubble chart) : 산점도 위에 버블의 크기로 정보를 표시하는 시각화 방법
#  - 산점도가 2개의 변수에 의한 위치 정보를 표시한다면, 버블 차트는 3개의 벼눗 정보를 하나의 그래프로 표시

st = data.frame(state.x77)                      # 매트릭스를 데이터프레임으로 변환
symbols(st$Illiteracy, st$Murder,               # 원의 x, y 좌표의 열
        circles = st$Population,                # 원의 반지름의 열
        inches = 0.3,                           # 원의 크기 조절값
        fg = "white",                           # 원의 테두리 색
        bg = "lightgray",                       # 원의 바탕색
        lwd = 1.5,                              # 원의 테두리 두께
        xlab = "rate of Illiteracy",
        ylab = "crime rate",
        main = "Illiteracy and Crime")
text(st$Illiteracy, st$Murder,                  # 텍스트가 출력될 x, y 좌표
     rownames(st),                              # 출력할 텍스트
     cex = 0.6,                                 # 폰트 크기
     col = "brown")                             # 폰트 컬러   

#  - 문맹률이 높아질수록 범죄율이 증가하는 추세
#  - 인구수가 많은 곳에 범죄율도 높다.
#  - 범죄율이 가장 낮은 주는 North Dakota

## 4. 모자이크 플롯
#   - 다중변수 범주형 데이터에 대해 각 변수의 그룹별 비율을 면적으로 표시하여 정보를 전달
#   - 예제 데이터 : UCBAdmissions 
#      + 미국의 버클리대학교 대학원의 지원자와 합격자 통계를 성별, 학과별로 정리

head(mtcars)
mosaicplot(~gear+vs, data=mtcars, color=c("green", "blue"),
           main = "Gear and Vs")

# - 기어 개수는 5개가 가장 많다
# - 기어 개수 5개는 가장 드물다.
# - 엔진 ㅎ령태는 0과 1 정도가 반반 
# - 기어의 개수가 홀수인 경우는 0이 많고, 짝수인 경우는 1이 훨씬 많다.
