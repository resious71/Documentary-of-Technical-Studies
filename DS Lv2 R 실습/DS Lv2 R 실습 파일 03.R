#### R 기본 문법 (2)
# 
# 1. 제어문
#   - 반복문 
#      + 코드의 중복이 많을 경우, 특정 값만 바꿔서 반복 실행하고자 할 때 사용하는 코드의 형태
#      + for() 함수를 사용하면 반복문에 사용되는 코드는 중괄호({, }) 사이에 선언
#      + in 뒤에는 1차원 벡터가 올 수 있으면 원소의 속성은 크게 중요하지 않음
#   - 반복문의 구조
#       for( #객체 in #1차원 벡터){
#          # 실행 코드
#       }

for(n in 1:5){
  print(n)
}

for(n in c(3, 6, 8)){
  print(n)
}

for(n in c("a", "b", "c")){
  print(n)
}

df = iris
head(df, 2)
unique(df$Species)

for(species in unique(df$Species)){
  print(species)
  df_sub = df[df$Species == species,]
  print(head(df_sub,2))
}

#   - 조건문 
#     + 지정한 조건을 기반으로 두 가지 이상의 코드 실행 및 산출값 생산을 위해 사용하는 코드 형태
#     + if() 함수를 사용하며, 함수 내에 TRUE 또는 FALSE로 반환되는 조건을 기입
#     + if() 함수 직후 사용되는 중갈호({, })에는 TRUE일 경우 실행되는 코드 위치
#     + 별도의 예외 조건 지정 시 else 활용

if(TRUE){
  print("a")
}

if(FALSE){
  print("a")
}

score = 90        # 70 ~~
if(score >= 80){
  print("P")
}else{
  print("F")
}

# 02. 패키지 
#   - 패키지(package)의 특징
#     + R을 좀 더 강력하게 사용하기 위한 함수 및 데이터 덩어리
#     + 공식 패키지는 cran.r-project.org를 통해 제공하며, install.package() 함수로 설치 가능
#     + 각 패키지에는 1~100 개의 함수 존재
#   - 패키지 설치
#     + install.package() 함수를 사용 시 패키지명 선언은 문자열 권장
#     + 특정 패키지 설치 시 해당 패키지 구동에 필요한 의존(dependency) 패키지 함께 설치
 
install.packages("beepr")

#   - 패키지 함수 사용
#     + 설치한 패키지를 사용하기 위해 library() 함수 또는 "::" 기호 활용
#     + RStudio가 재시작 되거나 종료 이후 다시 실행 시 library() 함수 재실행 필요

library("beepr")
beep(2)

install.packages("data.table")
library("data.table")

data.table::as.data.table()

# 03. 파일 입출력 
#   - 파일 입력
#     + 특정 경로의 파일을 읽어와서 별도의 객체에 저장하는 행위
#     + 텍스트 파일을 읽어오는 경우는 보통 read.csv() 함수를 사용
#     + 텍스트에 쉼표가 아닌 특수 구분자가 있는 경우 sep 인자에 그 구분자를 할당
#   - 파일 출력
#     + 일반적으로 데이터프레임 객체를 특정 경로에 파일 형태로 저장하는 행위
#     + 텍스트 파일로 저장하는 경우 보통 write.csv() 함수 사용
#     + 텍스트에 쉼표가 아닌 특수 구분자로 저장하는 경우 sep 인자에 그 구분자를 할당
#     + row.name은 보통 저장하지 않기 때문에 row.names 인자에 FALSE 할당

df = iris
head(df, 2)

write.csv(df, "../Rex/iris_test1.csv")
write.csv(df, "../Rex/iris_test2.csv", row.names = FASLE)

df_test1 = read.csv("../Rex/iris_test1.csv")
df_test2 = read.csv("../Rex/iris_test2.csv")

head(df_test1,2)
head(df_test2,2)

# Q1. 다음 코드의 실행 결과로 옳은 것은?
# 
#   nums = 3:4
#   vec = c()
#   for(n in nums){
#      vec = c(vec, n*2)
#   }
#   vec
#  
#   1) [1] 6 8 
#   2) [1] 6 6 6 6
#   3) [1] 3:4
#   4) [1] NA

nums = 3:4
vec = c()
for(n in nums){
  vec = c(vec, n*2)
}
vec

# Q2. vec 1차원 벡터에 1부터 5까지의 자연수가 다섯 개 있고, 
#     연산 결과인 vec_sub 객체가 다음과 같을 때 연산 코드로 옳은 것은 
#  
#     - 비어있는 1차원 벡터 객체 vec_sub가 사전에 생성되었다고 가정
#     [1] 1, 3, 5
#
#     1)  for(n in vec){
#           vec_sub = vec %in% c(1,3,5)
#         }
#
#     2)  for(n %% 2 == 1){
#           vec_sub = c(vec_sub == n)
#         }
#
#     3)  for(n in vec){
#           if(n %% 2 == 1){}           
#               vec_sub = c(vec_sub, n)
#           }
#         }
#
#     4) vec_sub = vec[vec == vec/2 == 1]

vec =1:5
vec_sub = c()
for(n in vec){
   if(n %% 2 == 1){
     vec_sub = c(vec_sub, n)
   }
}

# Q3.  다음 중 패키지와 관계 없는 함수 또는 용어는?
#
#    1) install.package()
#   *2) package()                
#    3) library()
#    4) dependency

