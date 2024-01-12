##### 모듈 (모듈 생성 및 호출 2, 모듈의 실행방식에 대한 구분, 내장 모듈 1)
# 2장 Python 프로그래밍
#    3) 모듈 만들기
#      - 모듈 내에서 정의한 내용을 호출하기 위해 계속해서 '모듈명.변수', '모듈명.함수'를  
#        써야하는 불편함 존재
#      - 아래의 형식으로 선천하면 모듈 내에 있는 변수와 함수, 그리고 클래스를 모듈명 없이 
#        변수, 함수, 클래스처럼 직접 호출해서 이용할 수 있음
#         > from 모듈명 import 변수명
#         > from 모듈명 import 함수명
#         > from 모듈명 import 클래스명
#      - 모듈의 모든 변수, 함수, 클래스를 바로 모듈명 없이 바로 이용하고 싶은 경우 아래 형식으로 선언
#         > from 모듈명 import *
#      - 모듈명을 매번 입력하기 쓰기 번거로움을 해소하기 위해 별명을 부여하여 쉽게 사용 가능
#         > import 모듈명 as 별명
#         > from 모듈명 import 변수명 as 별명
#         > from 모듈명 import 함수명 as 별명
#         > from 모듈명 import 클래스명 as 별명
#

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

from my_area import PI
print("PI = ", PI)

from my_area import square_area
from my_area import circle_area

print("square area = ", square_area(5))
print("square area = ", circle_area(5))

from my_area import PI, square_area, circle_area
print("PI = ", PI)
print("square area = ", square_area(5))
print("square area = ", circle_area(5))

from my_area import *
print("PI = ", PI)
print("square area = ", square_area(5))
print("square area = ", circle_area(5))

import my_area as area 
print("PI = ", area.PI)
print("square area = ", area.square_area(5))
print("square area = ", area.circle_area(5))

from my_area import PI as pi
from my_area import square_area as square
from my_area import circle_area as circle
print("PI = ", pi)
print("square area = ", square(5))
print("square area = ", circle(5))

# 라. 모듈을 직접 실행하는 경우와 임포트한 후 실행하는 경우 구분하기
#   - if __name__="__main__": ~else 구조를 이용하여 모듈을 직접 실행하는 경우와
#     임포트하여 실행하는 경우를 구분해서 코드를 실행할 수 있음
# 마. 내장 모듈
#   1) 난수 발생 모듈
#     . 난수 발생 모듈
#       > import random
#       > random.random모듈함수()
#

%%writefile c:\python_class\modules\mod_test1.py
def func(a):
    print("input value is ", a)
func(3)

%run c:\python_class\modules\mod_test1.py


%%writefile c:\python_class\modules\mod_test2.py
def func(a):
    print("input value is ", a)

if __name__ == "__main__":
    print("모듈을 직접 실행")
    func(3)
    func(4)
   
%run c:\python_class\modules\mod_test2.py
    
%%writefile c:\python_class\modules\mod_test3.py
def func(a):
    print("input value is ", a)

if __name__ == "__main__":
    print("모듈을 직접 실행")
    func(3)
    func(4)
else:
    print("모듈을 import해서 실행")    

%run c:\python_class\modules\mod_test3.py
import mod_test3

#
#
#
#
#
#
#
