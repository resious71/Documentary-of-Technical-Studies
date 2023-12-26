##### NumPy - 배열 연산과 인덱싱, 슬라이싱 (배열 연산 1)
# 
# 다. 배열 연산
#  1) 기본 연산
#   - 배열의 형태가 같은 경우 덧셈, 뺄셈, 곱셈, 나눗셈 연산이 가능
#       
#        기호      |   내용
#      ------------------------
#        +         |  더하기
#        -         |  빼기
#        *         |  곱셈
#       **         |  거듭제곱
#        /         |  나누기 
#       >,<,>=,<=  |  비교 연산자
#
#  2) 통계를 위한 연산 
#   - 배열의 합, 평균, 표준편차, 분산, 최솟값, 최댓값, 누적합, 누적곱 등
#
#       메서드     |  내용
#     --------------------------
#      sum()      |  합 
#      mean()     |  평균
#      std()      |  표준편차
#      var()      |  분산
#      min()      |  최솟값
#      max()      |  최댓값
#      cumsum()   |  누적합
#      cumprod()  |  누적곱
#

import numpy as np

arr1 = np.array([10,20,30,40])
arr2 = np.array([1,2,3,4])

arr1 + arr2
arr1 - arr2
arr2 * 2
arr2 ** 2
arr1 * arr2
arr1/arr2
arr1/(arr2**2)

arr1 > 20

arr3 = np.arange(5)
arr3

[arr3.sum(), arr3.mean()]
[arr3.std(), arr3.var()]
[arr3.min(), arr3.max()]
[arr3.cumsum(), arr3.cumprod()]

#  3) 행렬 연산
#   - 단순 연산 뿐만 아니라 선형대수를 위한 행렬 연산도 지원함
#   
#           사용 예                      |       내용 
#    -------------------------------------------------------------------
#     A.dot(B), or np.dot(A,B)          | 행렬곱(matrix product)
#     A.transpose(), or np.transpose(A) | 전치행렬(transpose matrix) 
#     np.linalg.inv(A)                  | 역행렬(inverse matrix)
#     np.linalg.det(A)                  | 행렬식(determinant) 
#  

A = np.array([1,2,3,4]).reshape(2,2)
A

B = np.array([9,8,7,6]).reshape(2,2)
B

A+B
A-B

A.dot(B)
np.dot(A,B)

np.transpose(A)
np.linalg.inv(A)
np.linalg.det(A) 
