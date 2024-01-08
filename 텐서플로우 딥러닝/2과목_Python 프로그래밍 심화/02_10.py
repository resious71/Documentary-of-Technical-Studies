##### Pandas - 데이터 다루기 (데이터 파일을 읽고 쓰기)
# 2장. Pandas
# 바. 데이터 파일을 읽고 쓰기
#   1) 표 형식의 데이터 파일을 읽기
#    - read.csv()를 통해 필드가 콤마로 구분된 파일 불러오기
#       > DataFrame_data = pd.read_csv(file_name, [,options])
#   2) 표 형식의 데이터를 파일로 쓰기
#    - to_scv()를 이용해 DataFrame 형식의 데이터를 텍스트 파일로 저장
#       > DataFrame_data = pd.to_csv(file_name[, options])
#

import numpy as np
import pandas as pd

pd.read_csv('c:\python_class\data\kbo.csv', encoding="cp949")    # encording="utf-8

pd.read_csv('c:\python_class\data\kbo.txt', encoding="cp949", sep="\t")    # encording="utf-8


df_body = pd.DataFrame({'Weight':[72,77,65,79],
                        'Height':[175, 182, 160, 168]},
                         index = ['Yoon', 'Kwon', 'Shin', 'Kim'])
df_body
df_body.index.name = "User"
df_body

bmi = df_body['Weight']/(df_body['Height']/100)**2
bmi

df_body['BMI'] = bmi
df_body

df_body.to_csv('c:\python_class\data\body.csv') 

file_name = "c:\python_class\data\body_cp949.txtv"
df_body.to_csv(file_name, sep="   ", encoding="cp949")


# 1. 회사의 직원 몇 몇의 정보를 포함하는 다음 두 개의 DataFrame을 merge를 활용하여 결합하라.
#   > df1 = pd.DataFrame({'employee':['김주임','정부장','오대리','박대리'], 'group':['Laboratory1', 'Engineering',
#          'Laboratory2','Accounting']})
#   > df2 = pd.DataFrame({'employee':['박대리','정부장','오대리','김주임'], 'hire_date':[2016,2017,2018,2019]})
#
# 2. NumPy 패키지를 활용하여 50개의 난수를 생성시키고, 이를 Pandas의 시리즈형 데이터로 변환하라
#
# 3. 다음은 표준분포로 random으로 수를 생성하여, df를 만들어주는 코드이다.
#   > a = np.random.standard_normal((12,4))
#   > df = pd.DataFrame(a)
#   
#   df.columns, pd.data_range, df.index를 활용하여 그림 2와 같은 결과값이 나오도록 코드를 작성하라.
#
