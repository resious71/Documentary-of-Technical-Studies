# boxplot

library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length)) + 
  geom_boxplot(fill="yellow")

ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + 
  geom_boxplot(width=0.8, outlier.shape = 2, outlier.color = "red")

ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + 
  geom_boxplot(outlier.color = NA)

# line graph

library(ggplot2)

year = 1937:1960
cnt  = as.vector(airmiles)
df   = data.frame(year, cnt)
head(df)

ggplot(data=df, aes(x=year, y=cnt)) +
  geom_line(col="red", linetype=3, size=1, arrow=arrow())
