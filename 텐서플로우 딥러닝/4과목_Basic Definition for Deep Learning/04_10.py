# 로지스틱 회귀분석 (Classification, 이진분류, sigmoid, hypothesis)
# 1장. 딥러닝을 위한 머신러닝 이해
# 
#    1) Classification
#       - Credit Rating, Fraud Detection, Spam Detection, Facebook feed, Factory Line
#    2) Radiology (종양이 양성인지 음성인지), Finance
#       
#    3) 0,1, encoding
#      - Credit Rating: Band or Good
#      - Spam Detection: Span(1) or Ham(0)
#      - Facebook feed: Show(1) or Hide(0)
#      - Factory Line: Work(1) or Close(0)
#
#    4) work(1)/close(0) based on reservation amount
#       예약 대수에 따른 공장 폐쇄 여부(work(1)/close(0))
#       ==> 목표: 공장 폐쇄와 유지를 나누는 기준점 찾기
#
# Solve
#    1) 이진 분류를 Regression으로 해결
#        - We know Y is 0 or 1
#          H(x) = Wx + b
#        - Hypothesis can give values large thans 1 or less than 0 
#
#         1(work)      |           0   0    0  0 0    0     
#                      |             +   -    
#         0.5          | ---------+----------------------------------
#                      |       + - 
#         0(close)     |-----x--x--x---x---------------------------
#                         
#           + : H(X)이 0.5 이상이면 1로, 0.5 미만이면 0으로 분류
#           -: 새로운 INPUT까지 고려해 비용을 최소화하기 위해 아래와 같이 기울기가 줄어드는 방향을
#                 H(X) = WX 형태로 변함 
#
#            ==> 새로운 데이터에 따른 짃건을 그을 경우, 기존에 Work 였던 data가 Close로 인식될 수 있음
#                Classification에서는 결과값이 0,1이어야 하는데 1보다 클 수도 0보다 작을 수 도 있음 
#                   즉, 적합하지 않음
#
#        - We know Y is 0 or 1
#          H(x) = Wx + b
         
#         ==> 선형 회귀 모델을 사용하면 갑싱 1보다 훨씬 큰 경우도 많은데 Binary Classification을 하기 위해서는
#              예측값이 0고 1 사이에 있는 것이 유용하기 때무에 분류 문제에는 Logisctic Regression을 사용
#
#        - 통계적 모형 개발에서도 문제
#          . 결정계수(R2)가 매우 낮다
#          . F-test, t-test 를 통한 회귀 계수의 유의성 검증이 어렵다.
#          . OLS(Ordinary Least Square: 최소자승법)을 통한 계수 추정이 무의미
#          . 이진형 변수의 특성상 이분산 가능성이 높다 
#
#        - 선형 회귀모델에서는 최소제곱법으로 a와 b가 얼마인지 계산해서 회귀식을 찾는다.
#          (예를 들어, y = x + 5, y = 2x + 1) 이렇게 찾은 회귀식으로 x값에 따라 y값이 어떻게  
#          변하는지 예측하련느 것 --> 회귀분석 
#           . x값의 범위 -Inf ~ Inf
#           . y값의 범위 -Inf ~ Inf 
#
#          >>> x값은 - Inf와 Inf 의 범위를 갖고 있다 그런데 y값이 확률이면 0~1의 값을 갖기 때문에 
#              y 값이 다시 -Inf ~ Inf 값을 갖을 숭 ㅣㅆ게 수식을 변환시켜줘야 한다.
#                 1) 선형회귀 y = ax + b
#                 2) Y를 확률값 P로 바꾼다. (P=ax+b  P를 변형시켜 -Inf ~ Inf가 되게 하려고 한다)
#                 3) 첫번째 시도로 P대신 Odds를 적용한다. (P/(1-P), 오즈는 0~Inf 값을 갖게 된다)
#                 4) 두번째 시도록 P대신 로그 오즈를 적용한다 (Ln(Odds) = ax + b, 로그 오즈는 -Inf~Inf 값을 갖게 된다)
#                 5) Ln(Odds)=ax+b를 선형회귀식으로 변환한다.                
#
#
#                  Ln(p/1-p) = Bo + B1X
#                   Bo + B1X = k
#                   P/1-P = e^k
#
#                   1-P/P = 1/e^k
#
#                   1/P = 1/e^k + 1 = (1+ e^k)/e^k
#
#                   P = 1/(1+(e-^(B0+B1X))  <- Sigmoid 함수
#
#             >>> H(X) = Wx + b 
#            위에서 말한 문제점들로 인해 Linear Regression에서 사용하면 Hypothesis 함수에서 입력 값에 상관없이
#            0 또는 1 사이의 값을 만들어주는 가설 함수 설정
#
#                  Z = Wx + b
#                 g(z) = 1 / (1+e^-z)
#
#                 g(x): 0 ~ 1
#
#              >> Logistic Hypothesis(Sigmoid) 특징
#                - 분모에서 e^-z 값이 0에 가까우면 최종 결과가 1, 값이 커지면 최종 결과가 0에 가까워진다.
#                  = z 값이 커질수록 g(z)가 1에 가까워지고, z값이 작을수록 g(z)가 0에 가까워진다.
#                - Sigmode 함수의 e^-z 부분에 Linear Regression 의 Hypotheis를 넣었다. W^T는 transporse 된 W를 말한다.
#
#                   g(z) = 1 / (1+e^-z)   ==> H(x) = 1/(1 + e^-WtX)
#
