# 다중선형회귀분석 (다변량 회귀분석의이해(머신러닝))
# 1장. 딥러닝을 위한 머신러닝 이해
# 가. 다중회귀분석(multivariable linear regression) 
#   1) Recap
#     - Hypothesis   H(x) = Wx + b
#     - Cost function   cost(W,b)
#     - Gradient descent algorith  W := a(1/m)~~~
#
#   2) Predicting sale amount: Regression using one input(X) 
#     - Regression using one input X1, X2, X3 
#
#      * Hypothesis -->  H(x) = Wx + b
#
#       특징 개수만큼 가중치 W의 개수가 늘어남
#       b는 in put과 독립적으로 존재하기 때문에 그대로 하나만 존재
#
#       서로 다른 역할을 하는 각 특징에게 고유한 중요도 부여
#
#       H(x1, x2, x3) = w1x1 + w2x2 + w3x3 + b
#
#      * Cost function   cost(W,b) = 1/m * ~~~
#
#    3) Matrix
#       ==> Dot Product  
#  
#    4) Hypothesis using Matrix
#  
#     w1x1 + w2x2 + w3x3 + ... + wkxk  ==> x와 w의 위치가 바뀌어도 상관없음
#
#
#                   w1 
#     (x1, x2, x3) (w2) = (w1x1 + w2x2 + w3x3)
#                   w3
#
#       H(x) = XW
#      Input 데이터: (인스턴스 개수:n) * (특징 개수: k)  크기의 행렬
#                                X
#                가중치 W : (특징 개수:k) * 1 크기의 벡터
#
#    5) Hypothesis using matrix (n output)
#
#        H(x) = XW
#

   
