##### matplotlib 기초 (Data 시각화 1)
# 3장. Matplotlib
# 가. 데이터 시각화
#   1) matplotlib으로 그래프 그리기
#    - 파이썬에서 데이터를 효과적으로 시각화하는 라이브러리
#    - MATLAB의 시각화 기능을 모델링해서 만들어 짐
#    - 몇 줄의 코드로 간단하게 2차원 선 그래프, 산점도, 막대 그래프, 히스토그램, 파이 그래프를 그릴 수 있다.
#      > import matplotlib as mpl
#      > import matplotlib.pylab as plt        # mataplotlib 블러오기 
#      > %matplotlib qt                        # 팝업 출력 
#      > %matplotlib inline                    # 코드북에 출력
#
#    2) 선 그래프
#     - 선 그래프를 그리기 위해서는 x,y 시퀀스의 길이가 같아야 함
#      > plt.plot([x,], y[,fmt])  
#      > plt.plot(y)
#      > plt.plot(y,fmt)
#      > plt.plot(x,y)
#      > plt.plot(x,y,fmt)
#     - format string(fmt): 다양한 형식으로 그래프를 그릴 수 있는 옵션

import matplotlib.pyplot as plt

data1 = [10,14,19,20,25]
plt.plot(data1)
plt.show()

import numpy as np
x = np.arange(-4.5, 5, 0.5)
x

y = 2*x**2
[x,y]

plt.plot(x,y)
plt.show()

# 
#    3) 여러 그래프 그리기
#     - 여러 데이터를 효과적으로 표현하기 위한 방법
#      > plt.plot([x1,] y1[, fmt1])
#      > plt.plot([x2,] y2[, fmt2])
#      >   ... 
#      > plt.plot([xn,] yn[, fmtn])  # 하나의 그래프 창에 여러 개를 표시하는 방법(1)
#      > 
#      > plt.plot(x1, y1 [,fmt1], x2, y2 [,fmt2]), ..., xn, yn [,fmtn])
#      > # 하나의 그래프 창에 여러 개를 표시하는 방법(2)
#      > 
#      > plt.plot(x1, y1, x2, y2, ... , xn, yn)
#      > plt.plot(x1, y1, fmt1, x2, y2, fmt2, ... , xn, yn, fmtn)
#      > plt.plot(x1, y1, x2, y2, fmt2, ... , xn, yn)
#      > plt.plot(x1, y1, fmt1, x2, y2, ... , xn, yn)    # 포맷을 넣거나 생략하는 구문
#
#     - 여러 개 창으로 그래프 그리기
#      > plt.plot(x,y1)            # 첫 번째 그래프 그리기
#      > plt.figure()              # 새로운 창 생성
#      > plt.plot(x, y2)           # 두 번째 그래프 그리기
#      > plt.show()                # 그래프 창에 출력
# 
#     - 하나의 창에 여러 그래프 창 그리기
#      > plt.subplot(m,n,p)
# 

x = np.arange(-4.5, 5, 0.5)
y1 = 2*x**2
y2 = 5*x + 30
y3 = 4*x**2 + 10

plt.plot(x, y1)
plt.plot(x, y2)
plt.plot(x, y3)
plt.show()

plt.plot(x, y1)
plt.figure()
plt.plot(x, y2)
plt.show()

#####

x = np.arange(-10,10,1)
y1 = x**2-2
y2 = 20*np.cos(x)**2

plt.figure(1)
plt.plot(x, y1)

plt.figure(2)
plt.plot(x, y2)

plt.figure(1)
plt.plot(x, y2)

plt.figure(2)
plt.clf()
plt.plot(x, y1)

plt.show()

#####

x = np.arange(0, 10, 0.2)
y1 = 0.4*(x-5)**2 + 2
y2 = -1.7*x + 4
y3 = np.sin(x)**2
y4 = 15*np.exp(-x) + 1 

plt.subplot(2,2,1)
plt.plot(x, y1)

plt.subplot(2,2,2)
plt.plot(x, y2)

plt.subplot(2,2,3)
plt.plot(x, y3)

plt.subplot(2,2,4)
plt.plot(x, y4)

plt.show()
