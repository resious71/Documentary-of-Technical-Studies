##### 함수 (함수의 정의와 호출, 변수의 유효 범위)
# 2장 Python 프로그래밍
# 5.함수
# 가. 함수의 정의와 호출
#  1) 함수의 기본 구조
#   - 수학에서는 y = f(x)와 같이 함수를 표현함
#   - 함수의 입력과 출력의 관계를 살펴보면 다음 그림과 같음
#
#      x(입력)
#    |        |
#    |        --------------------
#    |                           |
#    |       Function f(x)       |
#    |                           |
#    ---------------------       |  
#                        |       |
#                         y(출력)
#                          
#   - 파이썬의 함수 기본 구조는 def 키워드로 시작하며 인자들을 입력한 후 return으로 반환함
#      > def 함수이름([인자1, 인자2, ..., 인자n]):
#      >    <코드 블록>
#      >    [return <반환 값>] 
#
#  2) 함수의 종류
#    - 인자도 반환 값도 없는 함수
#      > def name_func():
#      >    print("function")
#      >    print("first function")
#    - 인자는 있으나 반환 값이 없는 함수
#      > def name_func(a,b):
#      >    a = b+10
#      >    print("result:", b)
#    - 인자도 있고 반환 값도 있는 함수
#      > def name_func(a,b,c):
#      >    sum = a+b+c
#      >    return sum
#

def func():
    print("This is my first function.")
    print("This is Good.")

func()

def friend(name):
    print("{} is my friend.".format(name))

friend("resisa")
friend("Chang-hyun")

def student_info(name, s_number, p_number):
    print("-----------------------------")
    print("Student Name: ", name)
    print("Student ID  : ", s_number)
    print("Phone number: ", p_number)

student_info("resisa", 2304272, "012-1213-4323")

def calc(x,y):
    z=x+y
    return z 

calc(4,5)

def student_info_list(s_list):
    print("-----------------------------")
    print("Student Name: ", s_list[0])
    print("Student ID  : ", s_list[1])
    print("Phone number: ", s_list[2])

student_info_list(["resisa","32111","010-2134-2311"])


# 나. 변수의 유효 범위
#   - 지역 변수(local variable)
#     . 함수 안에서 정의한 변수, 임시 저장 공간(메모리)에 할당하여 사용
#   - 전역 변수(global variable)
#     . 코드 어디에서나 활용 할 수 있는 변수
#   - 변수 정의 공간: 유효 범위(scope)
#     . 지역 변수를 저장하는 공간: 지역 영역(local scope)
#     . 전역 변수를 저장하는 공간: 전역 공간(global scope) 
#     . 파이썬 자체에서 정의한 이름 공간: 내장 영역(built-in scope)
#   - 파이썬은 함수를 호출할 경우, 지역 영역, 전역 영역, 내장 영역 순으로 변수를 확인함
#     . LGB룰(local/global/built-in)이라고 함
#

a = 5                    # 전역 변수

def func1():
    a=1                  # 지역 변수 
    print("func1의 지역 변수 a = ", a)

func1()

def func2():
    a=2                  # 지역 변수 
    print("func2의 지역 변수 a = ", a)

def func3():
    a1=3                  # 지역 변수 
    print("func3의 전역 변수 a = ", a)
    print("func3의 지역 변수는 a1= ", a1)
    
def func4():
    global a
    a = 4
    print("func 4의 전역변수는 a=", a)
    
func2()
func3()
func4()
