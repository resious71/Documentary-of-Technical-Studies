##### Pandas - 데이터 다루기 (데이터 통합하기)
# 2장. Pandas
# 마. 데이터 통합하기
#   1) 세로 방향으로 통합하기
#    - DataFrame에서 columns가 같은 두 데이터를 세로 방향(index 증가 방향)으로 합하려면
#      다음과 같이 'append()'를 이용
#       > DataFrame_data1.append(DataFrame_data2[,ignore_index=True])
#    - 두 학급의 시험 점수가 담긴 두 개의 DataFrame 데이터를 생성
#    - append()를 통해 데이터 합침
#    - 데이터가 없는 부분이 있는 경우, NaN으로 처리됨
#   2) 가로 방향으로 통합하기
#    - join()을 이용하여 가로 방향으로 데이터 합치기
#       > DataFrame_data1.join(DataFrame_data2)
#  

import numpy as np
import pandas as pd

df1 = pd.DataFrame({'Class1':[45,46,48,50],
                    'Class2':[40,41,44,48]})
df1

df2 = pd.DataFrame({'Class1':[41,42],
                    'Class2':[43,45]})
df2

df1.append(df2)
df1.append(df2, ignore_index=True)

df3 = pd.DataFrame({'Class1': [48,38]})
df3

df2
df2.append(df3, ignore_index=True)

df4 = pd.DataFrame({'Class3':[49,47,45,48]})
df4

df1.join(df4)

index_label = ['a', 'b', 'c', 'd']
df1a = pd.DataFrame({'Class1': [48, 46, 49, 50],
                     'Class2': [44, 46, 42, 41]}, index=index_label)
df4a = pd.DataFrame({'Class3': [43, 41, 42, 47]}, index=index_label)

df1a
df4a
                     
df1a.join(df4a)

df5 = pd.DataFrame({'Class4': [42, 47]})
df5

df1.join(df5)


#   3) 특정열 기준으로 통합하기
#    - 두 개의 DataFrame 데이터가 특정 열을 기준으로 공통된 값을 갖는 경우 'merge()'를 이용하여 통합
#       > DataFrame_left_data.merge(DataFrame_right_data)
#       > DataFrame_left_data.merge(DataFrame_right_data, how=merge_method, on=key_label)
#             # 통합하려는 기준이 되는 특정 열을 이용해 통합
#    - merge() 함수의 how 선택 인자에 따른 통합 방법 
# 
#     How 선택인자  |   설명
#   ---------------------------------------------------------------------------------------
#    left          | 왼쪽 데이터는 모두 선택하고 지정한 열(key)에 값이 있는 오른쪽 데이터를 선택
#    right         | 오른쪽 데이터는 모두 선택하고 지정한 열(key)에 값이 있는 왼쪽 데이터를 선택
#    outer         | 지정된 열(key)을 기준으로 왼쪽과 오른쪽 데이터를 모두 선택
#    innter        | 지정될 열(key)을 기준으로 왼쪽과 오른쪽 데이터 중 공통 항목만 선택(기본값)
# 

df6 = pd.DataFrame({'판매월': ['9월', '10월', '11월', '12월'],
                     '제품A': [120, 167, 214, 209],
                     '제품B': [190, 210, 348, 365]})
df6

df7 = pd.DataFrame({'판매월': ['9월', '10월', '11월', '12월'],
                     '제품A': [135, 167, 252, 264],
                     '제품B': [189, 241, 218, 314]})
df7

df6.merge(df7)

df_left = pd.DataFrame({'key':['A', 'B', 'C'], 'left':[1,2,3]})
df_left

df_right = pd.DataFrame({'key':['A', 'B', 'D'], 'left':[4,5,6]})
df_right

df_left.merge(df_right, how='left', on='key')

df_left.merge(df_right, how='right', on='key')

df_left.merge(df_right, how='outer', on='key')

df_left.merge(df_right, how='inner', on='key')

