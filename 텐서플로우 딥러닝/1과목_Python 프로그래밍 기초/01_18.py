##### 함수 (람다(lambda)함수, 유용한 내장함수)
# 2장 Python 프로그래밍
# 5.함수
# 다. 람다(lambda) 함수
#   - 한 줄로 함수를 표현하는 함수 
#   - 람다함수는 인자를 전달하면 인자 활용 수행 코드를 통해 결과를 바로 반환한다.
#      > lambda <인자> : <인자 활용 수행 코드>
#   - 람다를 사용할 때는 람다 함수 전체를 소괄호로 감싸고 그 다음 별도의 소괄호에 인자를 사용함
#      > (lambda <인자>: <인자 활용 수행 코드>) (<인자>)
#   - 사용의 편리성을 위해 람다 함수를 변수에 할당해서 활용함
#     > func_lambda = lambda <인자> : <인자 활용 수행 코드>
#     > func_lambda(<인자>)
#

(lambda x: x**2)(3) 

Square = lambda x: x*2+3
Square(2)
Square(3)

Square = lambda x, y, z: x*2+y*3+z
Square(3,4,5)

# 라. 유용한 내장함수
#   1) 형 변환 함수
#  
#      형태     |   함수    |                 기능                        | 사용 예시
#   -----------------------------------------------------------------------------------------------------
#    정수형 변환 | int()    | 실수나 문자열(정수 표시) 데이터를 정수로 변환   | in: int(0.123), out: [0,3,123] 
#    실수형 변환 | float()  | 정수나 문자열(정수, 실수 표시)를 실수로 변환    | in: float(123), out: [0.0, 0.234, 0.124]
#    문자형 변환 | str()    | 정수나 실수 데이터를 문자열로 반환             | in: str(34212),  out: ['12','341413','543']
#    리스트 변환 | list()   | 튜플 or 세트 데이터를 리스트로 변환            | list((1,2)), list({1,2})
#    튜플  변환  | tuple()  | 리스트 or 세트 데이터를 튜플로 변환            | tuple([1,2]), tuple({1,2})
#    세트  변환  | set()    | 리스트 or 튜플 데이터를 세트로 변환            | set([1,2]), set((1,2))
#

[int(0.123), int(3.51238), int(-1.31223)]
[int(0), int(123), int(-567)]
[float('10'), float('0.123'), float('-567.89')]
[str(123), str(459678),str(-987)]
[str(0.123), str(345.678), str(-5.987)]

list_data = ['abc', 1, 2, 'def']
tuple_data = ('abc', 1, 2, 'def')
set_data = {'abc', 1, 2, 'def'}

[type(list_data), type(tuple_data), type(set_data)]

print("리스트 형태로 변환:", list(tuple_data), list(set_data))
print("튜플 형태로 변환:", tuple(tuple_data), tuple(set_data))

#   2) bool 함수
#    - 내장 함수인 bool()은 True 혹은 False의 결과를 반환한다.
#    - 숫자를 인자로 bool 함수를 호출하는 경우, 숫자가 0이면 False, 나머지 숫자에 대해 True를 반환
#    - 문자를 인자로 bool 함수를 호출하는 경우 문자가 있으면 True, 없으면 False를 반환
#    - 리스트, 튜플, 세트를 인자로 호출하는 경우, 비어있는 경우에만 False를 반환하고 나머지의 경우 True를 반환
#

bool(0)
bool(1)
bool(-10)
bool(5.12)

bool('a')
bool(" ")
bool("")
bool(None)

bool([1,2,3])
bool((1,2,3))
bool({1,2,3})

def print_name(s_name):
    if bool(s_name):
        print("Name is ", s_name)
    else:
        print("Need to input a name")

print_name("resisa")
print_name("")
