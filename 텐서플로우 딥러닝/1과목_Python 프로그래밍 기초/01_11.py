##### 제어문 ( while문, for문 한줄로 쓰기)
# 3.제어문
# 다. 조건문(while)
#  1) while 문의 구조
#   - 범위가 아닌 조건에 따라 반복 여부를 결정하는 방식
#   - 반복 범위가 정해진 반복의 경우에 for 문을 이용하고 범위 없이 조건에 따른 반복 수행의 경우 while을 이용함
#       while <조건문>:
#           <코드 블록> 

x=0
y=0
print("x,y")

while(y<20):
    x=x+1
    y=y+x
    print(x,y)

#  2) 무한반복 while문
#   - 코드 블록을 무조건 계속 반복하라고 명령을 내리는 경우
#   - while 문을 항상 참으로 두게 하여 코드 블록을 수행하게 함
#     while True:
#        print("test")
#
# 라. 반복문의 제어
#  1) 반복문을 빠져나오는 break
#   - for 문에서는 <반복 범위> 동안, while 문에서는 <조건문>을 통해 수행 되는 중 특정 조건을 주어 
#     반복문을 빠져나오게 하는 방법

a = 0
while True:
    a = a+1
    if(a > 5) :
        break
    print(a)
    
for a in range(10):
    if(a>4):
        break
    print(a)
    
#  2) 다음 반복을 실행하는 continue
#   - 반복문 안에서 continue를 만나면 처음으로 돌아가서 다음 반복을 진행함

b = 0
while True:
    b = b+1
    if(b==2):
        print(*"continue")
        continue
    if(b>6):
        break
    print(b)
    
# 마. 간단하게 반복하는 한 줄 for 문
#   - 컴프리핸션을 통해 리스트, 세트, 딕셔너리를 반복 처리 할 수 있음
#   - 리스트 컴프리핸션의 기본 구조
#     [<반복 실행문> for <반복 변수> in <반복 범위>]
#   - 조건문을 포함한 리스트 컴프리핸션
#     [<반복 실행문> for <반복 변수> in <반복 범위> in <조건문>]

n = [1,3,5,7,9]
s = []

for i in n:
    s.append(i**2)
    print(s)

s = [i**2 for i in n]
s

n = [1,3,5,7,9]
s = []
for i in n:
    if i>=5:
        s.append(i**2)
        print(s)

s = [i**2 for i in n if i>= 5]
s

# 
