### 데이터 전처리 : 결측치, 이상치
# 
# 1. 이상치 개요
#  - 이상치의 정의 : 중심 경향성에서 멀리 떨어진 값
#  - 이상치의 처리 방법
#     + 이상치 처리에 절대적인 기준은 없음 
#     + 대표적으로 Carling, Tukey 방법이 있음
#     + 분포 기반으로처리도 가능
#
# 2. 결측치 개요
#  - 결측치의 정의 : 값이 기록되지 않고 비어 있음
#  - 결측치의 처리 방법
#     + 결측치 처리에 절대적인 기준은 없음
#     + 단순 제거와 특정 값으로 대체하는 방식이 있음
#     + 분석 데이터에서 결측치가 차지하는 비중이 낮은 경우, 단순 제거하는 경우가 많음
#
# 3. 데이터 소개
#  - 붓꽃 결측 데이터 - iris_missing.csv 
#     + 붓꽃 데이터인 iris에서 결측값이 추가된 데이터
# 
# 4. 주요 함수 소개
#  - base-is.na() : 결측(NA)의 경우 TRUE를 반환하는 기본 함수
#  - base-is.null() : 결측(NULL)의 경우 TRUE를 반환하는 기본 함수

is.na(c(1,2,3))
is.na(c(1,2,NA))

vec = c(2, 4, NA, 8)
vec
is.na(vec)
vec[is.na(vec)]
vec[!is.na(vec)]
vec = vec[is.na(vec) == FALSE]

###
df = read.csv("../Rex/iris_missing.csv")
head(df,5)
df_mis = df[is.na(df$Sepal_Width),]
head(df_mis, 5)

###
is.null(c(1,2,NA))
is.null(NULL)
is.null(c(1,2,NULL))
is.null()

is.na(c(1, 2, NULL))

#  - base-quantile()
#    + 주어진 1차원 숫자 벡터에서 분위수 값을 산출하는 기본 함수 
#    + probs 인자에 0에서 1 사이의 실수를 입력하여 분위수 산출
#    + probs에 0을 입력할 경우 최소값, 1을 입력할 경우 최대값이 산출

quantile(1:100, probs=0.25)
quantile(333:500, probs=0.25)
quantile(333:500, probs=0.75)
quantile(333:500, probs=0.5)
median(333:500)
quantile(333:500)

###############################################################################
### Q1. 각 수치형 변수의 결측치 개수 총합은 ?
#   - iris_missing_csv 파일 사용
# 
#   1) 9
#   2) 11
#   3) 23
#   4) 40
#
#  is.na()와 sum()을 활용하면 쉽게 계산 가능, 필요시 반복문이나 apply()를 사용
df = read.csv("../Rex/iris_missing.csv")
ncol(df)
is.na(df[, -ncol(df)])
is.na(df[, 1:4])
sum(is.na(df[, -ncol(df)]))

# sum(is.na(df[,1]))   // 1~4 반복
# 
# apply(df[, 1:4], MARGIN=2, 
#        FUN = function(X){sum(is.na(X))})

#####
# joins = left_join(A, B, by = c("member" = "name"))
# colSums(is.na(joins))


### Q2. Sepal_Width 변수의 결측치를 평균으로 대치한 값의 분산은? 
#  - iris_missing_csv 파일 사용
#  - 반올림하여 소수점 세째자리까지 표기
#
#    1) 0.176 
#    2) 3.070
#    3) 3
#    4) 2.3

df = read.csv("../Rex/iris_missing.csv")
df[is.na(df$Sepal_Width), "Sepal_Width"] = mean(df$Sepal_Width, na.rm = TRUE)
round(var(df$Sepal_Width),3)

# mean(df$Sepal_Width)                   na.rm은 FALSE가 기본값
# mean(df$Sepal_Width, na.rm = T)    

### Q3. 평균을 기준으로 1.5 표준편차를 넘어서는 값을 이상치라고 간주할 때,
#       Sepal.Length 변수를 기준으로 이상치인 row 갯수는 몇 개인가?     
#    - iris.csv 파일 사용

avg = mean(iris$Sepal.Length)
avg
sd  = sd(iris$Sepal.Length) 
sd

upper = avg + 1.5 * sd
upper
lower = avg - 1.5 * sd
lower

length(iris[iris$Sepal.Length > upper | lower > iris$Sepal.Length, "Sepal.Length"])

##
df = iris
SL_mean = mean(df$Sepal.Length)
SL_sd   = sd(df$Sepal.Length)

cond_1 = df$Sepal.Length < (SL_mean - 1.5*SL_sd)
cond_2 = df$Sepal.Length > (SL_mean + 1.5*SL_sd)

df_sub = df[cond_1 | cond_2, ]
nrow(df_sub)



