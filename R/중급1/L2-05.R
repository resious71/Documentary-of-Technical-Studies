#### ggplot 패키지
#  - 지금까지는 그래프를 작성할 때 주로 R에서 제공하는 기본적인 함수들을 이용
#  -보다 미적인 그래프를 작성하려면 ggplot 패키지를 주로 이용
#  - ggplot은 R의 강점 중의 하나가 ggplot이라고 할 만큼 데이터 시각화에서 널리 사용
#  - ggplot은 복잡하고 화려한 그래프를 작성할 수 있다는 장점이 있지만, 그만큼 배우기 어려움
#  - ggplot2 패키지 설치 필요
#
# 1. ggplot 명령문의 기본 구조
#  - 하나의 ggplot() 함수와 여러 개의 geom_xx 함수들이 + 연결되어 하나의 그래프를 완성
#  - ggplot() 함수의 매개변수로 그래프를 작성할 때 사용할 데이터셋(data = xx)와 
#     데이터셋 안에서 x축, y축으로 사용할 열 이름(ase x=x1,y=x1)를 지정 
#  - 이 데이터를 이용해 어떤 형태의 그래프를 그릴지를 geom_xx()를 통해 지정
#    ex) geom_bar() : 막대그래프
#     ==> ggplot(data = xx, aes(x=x1, y=x2)) + 
#            geom_xx() +
#            geom_yy()  
#
# 2. 막대그래프 작성

library(ggplot2)
month = c(1,2,3,4,5,6)
rain  = c(56,50,45,50,60,70)
df = data.frame(month, rain)            # 그래프를 작성할 대상 데이터

ggplot(df, aes(x=month, y=rain)) +      # 그래프를 그릴 데이터 지정
   geom_bar(stat = "identity",          # 막대의 높이는 y축에 해당하는 열의 값 
            width =0.7,                 # 막대의 폭 지정   
            fill = "steelblue")         # 막대의 색 지정

###

ggplot(df, aes(x=month, y=rain)) +
   geom_bar(stat = "identity",
            width = 0.7,
            fill="steelblue") +
  ggtitle("월별 강수량") +
  theme(plot.title = element_text(size=25, face="bold", colour = "steelblue")) +
  labs(x="월", y="강수량") +
  coord_flip()                           # 그래프를 가로 방향으로 출력


# 3. 히스토그램 작성

library(ggplot2)

ggplot(iris, aes(x=Petal.Length)) +      # 그래프를 그릴 데이터 지정   
  geom_histogram(binwidth=0.5)          # 히스토그램 작성 

ggplot(iris, aes(x=Petal.Length, color=Species)) +        
  geom_histogram(binwidth=0.5, position = "dodge") +   # dodge는 막대들이 겹치지 않은 옵션
  theme(legend.position = "top")                       # 일반적으로 범례는 top으로

# 4. 산점도의 작성

ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()

ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + 
  geom_point(size = 3) +
  ggtitle("꽃잎의 길이와 폭") + 
  theme(plot.title = element_text(size=25, face="bold", colour = "steelblue"))




