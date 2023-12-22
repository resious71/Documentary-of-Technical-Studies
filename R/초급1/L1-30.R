### 히스토그램
#  - 히스토그램은 외관상 막대 그래프와비슷한 그래프로 연속형 자료의 분포를 시각화할 때 사용
#  - 막대 그래프를 그리려면 값의 종류별 개수를 셀 수 있어야 하는데, 키와 몸무게등의 자료는 값의 종류라는 개념이 없어서
#    종류별로 개수를 셀 수 없음
#  - 대신 연속형 자료에서는 구간을 나누고 구간에 속하는 값들의 개수를 세는 방법을 사용

dist = cars[, 2]                                     # 자동차 제동거리
hist(dist,                                          # 자료
     main = "제동거리 히스토그램",                  # 제목   
     xlab = "제동거리",                             # X축 레이블
     ylab = "빈도수",                               # Y축 레이블
     border = "blue",                               # 막대 테두리색
     col = "green",                                 # 막대 색
     las = 2,                                       # X축 글씨 방향(0~3)
     breaks = 5)                                    # 막대 개수 조절

# - 히스토그램은 외관산 막대그래프와 유사
# - 일반적으로 막대 사이에 간격이 있으면 막대 그래프, 간격 없이 막대들이 붙어 있으면 히스토그램
# - 막대 그래프에서는 막대의 면적이 의미가 없지만, 히스토그램에서는 막대의 면적도 의미가 있음

### 상자그림(box plot)
# - 상자그림은 상자수연 그림(box and whisker plot)으로도 부르며, 사분위수를 시각화하여 그래프 형태로 나타낸 것
# - 하나의 그래프로 데이터의 분포 형태를 포함한 다양한 정보를 전달하기 때문에 
#   단일변수 수치형 자료를 파악하는 데 자주 사용
# - https://codedragon.tistory.com/7012 

dist = cars[, 2]                                     # 자동차 제동거리
boxplot(dist, main="자동차 제동거리")
# boxplot() 함수를 통해 그린 박스상자 그림의 구체적인 수치를 알고 싶다면
# boxplot.stats()를 사용하면 된다.
boxplot.stats(dist) 

### 그룹이 있는 자료의 상자 림
boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")


### 하나의 화면에 여러 개의 그래프 출력

par(mfrow=c(1,3))                                  # 1x3 가상화면 분할
barplot(table(mtcars$carb),
        main="CARBURETERS",
        xlab="# of carburetors",
        ylab="frequency",
        col="blue")
barplot(table(mtcars$cyl),
        main="CYLENDER",
        xlab="# of cylinder",
        ylab="frequency",
        col="red")
barplot(table(mtcars$gear),
        main="GEAR",
        xlab="# of gear",
        ylab="frequency",
        col="green")
par(mfrow=c(1,1))                                # 가상화면 분할 해제


