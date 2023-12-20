# k-fold 교차 검증
install.packages("cvTools")
library(class)                              # knn() 함수 지원
library(cvTools)                            # cvFolds() 함수 지원


k = 10                                      # 등분값 설정
folds = cvFolds(nrow(iris), K = k)
folds

# 예측 정확도를 저장할 벡터 지정

acc = c()

for(i in 1:k){
   ts.idx = folds$which == i                # 데이터의 인덱스
   ds.tr = iris[-ts.idx, 1:4]               # 훈련용 데이터셋    
   ds.ts = iris[ts.idx, 1:4]                # 테스트용 데이터셋
   cl.tr = factor(iris[-ts.idx, 5])         # 훈련용 데이터셋의 그룹(품종) 정보
   cl.ts = factor(iris[ts.idx, 5])          # 테스트 데이터셋의 그룹(품종) 정보


   pred = knn(ds.tr, ds.ts, cl.tr, k = 5)
   acc[i] = mean(pred == cl.ts)
}
acc                                         # 폴드별 예측 정확도
mean(acc)                                   # 폴드 평균 예측 정확도 

################################################################################
# mlbench 패키지에서 제공하는 Vowel 데이터셋에 대해 k-최근접 이웃 알고리즘을 
# 이용하여 모델을 만들고 예측 정확도를 측정하시오
#  - 최근접 이웃에서 k = 5로 한다.
#  - 10-fold 교차 검증 방법으로 예측 정확도를 측정한다. 

library(class)                              # knn() 함수 지원
library(cvTools)                            # cvFolds() 함수 지원

library(mlbench)                            # cvFolds() 함수 지원

data(Vowel)
dim(Vowel)
head(Vowel)

ds.new = Vowel                              # 데이터셋 준비
folds = cvFolds(nrow(ds.new), K = 10)
str(folds)
acc = c()

for(i in 1:10){
  idx = folds$which == i 
  x.train = ds.new[-idx, -11] 
  y.train = ds.new$Class[-idx]
  x.test  = ds.new[idx, -11]
  y.test  = ds.new$Class[idx]
  
  pred = knn(x.train, x.test, y.train, k=5)
  acc[i] = mean(pred == y.test)
}
acc
mean(acc)
