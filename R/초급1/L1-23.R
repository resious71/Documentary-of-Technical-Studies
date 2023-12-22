# apply()
 
iris
dim(iris)

apply(iris[1:4], 1, mean)         # row(행) 방향으로 함수를 적용
apply(iris[1:4], 1, sum)          # row(행) 방향으로 함수를 적용

apply(iris[1:4], 2, mean)         # column(열) 방향으로 함수를 적용
apply(iris[1:4], 2, sum)          # column(열) 방향으로 함수를 적용

# 사용자 정의 함수 

mymax = function(x,y){             # 두 개의 입력을 받아 큰 값을 리턴
    if(x >= y){
      max = x
    }else{
      may = y
    }
    return(max)
  }

mymax(10,5)

a = mymax(50,20)
a
b = mymax(50,140)
b
print(a+b)

####
mydiv = function(x, y=2){        # 매개변수의 초기값 설정
    result = x/y
    return(result)
}

mydiv(10,3)
mydiv(100)

##  함수는 원래 하나의 기능을 하게끔 구현하는 것이 원칙
##  R에서는 리턴값을 벡터나 리스트 형태로 여러 값을 넘길 수 있다. 

myfunc = function(x,y){
   vsum = x+y
   vmul = x*y
   return(list(sum = vsum, mul=vmul))
}

result = myfunc(5,8)
class(result)

s = result$sum
m = result$mul

cat("5+8", s,"\n")
cat("5*8", m,"\n")

# 
# source("mylib.R")        <=  mylib.R 파일에 정의된 함수 사용
# 


