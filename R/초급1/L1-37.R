### 선그래프의 작성

month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,                                         # x data  
     late,                                          # y data
     main="지각생 통계",                            # 제목
     type = "l",                                    # 그래프의 종류 선택 (알파벳 소문자, l, b, s, o)
     lty = 1,                                       # 선의 종류 (숫자 1~6)
     lwd = 1,                                       # 선의 굵기 
     xlab = "Month",                                # x축 레이블  
     ylab = "Late Count"                           # y축 레이블
)

# - 다중변수 자료의 변수 중 하나가 연원일과 같이 시간을 나타내는 값의 경우
#   x축을 시간축으로 하여 선그래프를 그리면 시간의 변화에 따른 자료의 증감 추이를 쉽게 확인 가능
# - 시간의 변화에 따라 자료를 수집한 경우, 이를 시계열 자료(time series data)라고 함
# - 선그래프는 시계열 자료의 내용을 파악하는 가장 기본적인 방법 

# 복수의 선그래프 작성

month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)

plot(month,                                         # x data  
     late1,                                          # y data
     main="지각생 통계",                            # 제목
     type = "b",                                    # 그래프의 종류 선택 (알파벳 소문자, l, b, s, o)
     lty = 1,                                       # 선의 종류 (숫자 1~6)
     col = "red",
     lwd = 1,                                       # 선의 굵기 
     xlab = "Month",                                # x축 레이블  
     ylab = "Late Count",                           # y축 레이블
     ylim=c(1,15)
)

# lines() 함수는 plot() 함수로 작성한 그래프 위에 선을 겹쳐서 그리는 역할을 한다. 
lines(month,       
      late2,
      type="b",
      col = "blue"
)

###############################################################################
# Boston Housing 데이터 셋
# - 미국 보스턴 지역의 주택 가격 정보와 주택 가격에 영향을 미치는 여러 요소들에 대한 정보를 담고 있음
# - 총 14개 변수로 구성되어 있는데, 여기에는 이중에서 5개의 변수만 선택해 분석 
# mlbench 패키지에서 제공

library(mlbench)
data("BostonHousing")
BostonHousing

