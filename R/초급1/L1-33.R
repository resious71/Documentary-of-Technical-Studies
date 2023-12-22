###  다중 변수 자료의 탐색 ex) iris
# 
# 산점도
#  - 다중변수 자료(또는 다변량 자료) : 변수가 2개 이상인 자료
#  - 다중변수 자료는 2차원 형태를 나타내며, 이는 매트릭스나 데이터프리임에저장하여 분석
#  - 산점도(scatter plot)란 2개의 변수로 구성된 자료의 분포를 알아보는 그래프

# 1. 두 변수 사이의 산점도
#   - mtcars 데이터셋에서 자동차의 중량(wt)와 연비(mpg) 사이의 관계

wt = mtcars$wt                             # 중량자료
mpg = mtcars$mpg                           # 연비자료
plot(wt, mpg, 
      main = "중량 연비 그래프",
      xlab = "중량",                       # x축 레이블
      ylab = "연비",                       # y축 레이블
      col = "red",                         # point의 color
      pch = 19)                            # point의 종류

# 산점도는 2개의 변수로 구성된 자료의 분포를 알아보는 기법임을 기억하자. 
# 또한, 두 변수의 데이터 분포를 나타내는 것이기에 두 개의 변수에 대한 자료가 필요하다. 
# - 중량이 증가할수록 연비는 감소하는 경향

# 2. 여러 변수들 간의 산점도
# - 산점도는 기본적으로 2개의 변수에 대해 작성 --> 여러 변수의 자료의 경우 다소 불편
#    ==> pairs 함수를 이용하면 편리하다.

head(mtcars,2)
vars = c("mpg", "disp", "wt")                          # 대상 변수
target = mtcars[, vars]
head(target)
pairs(target, main="Multiple Plots")


# 3. 그룹 정보가 있는 두 변수의 산점도 
#  - 그룹 정보를 알고 있다면 산점도를 작성 시 각 그룹별 관측값들을 다른 색깔과 점의 모양으로 표시할 수 있음
#  - 이렇게 작성된 산점도는 두 변수 사이의 관계 뿐 아니라 그룹 간의 관계도 파악할 수 있어서 편리

iris.2 = iris[,3:4]             
point = as.numeric(iris$Species)                      # 점의 모양
point
color = c("red", "green", "blue")                     # 점의 컬러
plot(iris.2,
     main = "Iris plot",
     pch = c(point),
     col = color[point])

# - Patal.Lengh(꽃잎의 길이)의 길이가 길수록 Patal.Width(꽃잎의 폭)도 커짐
# - Setosa 품종은 다른 두 품종에 비해 꽃잎의 길이와 폭이 확연히 작음
# - Virginica 품종은 다른 두 품종에 비해 꽃잎의 길이와 폭이 제일 큼
# - 산점도를 그릴 때 그룹 정보를 표시하면 변수 간의 관계와 그룹 간의 관계를 함께 관찰할 수 있다. 

