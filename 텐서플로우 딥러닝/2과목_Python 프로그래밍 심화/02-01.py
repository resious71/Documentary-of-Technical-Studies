##### 
# 1장. NumPy
# 가. 개요
#   - C언어로 구현된 파이썬 라이브러리
#   - Nemerical Python의 줄임말로 벡터 및 행렬 연산에 특화된 기능 제공
#   - 아나콘다를 설치할 경우 기본적으로 NumPy 패키지를 설치함
# 
# 나. 배열 생성하기
#   - 배열(Array)이란 순서가 있는 같은 종류의 데이터가 저장된 집합을 의미
#   - NumPy를 통해 배열을 생성할 수 있음
#   - import 구문을 통해 설치된 NumPy를 불러 사용함
#      import numpy as np
#
#  1) 시퀀스 데이터로부터 배열 생성 
#   - 시퀀스 데이터를 인자로 받아 배열 객체를 생성
#   - 리스트와 튜플 타입의 데이터를 사용할 수 있으나 주로 리스트 데이터를 이용함
#      import numpy as np
#      arr_object = np.array(seq_data)  

import numpy as np
data1 = [0,1,2,3,4,5,6,7,8]
a1=np.array(data1)
a1

data2 = [0.1, 3, 5, 10, 0.25]
a2 = np.array(data2)
a2

a1.dtype
a2.dtype

np.array([0.5, 2, 6, 0.01])
np.array([[1,2,3],[4,5,6],[7,8,9]])

#  2) 범위를 지정해 배열 생성 
#   - arrange()를 이용하여 배열을 생성할 수 있음
#   - start와 stop 문그를 이용해 범위를 지정하여 배열을 생성 할 수 있음
#     arr_object = np.arrange(start, stop, step)   # step default = 1 , 생략 가능
#   - 시작과 끝을 지정하고 데이터의 개수를 지정하여 배열을 생성할 수 있음
#     arr_object = np.linspace(start, stop, num)

np.arange(0, 10, 2)
np.arange(1,10)
np.arange(5)

np.arange(12).reshape(4,3)          # 벡터를 4행 3열의 행렬로 

b1 = np.arange(12).reshape(4,3)
b1.shape

b2 = np.arange(5)
b2
b2.shape

np.linspace(1,10, 10)

np.linspace(0, np.pi, 20)
