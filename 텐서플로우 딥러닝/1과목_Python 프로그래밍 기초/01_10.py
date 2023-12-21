##### 제어문 ( for문, 정리하기 )
# 3. 제어문
# 나. 반복문(for)
#   1) 반복문의 구조
#    - 순차적 작업을 반복적으로 수행하느 ㄴ구문
#      for <반복 변수> in <반복 범위>:
#         <코드 블록>
#    - 반복 변수가 반복 범위에 따라 변하면서 코드 블록을 실행, 데이터가 순차적으로 들어가면서
#      코드 블록의 과정을 반복 수행함

a=0
print(a)

a=a+1
print(a)

a=a+1
print(a)

a=a+1
print(a)

a=a+1
print(a)

for a in [0, 1,2,3,4,5]:
    print(a)

jsdata = ["Yoon", "Jang", "Jeong", "Kwon"]

for js in jsdata:
    print(js)
   
#  2) 반복 범위 지정
#   - range() 내장 함수를 통해 시작 숫자, 마지막 숫자, 증가의 크기를 정하여 사용할 수 있음
#    . range(start, stop, step) # start는 포함, stop는 미포함
#    . range(start, stop)       # step이 1인 경우
#    . range(stop)              # start가 0이고, step이 1인 경우 
#   - start로 부터 시작하여 stop전까지 (stop은 포함되지 않음) step 만큼 계속 더하여 반복 범위를 생성

print(range(0,20,4))
print(list(range(0,20,4)))
print(tuple(range(0,20,4)))
print(set(range(0,20,4)))

for a in range(0, 5, 1):
    print(a)

for a in range(0, 8, 2):
    print(a)

print(list(range(0,10,1)))
print(list(range(0,10)))
print(list(range(10)))

print(list(range(0,20,5)))
print(list(range(-10,0,2)))
print(list(range(3,-10,-3)))

print(list(range(0,-5)))

#  3) 중첩 for 문
#  - if 문의 중첩 조건문처럼 for 문 구조를 이용해 중첩 반복문을 생성할 수 있음
#    for <반복 변수 1> in <반복 범위 1>:
#        for <반복 변수 2> in <반복 범위 2>:
#            <코드 블록>
#

x_list = ['x1', 'x2']
y_list = ['y1', 'y2']

print ("x, y")

for x in x_list:
    for y in y_list:
        print(x,y)

#  4) 여러 개의 리스트 다루기
#   - for 문을 이용한 여러 개의 리스트 다루기
#   - 데이터의 항목 개수를 반환하는 len() 함수와 범위를 반환하는 range() 함수를 통해 <반복 범위>를
#     지정하고 <반복 변수>를 이용해 리스트의 요소를 하나씩 call 한다
#   - 길이가 같은 리스트가 여러 개 있을 경우, 같은 길이의 데이터를 묶어주는 zip() 함수를 이용함
#     for v1, v2 in zip(list1, list2):
#        <코드 블록>

names = ["Yoon", "Jang", "Jeong", "Kwon"]
grade = ['A+', 'A', 'B', 'C']

for k in range(len(names)):
    print(names[k], grade[k])
    
for names, grade in zip(names, grade):
    print(names, grade)
    
