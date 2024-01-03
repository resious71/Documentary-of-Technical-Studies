##### Pandas - 데이터 다루기 (데이터를 원하는데로 선택하기)
# 2장. Panda
# 라. 데이터를 원하는 대로 선택하기
#   - 다수의 데이터가 입력된 데이터 표에서 원하는 데이터만 선택하는 기능 
#      > DataFrame_data.head([n])             # 처음 일부분 선택
#      > DataFrame_data.tail([n])             # 뒤 일부분 선택 
#      > DataFrame_data[행시작 위치:행끝 위치]  # 연속된 구간의 행 데이터 선택
#   - index 항목에서의 행 선택
#      > DataFrame_data.loc[index_name]       # 인덱스를 지정하여 행 선택
#      > DataFrame_data.loc[시작 index_name: 끝 index_name]  # 인덱스를 구간으로 지정하여 행 선택
#   - 열을 선택하는 방법
#      > DataFrame_data[column_name]          # 하나의 열을 선택하는 경우
#      > DataFrame_data[column_name][시작 index_name: 끝 index_name]
#      > DataFrame_data[column_name][시작 index_pos: 끝 index_pos]
#              # 하나의 열을 선택, 범위를 지정해 원하는 데이터 선택
#   - DataFrame의 데이터 중 하나의 원소만 선택하는 방법
#      > DataFrame_data.loc[index_name][column_name]
#      > DataFrame_data.loc[index_name,column_name]
#      > DataFrame_data[index_name][column_name]
#      > DataFrame_data[index_name][column_pos]
#      > DataFrame_data[column_name].loc[index_name]
#   - 데이터의 행과 열을 바꾸는 전치
#      > DataFrame_data.T

import numpy as np
import pandas as pd

KBO ={ '넥센 히어로즈': [0.571, 0.619, 0.545, 0.538, 0.486, 0.521],
       '두산 베어즈': [0.568, 0.465, 0.549, 0.650, 0.596, 0.646],
       '롯데 자이언츠': [0.532, 0.457, 0.642, 0.458, 0.563, 0.479],
       '삼성 라이온즈': [0.595, 0.624, 0.611, 0.455, 0.396, 0.486],      
       '한화 이글스': [0.331, 0.389, 0.472, 0.468, 0.430, 0.535],      
       'KIA 타이거즈': [0.408, 0.422, 0.465, 0.490, 0.608, 0.486],
       'KT 위즈': [np.NaN, np.NaN, 0.364, 0.373, 0.347, 0.418],
       'lG 트윈스': [0.578, 0.492, 0.451, 0.500, 0.489, 0.476],
       'NC 다이노스': [0.419, 0.551, 0.596, 0.589, 0.560, 0.406],      
       'SK 와이번스': [0.496, 0.484, 0.486, 0.476, 0.524, 0.545]}

col_list=['넥센 히어로즈', '두산 베어즈', '롯데 자이언츠', '삼성 라이온즈', '한화 이글스',
        'KIA 타이거즈', 'KT 위즈', 'lG 트윈스', 'NC 다이노스', 'SK 와이번스']
index_list = ['2013', '2014', '2015', '2016', '2017', '2018']

df_KBO = pd.DataFrame(KBO, columns=col_list, index = index_list)
df_KBO

df_KBO.index
df_KBO.columns
df_KBO.values

df_KBO.head()
df_KBO.tail()
df_KBO.head(3)
df_KBO.tail(2)

df_KBO[1:2]
df_KBO[2:6]

df_KBO.loc['2018']
df_KBO.loc['2015':'2018']

df_KBO['롯데 자이언츠']['2015':'2018']
