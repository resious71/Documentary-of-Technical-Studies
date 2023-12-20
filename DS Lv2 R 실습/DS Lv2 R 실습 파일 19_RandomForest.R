### randomForest

library(caret)                         # GermanCredit 데이터 활용 
library(randomForest)
library(dplyr)

data("GermanCredit")
str(GermanCredit)
head(GermanCredit, 5)

table(GermanCredit$Class)
prop.table(table(GermanCredit$Class))

df = GermanCredit

index = sample.split(df, 0.7)
df_train = df[index, ]
df_test = df[!index, ]

head(df_train)
unique(df$Class)

tree.model = randomForest(Class ~ ., df_train)   # Class가 종속변수 나머지가 독립변수
tree.model

## 예측

pred = predict(tree.model, df_test)

confusionMatrix(df_test$Class, pred)

## 중요 변수 확인 

varImpPlot(tree.model)
# Amount, Duration, .. 순으로 중요

## 변수 기여도 
# Amount의 경우 범위는 250 ~ 18424 
range(df$Amount)


# Amount 변수와 Class의 값 Good 사이의 관련성 체크
partialPlot(tree.model, df_test, Amount, "Good")
# Amount 값이 작을수록 Class가 Good, 클수록 Bad가 되는 경향
