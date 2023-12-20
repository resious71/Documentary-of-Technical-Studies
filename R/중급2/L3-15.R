###  k-fold 교차 검증 
# 1. k-fold 교차 검증 
#  - 예측모델을 개발하려면 그룹 정보가 포함된 데이터셋이 확보되어야 함 
#     ==> 데이터셋에 포함된 관련 관측값 갯수가 많을수록 좋음
#  - 확보된 데이터셋은 훈련용 데이터(training dataset)과 테스트용 데이터(test dataset)으로 구분
#  - 훈련용 데이터를 이용하여 분류(예측) 모델을 개발하고, 테스트용 데이터를 이용하여 예측을 실시
#  - 머신러닝의 목표 중 하나는 예측 정확도가 높은 모델을 만드는 것
#
# 1. k-fold 교차 검증 방법
#  - 단, 훈련용과 테스트용으로 데이터를 나눌 때, 데이터가 어떻게 나누어졌는가에 따라 
#    모델의 성능이 달라지는 문제가 있음  
#  - 이 문제를 해결하는 방법은 데이터를 임의로 훈련용과 테스트용으로 나누어 모델을 개발하는 과정을
#    여러번 반복하여 그곳에서 도출되는 예측 정확도의 평균을 구하는 것 
#  - 이것을 체계화한 방법론이 k-fold 교차 검증(k-fold cross validation)  : 보통 등분값 k = 10
#  - https://www.incodom.kr/k-%EA%B2%B9_%EA%B5%90%EC%B0%A8_%EA%B2%80%EC%A6%9D

library(cvTools)                                     # cvFolds() 함수gkatnwldnjs             
library(class)

k = 10                                               # 10-fold
folds = cvFolds(nrow(iris), K=k)                     # 폴드 생성  

acc = c()                                            # 폴드별 예측 정확도 저장용 벡터
for(i in 1:k){
  ts.idx = folds$which == i                          # 훈련용 데이터의 인덱스
  ds.tr  = iris[-ts.idx, 1:4]                        # 훈련용 데이터셋
  ds.ts  = iris[ts.idx, 1:4]                         # 테스트용 데이터셋  
  cl.tr  = factor(iris[-ts.idx,5])                   # 훈련용 데이터셋의 그룹(품종) 정보
  cl.ts  = factor(iris[ts.idx,5])                    # 테스트용 데이터셋의 그룹(품종) 정보
  
  pred = knn(ds.tr, ds.ts, cl.tr, k=5)                   
  acc[i] = mean(pred==cl.ts)                         # 예측 정확도
}
acc                                                  # 폴드별 예측 정확도
mean(acc)                                            # 폴드별 예측 정확도

