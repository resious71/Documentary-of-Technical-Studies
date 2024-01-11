##### Matplotlib - 그래프 그리기 (Pandas에서 그래프 그리기)
# 3장. Matplotlib
# 아. Pandas에서 그래프 그리기
#   - Pandas의 그래프 구조
#     > Series_data.plot([kind='graph_kind'][,option])
#     > DataFrame_data.plot([x=label 혹은 position, y=label 혹은 position,][kind='graph_kind'][,option])
#
#           kind 옵션     |      의미
#         --------------------------------------  
#           line         | 선그래프 (기본)
#           scatter      | 산점도 (DataFrame 데이터만 가능)
#           bar          | 수직 바 그래프
#           bash         | 수평 바 그래프
#           hist         | 히스토그램
#           pie          | 파이 그래프
#

import pandas as pd
import matplotlib.pyplot as plt

s1 = pd.Series([1,2,3,4,5,6,7,8,9,10])
s1

s1.plot()
plt.show()

s2 = pd.Series([1,2,3,4,5,6,7,8,9,10], index = pd.date_range('2019-01-01', periods=10))
s2

s2.plot()
plt.show()

s2.plot(grid=True)
plt.show()

#####

df_kbo = pd.read_csv('C:\python_class\data\kbo.csv', encoding="cp949", index_col="year")
df_kbo

df_kbo.plot()
plt.show()

kbo_plot = df_kbo.plot(grid=True, style=['r--*', 'g-o', 'b:*', 'm-.p'])
kbo_plot.set_xlable("Year")
kbo_plot.set_ylable("Wining-Rate")
kbo_plot.set_title("Pro Basebasll")
plt.show()

#####

temperature = [25.2, 27.4, 22.9, 26.2, 29.5, 33.1, 30.4, 36.1, 34.4, 29.1]
Ice_cream_sales = [236500, 357500, 203500, 365200, 446600, 574200, 453200, 675400, 598400, 463100]

dict_data = {'temp':temperature, 'qty': Ice_cream_sales}
df_ice_cream = pd.DataFrame(dict_data, columns=['temp', 'qty'])
df_ice_cream

df_ice_cream.plot.scatter(x='temp', y='qty', grid=True, title='ice cream sale info')
plt.show()

#####

grade_num = [5, 14, 12, 3]
students = ['A', 'B', 'C', 'D']

df_grade = pd.DataFrame(grade_num, index=students, columns=['Student'])
df_grade

grade_bar = df_grade.plot.bar(grid = True)
grade_bar.set_xlable("Score")
grade_bar.set_ylable("Students")
grade_bar.set_title("Students per Score")
plt.show()

#####

fruit = ['Apple', 'Banana', 'Strawberry', 'Orange', 'Grapefruit']
result = [7,6,3,2,2]

df_fruit = pd.Series(result, index = fruit, name = 'Student Selecting')
df_fruit

df_fruit.plot.pie()
plt.show()

#
# 1. sin/cos 함수를 그려라. 
#
# 2. 한 한급에서 30명의 학생들이 5개 영화 장르(로맨스, 코메디, 액션, 판타지, 스릴러) 중 좋아하는 
#    장르를 선택하라고 했을 때 선택한 학생수 (10, 6, 4, 12, 8)를 파이그래프로 표현하시오
#
