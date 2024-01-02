##### Pandas 기초 (구조적 데이터 생성하기 2, 데이터 연산)
# 2장. Panda
# 가. 개요
#   3) Dataframe을 활용한 데이터 생성
#    - Dataframe은 자료(Data)를 담는 틀(Frame)
#    - 라벨이 있는 2차원 데이터를 생성하고 처리할 수 있음
#     > df = pd.Dataframe(datra[, index = index_data, columns=columns_data])
#    - 세로축 라벨을 index, 가로축 레벨을 columns, 그 외 values
#
#          |     A          B          C       --> columns    
#   -----------------------------------------------------------
#      0   |     1          2          3     
#      1   |     4          5          6       ==> values
#      2   |     7          8          9
#      |
#     index
#
#     - 딕셔너리 타입의 데이터
#      In : table_data = { '연도': [2020,2021,2021, 2022,2022],
#                          '지사': ['한국', '한국', '미국','한국','미국'],     
#                          '고객 수': [250, 450, 300, 500, 200]}
#           pd.DataFrame(table_data)
#
#      연도   |    지사    |   고객수
#    --------------------------------------
#     2020   |    한국    |    250
#     2021   |    한국    |    450
#     2021   |    미국    |    300
#     2022   |    한국    |    500
#     2022   |    미국    |    200
#

import numpy as np
import pandas as pd

pd.DataFrame([[1,2,3],[4,5,6],[7,8,9]])
data_list = np.array([[1,2,3],[4,5,6],[7,8,9]])
pd.DataFrame(data_list)

index_date = pd.date_range('2021-03-01', periods=3)
index_date 
columns_list = ['A','B','C']

pd.DataFrame(data_list, index=index_date, columns=columns_list)

table_data = { '연도': [2020,2021,2021, 2022,2022],
               '지사': ['한국', '한국', '미국','한국','미국'],   
               '고객 수': [250, 450, 300, 500, 200]}

pd.DataFrame(table_data)

# 다. 데이터 연산    
#   - Pandas의 Series()와 DataFrame()으로 생성한 데이터끼리 사칙연산 가능
#   - DataFrame 형식 Data 연산 (길이가 같지 않아도 연산 가능)
# 

d1 = pd.Series([1,2,3,4,5])
d2 = pd.Series([10,20,30,40,50])
d1
d2

d1 + d2 
d2 - d1
d1 * d2
d2 / d1

d3 = pd.Series([1,2,3])
d4 = pd.Series([10,20,30,40,50])

d3 + d4
d4 - d3

table_d1 = { 'A': [1,2,3,4,5],
             'B': [10,20,30,40,50], 
             'C': [100,200,300,400,500]}
df1 = pd.DataFrame(table_d1)
df1

table_d2 = { 'A': [6,7,8],
             'B': [60, 70, 80], 
             'C': [600,700,800]}
df2 = pd.DataFrame(table_d2)
df2

df1 + df2

table_d3 = { '봄': [266.5, 275.3, 265.9, 222.2, 308.8],
           '여름': [763.7, 528.6, 574.6, 352.4, 477.5],
           '가을': [365.4, 274.7, 296.6, 287.8, 365.7],
           '겨울': [187.3, 69.8, 85.9, 89.1, 104.5]}
columns_list = ['봄','여름','가을','겨울']
index_list = ['2022', '2023', '2024', '2025', '2026']

df3 = pd.DataFrame(table_d3, columns = columns_list, index = index_list)
df3.mean()
df3.std()
df3.mean(axis=1)

