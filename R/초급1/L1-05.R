# 벡터의 연산
# 벡터 : 1차원 형태의 데이터 저장 // 1차월 배열 데이터, 2차원 배열 데이터
# R에서 지원하는 자료 구조 
#   - 1차원 데이터 : 벡터
#   - 2차원 데이터 : 매트릭스, 데이터 프레임

x = c(1,2,3)                                 # 숫자형 벡터
y = c("a", "b", "c")                         # 문자형 벡터
z = c(TRUE, TRUE, FALSE, TRUE)               # 논리형 벡터 
x                                            # x에 저장된 값을 출력
y
z

w = c(1,2,3, "a", "b", "c")                  # 벡터를 생성할 때는 동일한 자료형으로 저장되어야 함
w 

v1 = 50:90                                   # v1 = c(50, 51, ... ,90)
v1
v2 = c(1,2,5, 50:90)
v2

# 일정한 간격의 숫자로 이루어진 벡터 생성
v3 = seq(1, 101, 3)
v3
v4 = seq(0.1, 1, 0.1)
v4

# 반복된 숫자로 이루어진 벡터 생성
v5 = rep(1, times=5)                        # 1을 5번 반복
v5
v6 = rep(1:5, times=5)                      # 1에서 5를 5번 반복
v6
v7 = rep(c(1,3,5), times=3)                 # 1,3,5를 3번 반복
v7

# 벡터의 원소값에 이름 지정
score = c(90, 85, 70)
score
names(score)                                # score에 저장된 값들의 이름을 보이시오
names(score) = c("John","Tom","Jane")       # 값들에 이름 부여
names(score)                                
score                                       # 이름과 값들이 함께 출력

str(score)
summary(score)
mode(score)
length(score)

# 데이터 지우기 
remove(score)                              # rm(score)


# 벡터에서 원소값 추출
d = c(1,4,2,7,8)
d[1]                                        # R에서 index는 1부터 시작
d[2]
d[3]
d[4]
d[5]
d[6]

# 여러 개의 값을 한 번에 추출하기
d[c(1,3,5)]                                # 1,3,5번째 값 출력
d[1:3]                                     # 처음 3개 값 출력 
d[seq(1,5,2)]                              # 홀수번째 값 출력
d[-2]                                      # 2번째 값을 제외하고 출력
d[-c(3:5)]                                 # 3~5번째 값을 제외하고 출력

# 벡터에서 이름으로 값을 추출하기
GNP = c(2090, 2450, 960)
GNP
names(GNP) = c("Korea", "Japan", "Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea", "Nepal")]
