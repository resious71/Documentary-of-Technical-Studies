# 단일변수 범주형 자료의 탐색
#  
# 2. 단일변수 범주형 자료의 탐색
#  - 단일변수 범주형 자료(또는 일변량 질적 자료): 특성이 하나면서 자료의 특성이 범주형인 자료
#  - 범주형 자료에 대해서 할 수 있는 기본적인 작업은 자료에 포함된 관측갑들의 종류별로 개수를 세는 것
#  - 개수를 세면 종류별 비율을 알 수 있음
#  - 막대그래프나 워늑래프의 작성이 가능
#  - 단일변수 범주형 자료의 예 : 선호하는 계절
#  
# 도수분포표의 작성
favorite = c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL',
             'SUMMER', 'SPRING', 'SPRING')
favorite                                       # favorite 내용 출력
table(favorite)                                # 도수분포표 계산
table(favorite)/length(favorite)               # 비율 출력     

# 막대그래프의 작성
ds = table(favorite)
ds
barplot(ds, main="Favorite season")

# 원 그래프 작성
ds = table(favorite)
ds
pie(ds, main="Favorite season")

# 숫자로 표현된 범주형 자료 
# - 숫자 형태의 범주형 자료도 문자 형태의 범주형 자료와 마찬가지로 도수분포를 계산한 후,
# - 막대 그래프와 원 그래프르르 그려서 자료의 내용을 확인 

# 학생 15명이 선호하는 색깔을 조사한 자료 
#  ==> 2,3,2,1,1,2,2,1,3,2,1,3,2,1,2 (1 = Green, 2 = Red, 3 = Blue)

favorite.color = c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds = table(favorite.color)
ds

barplot(ds, main="Favorite color")
colors = c('green', 'red', 'blue')
names(ds) = colors                                    # 자료값 1,2,3dmf green, red, blue로 변경
ds
barplot(ds, main='Favorite color', col=colors)        # 색지정 막대 그래프
pie(ds, main='Favorite color', col=colors)            # 색지정 원 그래프

# 
# 
