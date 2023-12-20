#### R 기본 문법 (1)
# 
# 1. 작업 폴더
#   - 작업 폴더(Working directory)의 특징
#     + R에서 연결되어 있는 파일을 읽고 쓰는 기본 폴더
#     + Windows의 경우, 기본적으로 Documents 폴더로 지정
#     + 작업 폴더 확인은 getwd() 함수 활용
#     + RStudio의 Project를 활용하는 경우, 작업 폴더 변경과 관리가 용이

getwd()

# 2. 원소
#   - 대표적인 원소 속성
#     + 수치형(nemeric) : 숫자로 이루어져 있으면 정수(integer)와 실수(double)를 포함
#     + 문자형(character) : 문자로 이루어져 있으며 그 길이에 관계없이 형식이 같음
#     + 팩터형(factor) : 명목/순서형 변수를 표현
#     + 논리형(logicial) : TRUE와 FALSE, 즉 참/거짓을 나타내는 형식

123                # 숫자형
"adfdaf"           # 문자형
'adfdf'            # 문자형
TRUE
FALSE

TRUE + FALSE       # TRUE = 1, FALSE = 0
TRUE + TRUE

# 3.
#   - 특수 원소
#      + NA : 결측값(missing value, 값이 존재하지 않음)
#      + NULL : 데이터 유형과 자료의 길이도 0인 비어있는 값
#      + NaN : 수학적으로 정의가 불가한 수
#      + Inf : 무한값(Infinite)

#   - 할당 연산자 
#      + X = 1 : X에 1을 대입
#      + X <= 1 : X에 1을 대입
#      + X -> 1 : X에 1을 대입
#      + X <<- 1 : X에 1을 대입 (함수 내에서 활용) 
#      + 1 ->> X : X에 1을 대입 (함수 내에서 활용)  

#   - 산술 연산자 
#      + + : 덧셈  
#      + - : 뺄셈, 음수부호
#      + * : 곱셉
#      + / : 나누기
#      + %/% : 목(modulo)
#      + %% : 나머지(remainder)
#      + ^ or ** : 지수연산 

#   - 비교 연산자 
#      + == : 같음(equal)
#      + != : 같지 않음(not equal)
#      + < : 미만
#      + > : 초과
#      + <= : 이하  
#      + >= : 이상
#      + & 논리곱 :(logical AND)

"A" == "B"
"A" != "B"
!TRUE
!FALSE

#   - 비교 연산자
#     + | : 논리합(logical OR)
#     + ! : 논리부정(logical NOT) 
#     + %in% : 일치 여부 검사(match)   // 소급 전처리

# 4. 객체  
#   - 객체(object)의 특징
#     + 주로 데이터를 담아두는 용기에 비유
#     + 데이터 속성과 구조에 따라 활용할 수 있는 함수가 다름
#     + 대표적으로 1차원 벡터(vector), 행렬(matrix), 데이터프레임(data.frame), 리스트(list)가 있다.
#   - 객체의 이해와 실습
#     + 벡터 - c()
#     + 데이터 프레임 - data.frame()

c(1,2,3)
C(1,2,"3")
aa = ㅊ(1,3,5)
aa[1]
aa[c(1,3)]
aa[2] = "a"
aa = c(aa, "A")
aa

data.frame(aa = c(1,2,3),
           bb = c("a", "b", "c"))

data.frame("aa" = c(1,2,3),
           "bb" = c("a", "b", "c"))

data.frame("aa" = c(1,2,3),
           "bb" = c("a", "c"))               # error

df = data.frame(aa = c(1,2,3),
                bb = c("a", "b", "c"))
df
df$aa
df[, 1]
df[1, ]

#     + 행렬 - matrix()
#     + 리스트 - list()

matrix(c(1,2,3,4))
matrix(c(1,2,3,4), nrow = 2)
matrix(c(1,2,3,4), ncol = 2)
matrix(c(1,2,3,4), ncol = 2, byrow = TRUE)
matrix(c(1,2,3,"K"), ncol = 2)

list(aa = c(1,2,3),
     bb = matrix(c(1,2,3,4), nrow = 2),
     cc = list(dd = c(3,5,7)))

# Q1. 다음 코드의 실행 결과로 옳은 것은 
#    1: aa = c(2,4)
#    2: bb = c(4,7) 
#    3: c(aa, bb, 99) 
# 
#    1) [1] aa bb 99
#    2) [1] 2 4 7 99
#    3) [1] 2 4 4 7 99
#    4) [1] "aa" "bb" 99

aa = c(2,4)
bb = c(4,7) 
c(aa, bb, 99) 

# Q2. 다음 실행 결과를 위해서 입력해야 하는 코드는 
#
#          [,1] [,2] [,3] [,4]
#    [1,]    2    4    6    8
# 
#    1) matrix(c(2,4,6,8))
#    2) matrix(c(2,4,6,8), byrow = TRUE)
#    3) matrix(c(2,4,6,8), nrow = 1)
#    4) matrix(c(2,4,6,8), type = "wide")

matrix(c(2,4,6,8))
matrix(c(2,4,6,8), byrow = TRUE)
matrix(c(2,4,6,8), nrow = 1)
matrix(c(2,4,6,8), type = "wide")

# Q3. 다음 코드 중 실행 시 오류가 발생하는 것은?
# 
#     1) list(1,3,5) 
#     2) data.frame(aa=c(2,4), bb = c("a", "b", "c"))
#     3) c(-1)
#     4) matrix(c("a","b"))

list(1,3,5) 
data.frame(aa=c(2,4), bb = c("a", "b", "c"))
c(-1)
matrix(c("a","b"))
