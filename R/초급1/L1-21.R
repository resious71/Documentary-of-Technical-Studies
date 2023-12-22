#### 반복문
# for 문

# for(변수 in 범위)
for(i in 1:5){
  print('*')
}

for(i in 1:10){
  print(i)
}

# cat() : 문장을 만들어서 출력할 때 사용하는 함수
# \n은 개행 이스케이프 문자
for(i in 1:9){
  cat('2 *', i, '=', 2*1, '\n')
}

c = 20
cat(" c의 값은 ", c, "\n")

for(i in 1:20){
   if((i%%2) == 0){                        # 짝수인지 확인
        cat("1~20까지의 짝수 : " , i , " \n ")
   }
}

# 값을 누적하기
sum = 0
for(i in 1:100){
  sum = sum + i
}
print(sum)

###
head(iris)
num = nrow(iris)                         #  num  = 150
mylabel = c()

for(i in 1:num){                         # 꽃잎의 길이에 따라 레이블 결정
    if(iris$Sepal.Length[i] <= 1.6){
          mylabel[i] = "L"
    }else if(iris$Sepal.Length[i] >= 5.1){
          mylabel[i] = "H"
    }else{
          mylabel[i] = "M"
    }
}
mylabel
                                         
df_new_iris = data.frame(iris$Petal.Length, mylabel)
df_new_iris

### while 문 (통상 무한루프를 돌릴 때 많이 사용)

sum = 0
i = 1
while(i <= 100){
  sum = sum + i
  i = i+1
}
sum

### break 문 :조건에 만족 시 루프를 벗어남

sum = 0
for(i in 1:10){
    sum = sum + i
    if(i>=5)
       break
}
print(sum)

### next

sum = 0
for(i in 1:10){
  if(i %% 2 == 0)
    next
  
  sum = sum + i
}
print(sum)


