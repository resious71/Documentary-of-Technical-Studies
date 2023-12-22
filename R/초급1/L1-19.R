# 조건문

jobtype = 'A'

# if문은 ()값이 참일 때 블럭을 실행함
if(jobtype == 'A'){
  bonus = 200
}
print(bonus)

rm(jobtype)
rm(bonus)

if(jobtype == 'B'){
  bonus = 200
}else{     # 반드시 else는 if의 } 뒤에 붙여야 한다
  bonus = 100
}

# 점수를 갖고 학점 결정

score = 85

if(score > 90){
  grade = 'A'
}else if(score > 80){
  grade = 'B'
}else if(score > 70){
  grade = 'C'
}else if(score > 60){
  grade = 'D'
}else{
  grade = 'F'
}

print(grade)

# 조건문 안에 논리 연산자 (&, |) 사용해 보기
a = 10
b = 20

if((a>5)&(b>5)){
   print(a+b)
}

if((a>5)|(b>30)){
  print(a*b)
}

if(a>b){
  c = a
}else{
  c = b
}

print(c)

### 첫번째 매개변수(수식)이 참이면 a 리턴, 거짓이면 b 리턴
c = ifelse(a>b, a, b)
print(c)

