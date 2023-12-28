##### 머신러닝이란 무엇인가, 지도학습 비지도학습, 머신러닝 모델 생성 단계
# 
# 1장. 딥러닝을 위한 머신러닝의 이해
# 가. Machine Learning이란 무엇인가? 
#   - 2016년 3월 알파고와 이세돌 9단 간 세기의 바둑 대결 이후 인공지능(AI)의 잠재력이 
#     대중의 관심까지 사로 잡음
#   - 명시적 프로그램(explicit programming)의 한계
#     . Spam filter: many rules (개발자가 일일이 스팸을 찾기가 어렵다)
#     . Automatic driving(자동주행차량) : 많은 rules이 존재
#   - 머신러닝은 주어진 데이터를 이용해 컴퓨터가 스스로 학습
#   - 식별할 수 있는 특징을 컴퓨터에 학습시켜야 함
#   - 데이터를 많이 보유할수록 더 좋은 특징들을 발견할 수 있음(정확도 상승)
#   - 머신러닝은 지도학습(Supervised learning) 패러다임 기반으로 수많은 예시를 기계로 전달함
#
#        input x
#        |  |
#        |  --------------- 
#        |   Function f:   |
#        |                 |
#        -------------     |
#                     |    |
#                 output f(x)
#
#  1) 지도학습 (Supervised learning)
#   - Supervised learning   
#      . training set을 바탕으로 프로그램이 학습을 시행 
#   - 머신러닝에서 일반적으로 문제를 해결하는 방법
#   - 예시 
#      . 이미지 인식(Image labeling)
#      . 신용평가 시스템(Credit Rating System)
#      . 사기방지 시스템(Fraud detection)
#      . 자동 스팸 필터(Email span filter)
#      . 시험 점수 예측(Predicting exam score)
#
#  2) 비지도학습(Unsupervised learning)
#   - Unsupervised learning 
#      . 데이터를 보고 레이블 없이 프로그램이 스스로 학습해야 하는 것 (Un-labeled data)
#   - 예시
#      . 구글 뉴스 그룹핑(Google news grouping)
#      . 단어 중 비슷한 단어 그룹 (Word clustering)
#      . Social network analysis
#      . Astronomical data analysis
#
#  3) 머신러닝의 모델 생성 단계
#   - Training data set을 학습하고 다시 test data set을 이용하여 예측을 실시,
#     이를 통해 생성된 model을 통해 답을 내게 됨
#
#    Traning Dataset
#
#    X   |  Y (label)                                 Test Dataset
#  --------------                                    Xtest = [9,5,2]
#  2,4,7 |  1                                              |  
#  8,6,4 |  2            학습을 통한 모델 생성               |      
#  2,3,5 |  1           --------------------->          머신러닝
#                                                          |
#  Y 주어진 값(Target)                                    Y = 2
#  X는 값의 특징 혹은 feature
#
#  4) Types of supervised learing
#   - 어떤 시험을 준비하는 시간에 따른 성적에 대한 예측
#      + Regression : 시험점수(1~100)를 예측
#   - Binary Classification
#      + 합격과 불합격 'Pass/Fail'을 예측, 둘 중 하나를 고르는 것
#   - Multi-label Classification
#      + A, B, C, D 등의 학점을 예측
#
