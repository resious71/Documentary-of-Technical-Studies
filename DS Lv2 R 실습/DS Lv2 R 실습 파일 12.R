##### 비계층적 군집분석
#
# 1. k-means 소개
#    - k-means 군집분석의 특징 
#      + 임의의 k개의 점을 기반으로 가까운 거리의 데이터를 묶는 것과 더불어 평균을 활용하는 군집분석
#      + 군집 개수(k)를 확정하기 위해 여러 번의 시행착오 필요
#      + 결과 고정을 위해 seed 설정 필요
#
# 2. 주요 함수 소개
#    - caret - preProcess()
#      + 각종 정규화(normalization)를 실시하는 caret 함수
#      + method 인자에 "range" 할당하면 Min-Max 정규화 가능
#      + method 인자에 "center"와 "scale"을 할당하면 표준화 가능
#      + 출력 객체와 정규화 대상 데이터를 predict() 함수에 입력하여 정규화 가능 

install.packages("caret")
library(caret)

df = iris
head(df, 2)

nor_minmax = preProcess(df, method = "range")
df_minmax = predict(nor_minmax, newdata = df[, -5])
head(df_minmax, 2)

apply(df_minmax, MARGIN = 2, FUN = min)
apply(df_minmax, MARGIN = 2, FUN = max)
summary(df_minmax)

nor_std = preProcess(df)
df_std = predict(nor_std, newdata = df[, -5])
head(df_std, 2)

apply(df_std, MARGIN = 2, FUN = min)
apply(df_std, MARGIN = 2, FUN = max)
hist(df_std$Sepal.Width)

#    - caret - kmeans()
#      + k-Means 군집분석을 실히하는 기본 함수
#      + centers와 iter.max 인자에 군집 개수와 최대 반복 연산 회수를 설정
#      + 출력 객체의 cluster 리스트에서 각 행에 대응되는 군집 번호 확인 가능
#      + 출력 객체의 cluster 리스트에서 각 군집의 중심점(centroid) 확인 가능

model = kmeans(df[,-5], centers = 3)
model
model$centers

df[, "cluster"] = model$cluster
head(df, 2)

table(df[, c("Species", "cluster")])


## 결과가 매번 달라짐
model = kmeans(df[, -5], centers = 3)
df[, "cluster"] = model$cluster
table(df[, c("Species", "cluster")])

## set.seed 지정으로 결과 고정
set.seed(123)
model = kmeans(df[, -5], centers = 3)
df[, "cluster"] = model$cluster
table(df[, c("Species", "cluster")])

################################################################################
#
# Q1. BMI가 0이 아닌 사람 데이터를 대상으로 k-means  군집 분석을 실시하는 경우 
#    군집 개수가 가장 큰 군집의 Insulin 평균은 얼마인가?
#    - diabete.csv 파일 사용
#    - 군집은 4개로 설정하고 seed는 123으로 한다. 
#
#    1) 65.35
#    2) 79.80
#    3) 79.79
#    4) 3.19

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

df_sub = df[df$BMI != 0, ]
head(df_sub, 2)

set.seed(123)
model = kmeans(df_sub, centers = 4)
model$centers
table(model$cluster)

df_sub[, "cluster"] = model$cluster
mean(df_sub[df_sub$cluster == 3, "Insulin"])

# Q2. BMI가 0이 아닌 사람 데이터를 대상으로 k-means 군집 분석을 실시하는 경우 
#     군집 개수가 가장 큰 군집의 나이 평균은 얼마인가?
#      - diabetes.csv 파일 사용
#      - rnswlqdms 4개로 설정하고 seed는 123
#      - 군집 분석 이전에 Min-Max 정규화를 실시한다.
#      - 나이 계산은 정규화 실시 전의 데이터를 사용한다. 
#
#      1) 37  
#      2) 30
#      3) 44
#      4) 47

library(caret)

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

df_sub = df[df$BMI != 0, ]
head(df_sub, 2)

model_nor = preProcess(df_sub, method = "range")
df_sub_nor = predict(model_nor, df_sub)
head(df_sub_nor)

set.seed(123)
model = kmeans(df_sub_nor, centers = 4)
table(model$cluster)

df_sub[, "cluster"] = model$cluster
aggregate(data = df_sub, Age ~ cluster, FUN = mean)

# Q3. BMI가 0이 아닌 사람 데이터를 대상으로 k-means 군집 분석을 실시하고
#     중심간 유클리드 거리가 가장 가까운 그룹간 거리는?
#     - diabetes.cvs 파일 사용
#     - 군집은 3개로 설정하고 seed는 123
#
#     1) 429.2
#     2) 146.3
#     3) 283.4
#     4) 72.3

df = read.csv("../Rex/diabetes.csv")
head(df, 2)

df_sub = df[df$BMI != 0, ]
head(df_sub, 2)

set.seed(123)
model = kmeans(df_sub, centers = 3)
model$centers
dist(model$centers)



