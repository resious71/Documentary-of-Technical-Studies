### 반복문
#
# 1. for 문
#   - 반복문은 정해진 동작을 반복적으로 수행할 때 사용하는 명령문
#   - 동일 명령문을 여러 번 반복해서 실행할 때 사용
#   - for문의 문법
#     for(반복변수 in 반복 범위){
#         반복할 명령문(들)
#     }

for(i in 1:5){
  print('*')
}

for(i in 1:9){
  cat('2 *', i, ' = ', 2*i, '\n')
}

for(i in 1:20){
  if(i%%2 == 0){                             # 짝수인지 확인
    print(i)
  }
}

sum = 0
for(i in 1:100){
  sum = sum + i
}
print(sum)

# iris에서 꽃잎의 길이에 따른 분류 작업

norow = nrow(iris)                                   # iris의 행의 수
# range(iris$Petal.Length)
mylabel = c()                                        # 빈벡터 선언 
for(i in 1:norow){
  if(iris$Petal.Length[i] < 1.6){                    # 꽃잎의 길이에 따라 레이블 결정
    mylabel[i] = 'L'
  }else if (iris$Petal.Length[i] >= 5.1){
    mylabel[i] = 'H'
  }else{
    mylabel[i] = 'M'
  }
}

print(mylabel)                                       # 레이블 출력
newds = data.frame(iris$Petal.Length, mylabel)       # 꽃잎의 길이와 레이블 결합
head(newds)                                          # 새로운 데이터셋 내용 출력


# 2. while 문
#  - while문은 어떤 조건을 만족하는 동안 코드 블록을 수행하고, 해당 조건이 거짓일 경우 반복을 종료하는 명령문
#    while(비교조건){
#        반복할 명령문(들)
#    }
#

sum = 0
i = 1
while(i <= 100){
     sum = sum + i                                   # sum에 i 값을 누적
     i = i +1                                        # i값을 1 증가시킴
}
print(sum)

# 3. break와 next
# 3.1 break

sum = 0
for(i in 1:10){
     sum = sum + i
     if(i>=5) break
}
sum

# 3.2 next

sum =0
for(i in 1:10){
  if(i%%2 == 0) next
  sum = sum + i
  print(i)
}
sum
