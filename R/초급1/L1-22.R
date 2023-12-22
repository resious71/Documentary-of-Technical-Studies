###  apply 함수
# 
# 1. apply() 함수의 개념
#   - 반복 작업이 필요한 경우에는 반복문을 적용
#   - 반복 작업의 대상이 매트릭스나 데이터프레임의 행(row), 또는 열(column)인 경우는
#     for 문이나 while문 대신 apply() 함수를 사용하는 것이 빠르다.
# 
#   - apply() 함수의 문법
#     + apply(데이터셋, 행/열방향 지정, 적용 함수)
#         - 데이터셋 : 반복 작업을 적용할 대상 매트릭스나 데이터프레임 입력 
#         - 행/열 방향 : 행방향 = 1, 열방향 = 2
#         - 적용함수 : 반복작업의 내용을 알려주는 것으로 R함수나 사용자 정의 함수 지정
 
#  2. apply() 함수의 적용
apply(iris[1:4], 1, mean)                                 # row 방향으로 함수 적용
apply(iris[1:4], 2, mean)                                 # column 방향으로 함수 적용


### 사용자 정의 함수 
# 
# 1. R은 사용자들도 자신만의 함수를 만들어 사용할 수 있는 기능을 제공, 이를 사용자 정의 함수라고 함
#  - 사용자 정의 함수 문법 
#    함수명 = function(매개변수 목록){
#                   실행할 명령문(들)
#                   return(함수의 실행 결과)
#     }     

# 사용자 정의 함수 생성 후 사용
#   - 사용 절차 
#      + 함수를 작성(정의)   
#      + 함수를 실행하여 R에 함수를 등록함  
#      + 필요한 곳에서 함수를 호출함
#      + 결과값을 받아서 코드 처리


mymax = function(x,y){
     num.max = x
     if(y>x){
       num.max = y
     }
     return(num.max)
}

result = mymax(10,50)
result

# 사용자 정의 함수의 매개변수에 초기값 설정
mydiv = function(x, y=2){
  result = x/y
  return(result)
}

mydiv(x=10, y=3)            # 매개변수 이름과 값을 쌍으로 입력
mydiv(10, 3)                # 매개변수 값만 입력 
mydiv(10)                   # x에 대한 값만 입력(y값이 생략됨)

# 함수가 반환하는 결과값이 여러 개일 때의 처리

myfunc = function(x,y){
  val.sum = x+y
  val.mul = x*y
  return(list(sum=val.sum, mul = val.mul))
}

result = myfunc(5.8)
s = result$val.sum
m = result$val.mul
cat('5 + 8 = ', s, "\n")
cat('5 * 8 = ', s, "\n")

# 2. 사용자 정의 함수의 저장 및 호출 
setwd("d:/source")                              # myfunc.R이 저장된 폴더
source("myfunc.R")                              # myfunc.R 안에 있는 함수 실행

# 함수 사용
a = mydiv(20,4)
b = mydiv(30,4)
a+b
mydiv(mydiv(20,2),5)


### 조건에 맞는 데이터의 위치 찾기 
#  - 데이터 분석을 하다보면 원하는 데이터가 벡터나 매트릭스, 데이터프레임안에서 어디에 위치하고 있는지를 알기 원하는 경우가 있음
#  - 예를 들어, 50명의 학생 성적이 저장된 벡터가 있는데 가장 성적이 좋은 학생은 몇 번째에 있는지를 알 수 있는 경우
#  - 이런 경우, which(), which.max(), which.min()를 사용
#      + which() 함수는 조건에 해당하는 인덱스를 리턴하는데, 한 개 또는 여러 개를 리턴할 수 있다. 

score = c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score == 69)                            # 성적이 69인 학생은 몇 번째에 있나 
which(score == 85)                  
max(score)                                    # 최고 점수는
which.max(score)                              # 최고 점수는 몇 번째에 있나
min(score)
which.max(score)

#
score = c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx = which(score <= 60)                      # 성적이 60 이하인 값들의 인덱스
score[idx] = 61                               # 성적이  60 이하인 값을 61점으로 변경
score        

idx = which(score >= 80)                      # 성적이 80 이상인 값들의 인덱스
score.high = score[idx]
score.high

#
idx = which(iris$Petal.Length > 5.0)          # 꽃잎의 길이가 5.0 이상인 값들의 인덱스
idx
iris.big = iris[idx,]
iris.big

# 1~4 열의 값 중 5보다 큰 값의 행과 열의 위치
#  - which() 함수를 이용해 매트릭스나 데이터프레임 안에 있는 특정 조건의 
#   값의 행과 열의 위치를 알고 싶다면, 매개변수로 arr.ind 속성을 TRUE로 주면 된다. 
idx = which(iris[, 1:4] > 5.0, arr.ind = T)
idx

