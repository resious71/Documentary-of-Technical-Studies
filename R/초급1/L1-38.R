# 선그래프 작성

month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
length(late)

plot(month,                                         # x data  
     late,                                          # y data
     main="지각생 통계",                            # 제목
     type = "o",                                    # 그래프의 종류 선택 (알파벳 소문자, l, b, s, o)
     lty = 2,                                       # 선의 종류 (숫자 1~6)
     lwd = 2,                                       # 선의 굵기 
     xlab = "Month",                                # x축 레이블  
     ylab = "Late Count",                           # y축 레이블
     ylim = c(1,15)                                 # y축의 범위를 지정
)


# 복수의 선그래프 작성
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
late3 = c(1,2,3,4,5,8,1,10,2,4,2,2)

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

lines(month,       
      late3,
      type="b",
      col = "black"
)

# 2015 ~ 2026년까지의 예상 인구수 추계 자료
year = c(2015:2026)
pop = c(51014, 51245, 51446, 51635, 51811, 51973, 52123, 52261, 
        52888, 52504, 52777, 51771)

length(year)
length(pop)

plot( x = year,
      y = pop,
      main = "인구수 추계",
      type = "s",
      col = "red",
      xlab = "연도",
      ylab = "인구수"
)


