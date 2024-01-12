#
# 마. 내장 모듈
#   1) 난수 발생 모듈
#     . 난수 발생 모듈
#       > import random
#       > random.random모듈함수()
#
#        random 모듈의 함수        |               설명
#    -------------------------------------------------------------------------
#        random()                 | 0.0 <= 실수 < 1.0 범위의 임의의 실수를 반환
#        randint(a,b)             | a <= 정수 <=b 의 범위의 임의의 정수 반환
#        randrange([start,]       | range([start,] stop [,step])에서   
#              stop [,step])      | 임의의 정수 반환 
#        choice(seq)              | 공백이 아닌 시퀀스에서 임의의 항목 반환
#        sample(population, k)    | 시퀀스로 이루어진 모집단에서 중복되지 않은 k개 인자 변환
#

import random

random.random()

num1 = random.randint(1,10)
num2 = random.randint(1,5)
print("first number {}, second number {}". format(num1, num2))

random.randrange(0,11,2)
num1 = random.randrange(1, 10, 2)
num2 = random.randrange(1, 11, 2)
print("even number {}, odd number {}". format(num1, num2))

menu=["김치찌개", "된장찌개", "비빕밥", "돈까스"]
random.choice(menu)

random.sample([1,2,3,4,5,5,6,7,8,9],3)

#  2) 날짜 및 시간 관련 처리 모듈
#   - 파이썬 내장 모듈인 datetime 모듈을 활용하는 방법
#     > import datetime
#     >
#     > date_obj = datetime.date(year, month, day)
#     > time_obj = datetime.time(hour, minute, second)
#     > datetime_obj = datetime.datetime(year, month, day, hour, minute, second)
#
#   - 객체를 생성하지 않고 각 클래스의 매서드를 이용하는 방법 
#     > import datetime    
#     > 
#     > date_var = datetime.date.classmethod() 
#     > time_var = datetime.time.classmethod()
#     > datetime_var = datetime.datetime.classmethod()
#

import datetime

set_date=datetime.date(2019,5,4)
print(set_date)

print("{0}-{1}-{2}".format(set_date.year, set_date.month, set_date.day))

date1 = datetime.date(2019,5,4)
date2 = datetime.date(2020,5,3)
diff_date = date2-date1
print(diff_date)

print(datetime.date.today())

import datetime

set_time=datetime.time(20,20,20)
print(set_time)

print("{0}:{1}:{2}".format(set_time.hour, set_time.minute, set_time.second))

set_datetime=datetime.datetime(2019,5,4,20,20,20)
print(set_datetime)

print("{0}:{1}:{2}".format(set_datetime.hour, set_datetime.minute, set_datetime.second))

