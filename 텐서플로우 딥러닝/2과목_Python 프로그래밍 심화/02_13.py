##### Matplotlib - 그래프 그리기 (산점도, 막대그래프, 히스토그램, 파이그래프, 그래프 저장하기)
# 3장. Matplotlib
# 다. 산점도
#   - 산점도(Scatter plot)는 두 개의 요ㅗㅅ로 이루어진 데이터 집합의 관계를 그림으로표현한 것
#     > plt.scatter(x y [,s=size_n, c=colors, marker='marketer_string', alpha=alpha_f])
#   

import matplotlib.pyplot as plt
import numpy as np

height = [178, 165, 188, 160, 187, 185, 165, 176]
weight = [72, 67, 65, 64, 90, 85, 53, 64]

plt.scatter(height, weight)
plt.xlabel("Height(m)")
plt.ylabel("Weight(kg)")
plt.title("Height & Weight")
plt.grid(True)

size = 100 * np.arange(1,8)                       # 데이터별로 마커 크기 지정
colors = ['r', 'g', 'b', 'c', 'm', 'k', 'y']      # 데이터별로 마커의 컬러 지정

plt.scatter(height, weight, s=size, c=colors)
plt.show()

#####

city = ['서울', '인천', '대전', '대구', '울산', '부산', '광주']

# 위도(latitude)와 경고(longitude)
lat = [37.56, 37.45, 36.35, 35.87, 35.53, 35.18]
lon = [126.97, 126.70, 127.38, 128.60, 129.31, 129.07]

plt.scatter(lon, lat)

# 인구 밀도 (명/km^2): 2017년 통계청 자료
pop_den = [165154, 2751, 2839, 2790, 1099, 4454, 2995]

size = np.array(pop_den) * 0.2
colors = ['r', 'g', 'b', 'c', 'm', 'k', 'y']  

plt.scatter(lon, lat, s=size, c=colors, alpha=0.5)
plt.xlabel("경도")
plt.ylabel("위도")
plt.title("지역별 인구 밀도(2017)")

for x, y, name in zip(lon, lat, city):
    plt.text(x, y, name)

plt.show()

#
# 라. 막대그래프
#   - 값을 막대의 높이로 나타내어 여러 항목의 수량 비교에 탁월함 
#     > plt.bar(x, height [,width=width_f, color=colors, tick_label=tick_labels, 
#       align='center'(기본) 혹은 'edge', 'label=labels])
#     # 여기서 height는 막대 그래프 이름  
# 

member_IDs = ['m1', 'm2', 'm3', 'm4']     # 회원 ID
before_ex = [45, 35, 42, 38]              # 운동 시작 전 팔굽혀 펴기 횟수
after_ex = [49, 42, 49, 37]              # 운동 한달 후 팔굽혀 펴기 횟수 

n_data = len(member_IDs)                  
index = np.arange(n_data)
plt.bar(index, before_ex)
plt.show()

plt.bar(index, before_ex, tick_label=member_IDs)
plt.show()

colors = ['r', 'g', 'b', 'c']
plt.bar(index, before_ex, color = colors, tick_label=member_IDs)
plt.show()

plt.bar(index, before_ex, color = colors, tick_label=member_IDs, width=0.3)
plt.show()

colors = ['r', 'g', 'b', 'c']
plt.barh(index, before_ex, color = colors, tick_label=member_IDs)
plt.show()

###
barWidth = 0.4 
plt.bar(index, before_ex, color='c', align='edge', width=barWidth, label='before')
plt.bar(index + barWidth, after_ex, color='m', align='edge', width=barWidth, label='after')

#
# 마. 히스토그램
#   - 데이터의 분포를 파악할 때 주로 사용 
#     > plt.hist(x, [,bins=bins_f 혹은 'auto'])
#     #  x = 변량 데이터
#     #  bin = 계급의 개수로 기본 10, auto의 경우 x에 맞게 자동으로 입력
#     # 막대그래프: 번주형 데이터 분포, 히스토그램: 연속형 데이터의 분포 파악 
#

stat = [76, 82, 84, 83, 90, 86, 85, 92, 72, 71, 100, 87, 81, 76, 94, 78, 81, 60, 79, 69, 74, 87, 82, 68, 79]
plt.hist(stat)

plt.hist(stat, bins=8)
plt.xlabel("Test Score")
plt.ylabel("Frequency")
plt.title("Histogram of Math Test")
plt.grid()
plt.show()


# 바. 파이그래프
#   - 전체 데이터에서 각 항목이 차지한 비율을 비교할 때 활용
#     > plt.pie(x, [,labels=label_seq, autopct = '비율 표시 형식(ex:%0.if)',
#     >         shadow=False(기본) 혹은 True, explode=explode_seq,
#     >         counterclock=True(기본) 혹은 False, startangle=각도(기본은 0)])
#     > 
#

fruit = ['Apple', 'Banana', 'Stawberry', 'Orange', 'Grafe']
result = [6,7,4,2,1]
explode_value = (0.1,0,0,0,0)

plt.figure(figsize=(5,5))
plt.pie(result, labels = fruit, startangle=90, counterclock=False, autopct='%.1f%%')
plt.show()

plt.pie(result, labels = fruit, startangle=90, counterclock=False, explode=explode_value, shadow=True)

# 사. 그래프 저장
#   - 그래프를 이미지 파일로 저장하여 다른 자료에서 활용 가능
#     > plt.savefig(file_name, [, dpi=dpi_n(기본은 72)])
#

import matplotlib as mpl
mpl.rcParams['figure.figsize']
mpl.rcParams['figure.dpi']

x = np.arange(0,10,1)
y1 = x
y2 = x+2
y3 = x+4
y4 = x+6

plt.plot(x,y1, x, y2, x, y3, x, y4)
plt.grid(True)
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Saving a figure')
plt.savefig('C:\python_class\saveFigTest1.png', dpi=100)
plt.show()

