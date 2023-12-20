###  실루엣 분석 개요
#실루엣 분석: 각 군집 간의 거리가 얼마나 효율적으로 분리돼 있는지를 나타내는 것
# 다른 방법으로는 Elbow Method가 있음 (Inertia)

# 1. 실루엣 계수 (Silhouette Coefficient)
#  - 각각의 샘플마다 계산
#  - a: 나와 나와 같은 군집에 속한 샘플들 사이의 평균 거리
#  - b: 나와 나랑 그 다음으로 가까운 군집에 속한 샘플들 사이의 평균 거리
#  - −1 ≤ Si ≤ +1 범위를 가짐
#     + 즉, a가 낮고, b가 높으면 잘 군집화 된 것!
#     -> 나와 나의 군집의 샘플들과는 가깝고, 다른 군집과는 멀기 때문
#      Si = bi - ai / max(ai, bi)

# 2. 실루엣 스코어 (Silhouette Score)
# 전체 실루엣 계수의 평균
#    mean(Si)
#    ==> 높을수록 좋지만, 높다고 무조건 좋은 군집화라고 말하기는 어려움

# 3. cluster:: silhouette()

 df = iris[,-5]                        #명목형 제거
 model = kmeans(df, centers = 3)       #군집수 3개인 k-means 분석 실시

 model$cluster
 distance = dist(df)
 
library(cluster)
sil = silhouette(model$cluster, distance)
sil                                    # 각 데이터의 실루엣 계수는 sil_width 

plot(sil)
# 그래프에서 각 데이터의 실루엣 계수와 3개 군집의 평균 실루엣 계수(1 : 0.42, 2 : 0.80, 3 : 0.45)을 
# 확인할 수 있으며 전체 평균 실루엣 계수(0.55)을 확인


#전체 실루엣 계수 평균 구하는 함수 정의
 avg_sil <- function(k, data) {
     km.res <- kmeans(data, centers = k)
     ss <- silhouette(km.res$cluster, dist(data))
     avgSil <- mean(ss[, 3])
     return(avgSil)
 }

 #테스트할 군집수
 kClusters <-  2:10 
 
 #군집수에 따른 전체 실루엣 계수 결과 저장 변수 생성
 resultForEachK <- data.frame(k = kClusters, silAvg = rep(NA, length(kClusters))) 
 
 #전체 실루엣 계수 평균 결과 계산
 for(i in 1:length(kClusters)) {
        resultForEachK$silAvg[i] <- avg_sil(kClusters[i], df)
}
 
 #결과 그래프로 그리기 
 plot(resultForEachK$k, resultForEachK$silAvg,
          type = "b", pch = 19, frame = FALSE, 
          xlab = "Number of clusters K",
          ylab = "Average Silhouettes")

 # 군집수가 2일 때 평균 실루엣 계수가 가장 놓으로 실루엣 계수로만으로 판단할 때
 # 해당 데이터는 kmeans 수행시 , 최적 군집수는 2로 결정할 수 있다.
 
