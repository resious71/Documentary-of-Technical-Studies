# which()

score = c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)

# 69 위치 찾기
for(i in 1:length(score)){
  
  if(score[i] == 69){
    idx = i
  }
  
  print(score[i])
}
idx

# which() 함수는 조건에 맞는 인덱스(들)를 리턴
idx = which(score == 69)
idx

idx = which(score>=85)
idx

max(score)                            # max()는 벡터 중 최고값을 리턴
which.max(score)                      # which.max()는 최고값이 있는 인덱스를 리턴
min(score)
which.min(score)

idx = which(score <= 60)
idx
score [idx] = 61                     # score[c(4,6)]  = 61
score

# 80점 이상인 학생을 추출하여 또 다른 벡터를 만듦
idx = which(score>=80)
idx
highscore = score[idx]
highscore

# 꽃잎의 길이가 5.0 초과 데이터를 추출
idx = which(iris$Petal.Length>5.0)
idx
irisbig = iris[idx,]
irisbig

#1~4열에서의 값들 중 5.0 최과된 값의 행과 열의 위치를 알고자 하는 경우
idx = which(iris[, 1:4] > 5.0, arr.ind = TRUE)
idx
dim(idx)


