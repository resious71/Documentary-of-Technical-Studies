##### matplotlib 기초 (Data 시각화 2)
# 3장. Matplotlib
# 가. 데이터 시각화
#   4) 그래프의 출력 범위 지정하기
#    - matplotlib에서 그래프의 x축과 y축의 좌표 범위를 지정해 전체 그래프 중
#      관심 영역만 그래프로 그릴 수 있음
#       > plt.xlim(xmin, xmax)       # x축의 좌표 범위 지정(xmin ~ xmax)
#       > plt.ylim(ymin, ymax)       # y축의 좌표 범위 지정(ymin ~ ymax)
#    - x, y축의 좌표 범위를 가져 오는 방법
#       > [xmin, xmax] = plt.xlim()      # x축의 좌표 범위 가져오기
#       > [ymin, ymax] = plt.ylim()      # y축의 좌표 범위 가져오기
#

import matplotlib.pyplot as plt
import numpy as np

x=np.linspace(-4, 4, 100)
y1 = x**3
y2 = 10*x**2 - 2

plt.plot(x, y1, x, y2)
plt.show()

plt.plot(x, y1, x, y2)
plt.xlim(-1,1)
plt.ylim(-3,3)
plt.show()

# 나. 그래프 꾸미기
#   - 그래프의 축 라벨, 제목, 격자, 문자열을 추가하는 방법
#   - fmt 옵션을 이용하면 그래프의 컬러, 선의 스타일, 마커 지정을 할 수 있음
#     > fmt = '[color][line_style][marker]'
#   - 컬러, 선 스타일 약어 
#      + b(blue), g(green), r(red), c(cyan) ...
#      + - (solid), -- (dashed),  : (dotted),  -. (dash-dot), ...
#   - 마커 약어  (생략..)
#   - plt.legend()에서 사용되는 loc 옵션을 통해 범례 위치 지정 (0 ~ 10)
#   - 그래프 한글 표시법 : matplotlib에서 사용하는 폰트를 한글 폰트로 지정해야 함
#      > import matplotlib
#      > mataplotlib.rcParams['font.family']
#   - 폰트 변경 변
#      > matplotlib.rcParams['font.family'] = 'font_name'
#      > matplotlib.rcParam['axes.Unicode_minus'] = False
#   - 한글 폰트 지정 후 그래프에서 마이너스(-) 폰트가 깨지는 문제 해결
#      > matplotlib.rcParams['axes.unicode_minus'] = False
#   - matplotlib에서 사용 가능한 폰트 이름
#      > import matplotlib.font_manager
#      > Font_list = matplotlib.font_manager.get_fontconfig_fonts()
#      > Font_names = matplotlib.font_manager.Fontproperties(fname=fname).get_name() for fname in font_list
#      >
#      > f = open("c\python_code\my_font_list.txt", w)
#      > for font_name in font_names:
#      >    f.write(font_name + "\n")
#      > f.close()
#

x = np.arange(0,10,1)
y1 = x
y2 = x+2
y3 = x+4
y4 = x+6

plt.plot(x, y1, 'm', x, y2, 'y',  x, y3, 'k', x, y4 , 'c')
plt.show()

plt.plot(x, y1, '-', x, y2, '--',  x, y3, ':', x, y4 , '-.')
plt.show()

plt.plot(x, y1, 'o', x, y2, '^',  x, y3, 's', x, y4 , 'd')
plt.show()

plt.plot(x, y1, '>--r', x, y2, 's-g',  x, y3, 'd:b', x, y4 , '-.Xc')
plt.show()

x = np.arange(-4.5, 5, 0.5)
y = 2*x**3

plt.plot(x,y)
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.title('Graph title')
plt.grid(True)
plt.show()

#####

x = np.arange(0,5,1)
y1 = x
y2 = x+1
y3 = x+2
y4 = x+3

plt.plot(x, y1, '>-r', x, y2, 's-g', x, y3, 'd:b', x, y4, '-.Xc')
plt.legend(['data1', 'data2', 'data3', 'data4'])
plt.show()

import matplotlib

matplotlib.rcParams['font.family'] = 'Malgun Gothgic'    # 맑은 고딕으로 설정
matplotlib.rcParams['axes.unicode_minus'] = False

plt.plot(x, y1, '>-r', x, y2, 's-g', x, y3, 'd:b', x, y4, '-.Xc')
plt.legend(['데이터1', '데이터2', '데이터3', '데이터4'], loc='best')
plt.xlabel('X축')
plt.ylabel('Y축')
plt.title('그래프 제목')
plt.show()

plt.plot(x, y1, '>-r', x, y2, 's-g', x, y3, 'd:b', x, y4, '-.Xc')
plt.text(0, 6, "문자열 출력 1")
plt.text(0, 5, "문자열 출력 2")
plt.text(3, 1, "문자열 출력 3")
plt.text(3, 0, "문자열 출력 4")
plt.show()

#
#
