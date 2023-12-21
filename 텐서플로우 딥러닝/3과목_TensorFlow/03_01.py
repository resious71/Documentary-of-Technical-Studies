##### TensorFlow 정의 및 활용분야
# 1장 TensorFlow 소개
# 가. TensorFlow란 ?
#   1) 개요
#    - Google에서 만든 딥러닝을 쉽게 구동할 수 있게 하는 라이브러이
#    - 기본적으로 C++로 구현되어 있으며, Python, Java, Go 등 다양한 언어를 지원함
#    - Python을 최우선적으로 지원하고 있으며, 대부분의 편의 기능이 Python 라이브러리로 구성되어 있음
#  
#    High Level         |
#    TensorFlow APIs    |            Estimators
#    ------------------------------------------------------------------
#    Mid Level          |
#    TensorFlow APIs    | Layers     Datasets     Metrcis
#    ------------------------------------------------------------------
#    Low Level          |
#    TensorFlow APIs    |              Python*     C++  Java  Go
#    ------------------------------------------------------------------
#    TensorFlow         |
#    Kernel             | TensorFlow Distributed Execution Engine
#    ------------------------------------------------------------------ 
#
#    - caffe/keras/mxnet 등 머신러닝을 구현할 수 있는 툴이 존재함
#    - 현재 TensorFlow 의 활용이 압도적으로 높음
#    - 많은 사람들이 TensorFlow를 이용하고 있기 때문에 자료를 얻기 쉬움
#
#  2) 의미 
#   - TensorFlow에서 Tensor(텐서)는 데이터를 표현하는 방식을 의미함
#     . Tensor는 행렬로 표현할 수 있는 2차원 형태의 배열을 높은 차원으로 확장한 것을 의미
#   - 데이터 플로우 그래프(Dataflow Graph) 방식을 이용, 수학 계산과 데이터의 흐름을
#     노드(Node)와 엣지(Edge)를 사용한 방향 그래프로 표현함 **
#     . Data Flow Graphs는 노드와 엣지로 구성되어 있음
#       + 노드: 각각의 노드는 Operation
#       + 엣지: Data Array
#     . 노드와 엣지를 통해 원하는 연산을 하고 결과를 얻음  
#   - 데이터를 의미하는 Tensor와 Dataflow Graph를 따라 연산이 수행되는 형태(Flow)를 합쳐 
#     TensorFlow란 이름이 나오게 됨
#  
#  3) 특징
#   - Data Flow Graph를 통한 풍부한 표현 
#   - 코드 수정없이 CPU/GPU 모드로 동작 가능
#   - 아이디어 테스트에서 서비스 단계까지 이용이 가능
#   - 계산 구조 및 목표 함수만 정의하면 미분이 자동으로 계산됨
#   - 브라우저에서 실행가능한 시각화 되구인 TensorBoard를 제공하여 학습 과정을 추적할 수 있음
#
# 나. TensorFlow 활용 분야
#  1) 머신러닝
#   - 주어진 데이터를 이용해 컴퓨터가 스스로 학습하는 방식
#   - 규칙기반 인공지능으로 볼 수 있으며 식별할 수 있는 특징을 컴퓨터에 학습시켜야 함
#   - 데이터가 많을수록 더 좋은 특징들을 발견하여 정확도를 높일 수 있음
#  2) 딥러닝
#   - 개요
#    . 머신러닝의 세부 방법론인 인공신경망에서 발전된 알고리즘
#    . 머신러닝의 부분집합으로 머신러닝 이론과 크게 다르지 않음
#    . 응용 목적별 다양한 신경망으로 발전하고 있음 
#      + Deep Learning < Machine Learning < Artificial Intelligence 
#   - 종류
#    . CNN(Convolutional Neural Network)
#      : 특징맵을 생성하는 필터 학습이 가능하여 비전(Vision) 분야에서 활용
#    . RNN(Recurrent Neural Network
#      : 순차적 정보가 담긴 데이터를 통해 규칙적인 패턴과 정보를 추출하는 방법으로
#        테긋트, 음성, 음악, 영상 등의 분야에서 활용
#    . RBS(Restricted Boltzmann Machine과 DBN
#      : 제한된 볼츠만 머신은 비지도 학습으로 차원 축소, 분류, 선형 회귀 분석, 필터링
#        특징값 학습, 주제 모델링 등에 사용되는 알고리즘
#
#   - 머신러닝은 주어진 소재를 우선 인간이 처리하여 컴퓨터를 학습시키는 방법
#      . Input --> Feature extraction(human) --> Classification --> Output
#   - 딥러닝의 경우 인간의 작업이 생략되고, 알고리즘을 이용하여 스스로 분석하는 방법
#      . Input --> Feature extraction * Classification --> Output 
