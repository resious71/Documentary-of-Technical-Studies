# 상자그림

library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length)) + 
  geom_boxplot(fill="yellow")

ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + 
  geom_boxplot()

# 선그래프의 작성

library(ggplot2)

year = 1937:1960
cnt  = as.vector(airmiles)
df   = data.frame(year, cnt)
head(df)

ggplot(data=df, aes(x=year, y=cnt)) +
  geom_line(col="red")

