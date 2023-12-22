### ggplot 실습
install.packages(ggplot2)
library(ggplot2)

### barc hart

month = c(1,2,3,4,5,6)
rain  = c(56,50,45,50,60,70)
df = data.frame(month, rain)            # 그래프를 작성할 대상 데이터
df 

ggplot(df, aes(x=month, y=rain)) +      # 그래프를 그릴 데이터 지정
  geom_bar(stat = "identity",           # 막대의 높이는 y축에 해당하는 열의 값 
           width =0.5,                  # 막대의 폭 지정   
           fill = "steelblue")          # 막대의 색 지정

### 제목 + 가로 표시 막대 그래프

ggplot(df, aes(x=month, y=rain)) +
  geom_bar(stat = "identity",
           width = 0.7,
           fill="steelblue") +
  ggtitle("월별 강수량") +
  theme(plot.title = element_text(size=25, face="bold", colour = "steelblue")) +
  labs(x="월", y="강수량") +
  coord_flip()                           # 그래프를 가로 방향으로 출력


### 히스토그램

ggplot(iris, aes(x=Petal.Length)) +      # 그래프를 그릴 데이터 지정   
  geom_histogram(binwidth=0.5)          # 히스토그램 작성 

ggplot(iris, aes(x=Petal.Length, color=Species)) +        
  geom_histogram(binwidth=0.5, position = "dodge") +   # dodge는 막대들이 겹치지 않은 옵션
  theme(legend.position = "top")                       # 일반적으로 범례는 top으로


# 산점도 

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, color=Species, shape=Species)) + 
  geom_point(size=3) +
  ggtitle("꽃잎의 길이와 폭") +
  theme(plot.title = element_text(size=25, face="bold", colour = "blue"))


