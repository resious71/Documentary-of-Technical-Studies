#### EDA: 수치형, 범주형 기술통계

# 객체 확인 
# - head()/tail(): 객체의 첫 n개/마지막 n개 원소 또는 row 출력
# - class(): 객체 속성 확인
# - str(): 객체 구조 확인

df = iris
head(df)
tail(df)
head(df, 2)
head(df, 10)
class("dfasf")
class(1213)
str(df)

# 객체 확인
# 1차원 벡터
# - length(): 원소 개수 확인
# - unique(): 중복 원소 제거
# - table(): 원소 개수 확인
#
# 데이터프레임
# - nrow()/ncol(): row/column 개수 확인
# colnames(): 변수명 확인 및 변경
# summary(): 각 변수 요약

length(1:4)
length(c("a", "b", "c"))
vec = c(1,1,3,5,7,7)
length(vec)
unique(vec)
length(unique(vec))
table(vec)
table(c("a", "a", "a", "b", "b", "c"))

head(df)
nrow(df)
ncol(df)
colnames(df)
summary(df)

head(df,2)
colnames(df)[c(1,3)] = c("SL", "PL")
head(df,2)

# 수치형 자료 탐색 
# 산술 함수
# min()/max()/mean() : 최소값/최대값/평균값 산출함수
# var()/sd()         : 분산/표준편차 산출 함수
# e1071::skewness()  : e1071 패키지의 첨도 함수
# e1071::kurtosis()  : e1071 패키지의 왜도 함수

min(df$SL)
max(df$SL)
mean(df$SL)
sd(df$SL)
exp(1.12)
2^2

install.packages("e1071")
library(e1071)
skewness(df$SL)
kurtosis(df$SL)

# 문자형 자료 탐색 
# nchar(): 문자열 개수 확인
# toupper()/tolower(): 대문자/소문자 변환
# paste()/paste0() : 문자열을 이어 붙이는 함수
# substr(): 위치를 기반으로 주어진 문자열에서 일부를 추출하는 함수
# splitstackshape::cSplit(): 데이터프레임 형식의 데이터의 특정 변수를 지정 패턴 기준으로 분리하는 함수 

nchar("aaa")
nchar(c("aa", "bbb", "cccc"))
df[, "nchar"] = nchar(as.character(df$Species))
head(df, 2)
tail(df, 2)

toupper("adfd")
tolower("ADSF")

df[, "to_upper"] = toupper(df$Species)
head(df, 2)
tail(df, 2)

paste("a", "b", "c", sep="-")
paste0("a", "b", "c")

paste(c("a", "b", "c"), sep="-")    # vector의 경우 안 먹음
paste0(c("a", "b", "c"))

paste(c("a", "b", "c"), collapse="-")   
paste0(c("a", "b", "c"), collapse="")
paste(c("a", "b", "c"), collapse="")

head(df, 2)
substr("asdf", start=1, stop=3)
substr("asdf", start=3, stop=3)
substr("asdf", start=3, stop=4)

df[, "first_2"] = substr(df$Species, start=1, stop=2)
head(df, 2)
tail(df, 2)


### Q1:다음과 같은 데이터프레임이 주어졌을 때 원소 5, 8울 추출하는 코드로 옳은 것은 ??

        V1   V2   V3
    1    1    2    3
    2    4    5    6
    3    7    8    9

    1) df[5,8, "V2"]
    2) df[2:3, "V2"]
    3) df[2:3,  3]
    4) df[c(5,8), "V2"]

### Q2: 숫자가 들어있는 1차원 벡터 객체를 대상으로 mean() 함수가 아닌 기본 함수 또는 
#       연산자로 산술평균을 구하려고 할 때 필요한 함수 또는 연산자로 옳지 않은 것은?

    1) sum()
    2) length()
    3) count()
    4) /
  
### Q3: 다음 중 첨도를 산출하는 함수가 있는 패키지명으로 옳은 것은?
  
    1) e1071
    2) stats
    3) momentum
    4) summary
  
    


































