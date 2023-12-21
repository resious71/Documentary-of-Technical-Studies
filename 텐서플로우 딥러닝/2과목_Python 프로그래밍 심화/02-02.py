##### NumPy의 개요 및 배열
# 
#  3) 특별한 형태의 배열 생성 
#   - zeros()와 ones()를 이용하여 0이나 1인 다차원 배열 생성 가능
#   - 1차원 배열의 경우 n을, 다차원 배열의 경우 m*n 형태로 생성
#      arr_zero_1 = np.zeros(n)
#      arr_zero_2 = np.zeros((m,n)) 
#      arr_one_1 = np.ones(n)
#      arr_one_2 = np.ones((m,n)) 
#   - 단위 행렬의 경우에는 eye()를 이용하여 사용한다
#      arr_eye = np.eye(n)

import numpy as np

np.zeros(10)
np.zeros((3,4))

np.ones(10)
np.ones((3,3))

np.eye(3)

#  4) 배열의 데이터 타입 변환 
#   - 숫자뿐만 아닌 문자의 배열을 생성할 수 있음
#     기호    |       내용
#      b      |  불, bool
#      i      |  기호가 있는 정수
#      u      |  기호가 없는 정수
#      f      |  실수
#      c      |  복소수
#      M      |  날짜
#      O      |  파이썬 객체
#   S or a    |  바이트 문자열
#      U      |  유니코드
#  
#   num_arr = str_arr.astype(dtype)
#

np.array(['0.5', '0.24', '2', '3.14', '3.141592'])
str1 = np.array(['0.5', '0.24', '2', '3.14', '3.141592'])
num1 = str1.astype(float)
num1

str1.dtype
num1.dtype

str_2 = np.array(['1','2','3','4','5'])
num_2 = str_2.astype(int)
num_2

num_f3 = np.array([10,20,0.543,5.67,9.87])
num_f3 = num_f3.astype(int)
num_f3

num_f3.dtype

#  5) 난수 배열의 생성 
#   - random 모듈을 이용해 난수 생성
#     rand_num = np.random.rand([d0, d1, ... , dn])
#     rand_num = np.random.randint(low, high, size)
# 

np.random.rand(2,3)                # 0 ~ 1 사이의 값 
np.random.rand()                   # 하나의 값만   
np.random.rand(4)                   
np.random.rand(2,3,4) 

np.random.randint(10, size=(4,4)) 
np.random.randint(1,40) 
