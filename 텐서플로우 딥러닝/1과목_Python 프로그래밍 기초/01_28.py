##### 문자열과 텍스트 다루기 (문자열 다루기 2)
# 2장 Python 프로그래밍
# 8. 모듈
#  가. 모듈
#    - 다른 코드에서 활용할 수 있도록 상수, 변수, 함수, 클래스 등으로 작성된 파이썬 파일    
#    - 이미 만들어진 모듈을 활용하면 코드를 효과적으로 활용할 수 있음
#  나. 모듈을 사용하는 이유
#    - 모듈로 나누면 코드 작성 및 관리가 쉬워짐 
#      + 규모가 큰 프로그램을 만들 때 기능별로 프로그램을 나누어 개발하고 함께 활용
#    - 이미 작성한 코드를 재사용 할 수 있음
#      + 특정 기능을 구현한 모듈은 다른 프로그램에도 재사용 
#    - 공통작업이 편해짐
#      + 규모가 큰 프로그램을 만들 때 여러 사람들이 각자 프로그램을 개발
#  다. 모듈 생성 및 호출
#    1) 모듈 만들기
#     - 모듈은 파이썬 코드가 저장된 파일로 확장자는 .py임(ex: module.py)
#     - .py로 저장된 파일을 파이썬 콘솔 및 주피터 노트북을 이용해 파일을 실행할 수 있음
#     - 모듈이름.py로 모듈 이름을 지정하면 내장 명령어 '%%writefile'을 통해 코드를 파일로 저장할 수 있음
#    2) 모듈 불러오기
#     - 생성된 모듈은 import() 함수를 이용해 불러올 수 있음
#       > import 모듈명
#     - import 모듈명 다음 .py를 입력하게 되면 오류가 발생함에 주의
#

# file name: my_module.py

%%writefile c:\python_class\my_module.py
def my_function():
    print("Hello, My name is Tom")

#  !type c:\python_class\my_module.py                   # 내용 확인

cd c:\python_class
import my_module
my_module.my_function()

!echo %PYTHONPATH%

######

%%writefile c:\python_class\modules\my_area.py
PI = 3.14
def square_area(a):
    return a**2

def circle_area(r):
    return PI*r**2

cd c:\python_class

import my_area
print("PI=", my_area.PI)
print("square area = ", my_area.square_area(5))
print("square area = ", my_area.circle_area(5))

dir(my_area)
