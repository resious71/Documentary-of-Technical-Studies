##### Pandas 기초 (Pandas의 개요, 구조적 데이터 생성하기 1)
# 2장. Panda
# 가. 개요
#   - NumPy 기반 데이터 분석 특화 라이브러리
#   - 복잡한 데이터 분석에 특화
#   - pandas는 NumPy와 달리 데이터 타입이 다양하게 섞여 있어도 처리 가능
#
# 나. 구조적 데이터 생성하기
#   1) Series를 활용한 데이터 생성
#    - Series란 라벨을 갖는 구조적 데이터를 생성하는 것
#
#      > import pandas as pd                         # pandas 라이브러리 호출
#      > s = pd.Series(seq_data)                     # Series 형식의 데이터 생성 
#      > s = pd.Series(seq_data, index=index_seq)    # 데이터에 인덱스 추가
#      > s = pd.Series(dict_data)                    # 데이터와 인덱스를 함께 입력
#
#         0   |  10
#         1   |  20 
#         2   |  30
#         3   |  40
#         4   |  50
#

import pandas as pd

s1 = pd.Series([10,20,30,40,50])
s1
s1.index
print(s1.index)
s1.values

s2 = pd.Series(['a', 'b', 'c', 1, 2 ,3])
s2

import numpy as np

s3 = pd.Series([np.nan, 10,30])
s3

index_date = {'2020-10-07', '2020-10-08', '2020-10-09', '2020-10-10'}
s4 = pd.Series([200, 195, np.nan, 205], index = index_date)
s4

s5 = pd.Series({'국어':100, '영어':95, '수학':90})
s5

# 
#   2) 날짜 자동 생성: data_range
#    - 원하는 날짜를 자동 생성하는 방법
#      > pd.date_range(start=None, periods=None, freq='0')
#
#           형태       |     표현 방식
#    -------------------------------------
#       yyyy-mm-dd    |  기본형태, 연도-월-일
#       yyyy/mm/dd    |  연도/월/일 
#       yyyy.mm.dd    |  연도.월.일
#       mm-dd-yyyy    |  월-일-연도
#       mm/dd/yyyy    |  월/일/연도
#       mm.dd.yyyy    |  월.일.연도
#
#    - data_range() 함수의 freq 옵션
#   
#      약어   |            설명             | 부가 설명 및 사용 예 
#   ------------------------------------------------------------------------
#     D      | 달력 날짜 기준 하루 주기      | 하루 주기: freq ='D', 이틀 주기: freq='2D' 
#     B      | 업무 날짜 기준 하루 주기      | 업무일(월요일~금요일) 기준으로 생성, freq='B', FREQ='3B'
#     3BW    | 일요일 시작 기준 일주일 주기  | 월요일: W-MON, 화요일: W-TUE, freq='W', freq='W-MON'
#     M      | 월말 날짜 기준 주기          | 한 달 주기: freq='M', 네 달 주기: freq='4M'
#     BM     | 업무 월말 날짜 기준 주기      | freq='BM', freq='2BM'
#     MS     | 월초 날짜 기준 주기          | freq='MS', freq='3MS'
#     BMS    | 업무 월초 날짜 기준 주기      | freq='MS', freq='2BMS'
#     Q      | 분기 끝 날짜 기준 주기        | freq='Q', freq='2Q'
#     BQ     | 업무 분기 끝 날짜 기준 주기   | freq='BQ', freq='2BQ' 
#     QS     | 분기 시작 날짜 기준 주기      | freq='QS', freq='2QS'
#

pd.date_range(start='2020-01-01', end='2020-01-07')

pd.date_range(start='2020/01/01', end='2020.01.07')

pd.date_range(start='01-01-2020', end='01/07/2020')

pd.date_range(start='2020-01-01', end='01.07.2020')

pd.date_range(start='2020-01-01', periods= 7)

pd.date_range(start='2020-01-01', periods= 4, freq='2D')

pd.date_range(start='2020-01-01', periods= 4, freq='W')

pd.date_range(start='2020-01-01', periods= 12, freq='2BM')

pd.date_range(start='2020-01-01', periods= 4, freq='QS')

index_date = pd.date_range(start='2020-01-01', periods = 5, freq='D')
pd.Series([50, 60, 55, 57, 59], index = index_date)
