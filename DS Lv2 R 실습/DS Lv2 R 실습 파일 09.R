#### 데이터 전처리: 정렬 및 변환
# 
# 1. 정렬 개요
#   - 정렬 방법
#      + 오름차순 : 값이 작은 것부터 큰 순으로 정렬
#      + 내림차순 : 값이 큰 것부터 작은 순으로 정렬
#   - 정렬의 활용
#      + 특정 변수의 최대값 또는 최소값을 확인할 때 사용
#      + 고객의 일별 결제 금액 데이터에서 가장 최근의 결제 금액 확인 가능
#      + 시계열 데이터 분석에서 시간 순서대로 데이터를 정렬할 때 활용
# 
# 2. 데이터 소개 
#   - 다이아몬드 데이터 - diamonds.csv
#     + 가격 및 각종 제원이 기록된 다이어몬드 데이터
#     + R 프로그램의 ggplot2 패키지에 수록된 데이터
#   - 전력 부하(사용) 데이터 - elec_load_2017_7d.csv
#     + 미공개 지역의 17년 1월 1일부터 1월 7일까지의 전력 부하량
#     + 시간 단위로 기록되어 있으며 대표적인 wide form 데이터 
#
# 3. 주요 함수 소개
#   - base - prop.table()
#     + table() 함수 출력 객체를 기반으로 비율 계산을 할 수 있는 기본 함수
#     + 2차원 표가 입력된 경우 margin 인자로 비율 연산 축 방향 설정 가능
#   - base - order()
#     + 데이터 정렬을 위한 순위값을 출력하는 기본 함수
#     + decreasing 인자로 오름차순/내림차순 설정 가능

dia = read.csv("../Rex/diamonds.csv")
head(dia)
nrow(dia)
unique(dia$color)
table(dia$color)
round(prop.table(table(dia$color)), 3)
round(prop.table(table(dia$color)) * 100, 3)              # 100분율

df_tbl = as.data.frame(table(dia$color))
df_tbl
df_tbl[, "prop"] = df_tbl$Freq / sum(df_tbl$Freq)
df_tbl

df_tbl[order(df_tbl$Freq), ]                              # order는 index 를 내보낸다.
df_tbl[order(df_tbl$Freq, decreasing = TRUE),]

df_tbl[order(-df_tbl$Freq), ]                             # - 붙여서 내림차순

#   - reshape2 - melt()
#     + wide from 데이터를 long form 데이터 구조로 변환하는 reshape2의 함수  (fat matrix --> tall matrix)
#     + 기준이 되는 변수를 id.vars 인자에 지정
#   - reshape2 - dcast()
#     + long from 데이터를 wide form 데이터 구조로 변환하는 reshape2의 함수
#     + 변환 공식은 formula 인자에 입력하며 물결(~) 앞은 row, 뒤는 column 변수 지정
#     + 각 조합이 1:1 대응이 아닐 경우 fun.aggregate 인자에 요약 함수 지정

elec = read.csv("../Rex/elec_load_2017_7d.csv")
head(elec, 2)
ncol(elec)

library(reshape2)
elec_melt = melt(data = elec,
                 id.vars = c("YEAR", "MONTH", "DAY"))
head(elec_melt)

colnames(elec_melt)[4:5] = c("HOUR", "LOAD")

elec_dcast = dcast(data = elec_melt,
                   formula = YEAR + MONTH + DAY ~ HOUR, 
                   value.var = "LOAD")

elec_dcast

###
head(dia, 2)
aggregate(data = dia, price ~ cut + color, FUN = mean)
dcast(data = dia, formula = cut ~ color, 
      fun.aggregate = mean, value.var = "price")

################################################################################
# 
# Q1. workingday가 아니면서 holiday가 아닌 날의 비율은 ?
#     - bike.csv 파일 사용
# 
#    1) 0
#    2) 0.25
#    3) 0.29
#    4) 0.91

bike = read.csv("../Rex/bike.csv")
head(bike)

table(bike[, c("holiday", "workingday")])
prop.table(table(bike[, c("holiday", "workingday")]))
round(prop.table(table(bike[, c("holiday", "workingday")])),3)

# Q2. 가장 많은 데이터가 있는 세공 수준과 색상 조합을 순서대로 고르면?
#    - diamonds.csv 파일 사용
#
#    1) Ideal. G
#    2) Fair, D
#    3) Premium, E
#    4) Good, I

dia = read.csv("../Rex/diamonds.csv")
head(dia)

tbl = table(dia[, c("cut", "color")])
df_tbl = as.data.frame(tbl)
head(df_tbl)

df_tbl[which.max(df_tbl$Freq),]

# Q3. 세공수준 별 색상별 가격과 캐럿의 평균을 구하고
#     1캐럿당 가격이 가장 높은 세공수준과 색상 조합을 순서대로 고르면 ?
#    - diamonds.cvs 파일 사용
#
#    1) Ideal, E
#    2) Ideal, G
#    3) Premium, E
#    4) Premium, G

dia = read.csv("../Rex/diamonds.csv")
head(dia)

df_agg = aggregate(data = dia[, c("price", "carat", "cut", "color")],
                   . ~ cut + color, FUN = "mean")          #  . -> 명시하지 않은 모든 변수

head(df_agg)

df_agg[, "ratio"] = df_agg$price / df_agg$carat
df_agg[which.max(df_agg$ratio), ]
head(df_agg)

###########################################
# rank()
# - rank 함수는 각 원소가 크기 순서로 몇위 인지를 반환

A=c(21,11,23,15,29,24,13)
rank(A)

# 같은 값이 있으면  ties.method 라는 옵션을 사용해서 설정
# - average : 평균 순위로 설정
# - first : 앞에 있는 원소를 높은 순위로
# - last : 뒤에 있는 원소를 높은 순위로
# - random : 임의로
# - max : 두 순위 중 큰 값으로
# - min : 두 순위 중 작은 값으로

A=c(1,2,3,3,4,5,6)
rank(A)                    # default = average

rank(A,ties.method=c("average"))

rank(A,ties.method=c("first"))

rank(A,ties.method=c("last"))

rank(A,ties.method=c("random"))

rank(A,ties.method=c("max"))

rank(A,ties.method=c("min"))

# NA 처리 
# - 기본값은 na.last=TRUE인데, NA를 가장 마지막 순위로
# - na.last=FALSE 로 설정하면 NA를 가장 첫번째 순위로
# - na.last="keep" 으로 설정하면 NA를 원래의 위치로 반환
# - na.last=NA 로 설정하면 NA를 제외

A=c(21,11,23,15,29,NA,24,13)

rank(A)
rank(A,na.last=FALSE)
rank(A,na.last="keep")
rank(A,na.last=NA)

