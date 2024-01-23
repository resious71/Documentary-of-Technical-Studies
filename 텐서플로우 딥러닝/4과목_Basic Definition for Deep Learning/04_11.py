# 로지스틱 회귀분석 (비용함수와 경사하강법, case study)
# 1장. 딥러닝을 위한 머신러닝 이해
#
#   1) Cost 
#
#     cost(W,b)
#     . Logistic Regression에서 Hypothesis가 다르게 세워짐
#     . Linear Regression에서 사용한 Gradient Decent를 사용한다면 지역 최저점에 걸려 진짜 최저점인 전역 최저점을 찾을 수 없게 됨
#       따라서, 새로운 Cost 함수를 정의해야 함
#
#   2) New cost function for logistic
#  
#     cost(w) = 1/m * sigma c(H(x),y)
#
#     C(H(x),y) =  -log(H(x))    : y = 1 --> (1) 
#                  -log(1-H(x))  : y = 0 --> (2) 
#
#     C(H(X),y) = -ylog(H(x)) - (1-y)log(1-H(x)) ***
#
#       (1)  Y = 1일 경우 -log(H(x))#
#            - 정확하게 예측할 경우, H(X) = 1 >> 매우 작은 값(거의 0) 작은 Cost 값 
#            - 정확하게 예측하지 못할 경우, H(x) >> 매우 큰 값(거의 무한대) 큰 Cost 값
#
#       
#     1) case study of cost function for logistic
#  
#         C(H(X),y) = -ylog(H(x)) - (1-y)log(1-H(x)) *** 
#
#     2) Minimize cost - Gradient decent algorithm
#
#          w := W - a q/qW COST(W)
#
#      # cost function
#      Cost = tf.reduce(mean(-t5f.reduce_sum(Y*TF.LG(HYPOTHESIS + (1-Y*TF.LOG(1-HYPOTHESIS)))
#
#      # Minimize
#      a = tf.Variable(0.1)  # Learning rate, alpha
#      optimizer = tf.train.GradientDescentOptimizer(a)
#      Train = optimizer.Minimize(cost)
#
#      >> 미분한 값에 그 차만큼 내려가겠다는 알파를 부여해 조금씩 내려가면 됨
#
