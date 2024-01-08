##### 선형 회귀분석 (머신러닝에서의 선형회귀 모델 2)
# 
#          W     |   Cost W   
#      ----------------------
#        -3      |   74.67
#        -2.5    |   57.17 
#        -2      |   42.00
#        -1.5    |   29.17
#        -1      |   18.67
#        -0.5    |   10.50
#         0      |   4.67
#         0.5    |   1.17          ==> W가 1일때 최소값을 갖는 2차원 곡선
#         1      |   0.00
#         1.5    |   1.17
#         2      |   4.67
#         2.5    |   10.50
#         3      |   18.67
#         3.5    |   29.17
#         4      |   42.00
#         4.5    |   57.17
#         5      |   74.67
#
#       3) 경사하강법(Gradient descent algorithm)
#        - Cost function을 Minimize하는 알고리즘
#        - 경사하강법은 경사를 따라 내려간다는 알고리즘으로 Minimization 문제에 자주 사용됨
#       4) How it works?
#         . Start with initial guessues
#           + Start at 0,0 (or any other value) 
#           + Keeping changing W and b a little bit to try and reduce cost(W, b)
#         . Each time you change the parameters, you select the gradient which reduces cost(W,b) the most possible
#         . Repeat
#         . Do so until you cnverge to a local minimum
#         . Has an interesting property
#           + Where you start can determine which minimum you end up
#       5) Formal definition --> 수식 생략.. 
#       6) Gradient descent algorithm
#       7) Convex function
#         . Linear Regression에서의 Cost Function은 '볼록 함수(Convex Function)'으로 수렴하는 지점이 단 한군데라 
#           Global Minimum만 존재
#         . Cost(W,b)의 경우 3차원 좌표평면에 그래프를 그리면 아래쪽으로 볼록하게 생김
#         . 어디서 시작하나 한 군데로 모임, 항상 Gradient가 답을 제공함 
#
#       --> Gradient Descent Algorithm이 잘 동작할 수 있도록 Cost Function이 Convex 모양인지 확인하는 것이 중요  
#       --> 3차원 cost function 시작점에 따라 서로 도착하는 점 W, b가 다르기 때문에 제대로 작동하지 않을 수 있다.
#
#         그래프에서 Cost(W,b)가 울퉁불퉁한 모습이라면?
#         - 극소점(Local Minimum): 한 구역에서 가장 값이 작은 점
#         - 최소점(Global Minmum): 그래프 전체를 통해 제일 값이 작은 지점
#
#         Cost가 가장 작아지는 지점은 Global Minimum이지만, 시작지점에 따라 Global Minimum이 아닌
#         Local Minimum에 수렵할 수 있다.  ==> Gradient descent algorithm 오작동
#
#
# 1. 제공된 데이터를 바탕으로 TensorFlow를 활용하여 선형 회귀모델을 적합해 보시오 
#    (NaN 값이 생성될 경우 learning_rate를 조정하여 진행하시오)
#
#   적성검사 점수 (X)  | 65, 50, 55, 65, 55, 70, 65, 70, 55, 70, 50, 55
#   업무만족 점수 (Y)  | 85, 74, 76, 90, 85, 87, 94, 98, 81, 91, 76, 74
#
# 2. 제공된 데이터를 바탕으로 TensorFlow를 활용하여 선형 회귀모델을 적합해 보시오
#    (NaN 값이 생성될 경우 learning_rate를 조정하여 진행하시오)
#
#   운동시간 (X)      |  6,  5,  7,  3,  0,  4,  4,  1,  7,  5,  5,  0  
#   비만도   (Y)      | 30, 44, 39, 50, 29, 37, 39, 42, 36, 47, 27, 48
#

