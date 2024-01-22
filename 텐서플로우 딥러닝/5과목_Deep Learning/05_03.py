# 머신러닝과 딥러닝 (머신러닝과 딥러닝의 비교 2)
#
# 1장. 딥러닝 개념과 활용
#    
#   - 최초의 신경망 모형의 개발  -- Hardware Implementations
#       . Perceptron
#       . Adaline
#   - 인공지능
#       . 1966년 다트머스 회의에서 당대의 인공지능 석할들은 "앞으로 20년 내에 로봇이 인간이 하는 
#         무엇이든지 한다" 
#       . 사전적인 의미의 '인공지능(Artificial Intelligence)'는 철학적인 개념으로 인간이나 지성을 갖춘
#         존재 또는 시스템에 의해 만들어진 인공적인 지능을 의미 함
#       . 메카시(John McCarthy), 민스키(Marvin Minsky), 뉴웰(Allen Newell)등 수학, 심리학, 컴퓨터 공학에 
#         종사하는 여러 학자들이 모여 "생각하는 기계"에 대해 서로 의견을 나누면서 인공지능이란 단어가 처음 사용됨
#   - 신경망 모형의 문제
#      (Simple) : XOR problem: Iinearly separable 
#      . Perceptrons(1969)
#         + We need to use MPL(Multilayer perceptrons) - multilayer neural nets
#         + No one on earch had found a viable way to train MLPs good enough to learn such simple functions
#
#          input         Hidden         Hidden          output
#          Layer   -->   Layer 1   -->  Layer 2   ==>   Layer
#
#      . 신경망 모형의 문제를 해결  --> Backpropagation
#        + 그 동안 해왔던 Backpropagation은 간단한 문제들에 대해서만 해결
#        + Layer의 수가 대략 10개 이상안 Multi Layer Network 일수록 Backpropagation은 Error가 뒤로 보내질 때 
#          뒤로 가면 갈수록 신호가 약해져서 Error가 거의 무의미해지고 학습이 되지 않음
#        + 이로 인해 복답한 문제에 대한 훈련을 할수록 Backpropagation의 성능이 더 떨어지게 됨   
#        + 성능이 좋은 다른 Machine Learning algorithms: Support Vectyor Machine, RandomForest, 등
#             
#      . Everyone else was doing something different 
#        + Candaian Institute for Advanced Research (CIFAR) : 캐나다에 위치한 단계
#        + 지금 당장 돈이 되지 않아도 연구를 계속하라는 등의 지원을 했음
#        + 1987년 Hinton이 캐나다로 이주하도록 동기를 부여한 후 Hinton이 Deep Learning을 계속 연구할 수 있도록 후원함 
#        + CIFAR 단체는 Deep Learning을 중심으로한 커뮤니티 형성에 큰 영향을 미침(LeCun 교수)
#
#      . Breakthough
#        + 마침내 2006년, 2007년 Hinton 교수와 Bengio교수의 논문들을 통해 큰 돌파구가 생기게 됨
#        + 그 전에 우리가 매우 '딥'한 문제들에 대해 학습을 시키는데 문제가 발생했는데 2006년 논문에서, 이러한 문제들이 
#          생기는 이유는 가중치의 초기값을 제대로 설정하지 못해서라고 이야기 함
#        + 가중치 초기값을 제대로설정한 Multi Layer Neural Networks는 무작위로 설정한 Multi Layer Neural Networks 보다 
#          실제로 훈련을 잘 할 수 있음
#        + 2007년에 그 초기값 문제가 맞으며 나아가 깊은 '딥'한 문제를 풀 수 있음을 보여주게 됨 
#        + Neural Nets가 아닌 Deep Nets(심층 학습), Deep Learing 으로 새로 리브랜딩 됨
#      . 성능이 점점 좋아짐 --> Neural network that can explain photos
#
#
