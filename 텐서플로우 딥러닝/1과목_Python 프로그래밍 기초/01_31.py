#
#   3) 달력 생성 및 처리 모듈
#     . 파이썬 내장 모듈인 calendar 모듈을 활용하는 방법
#
#      calendar 모듈 함수       |           설명 
#    ----------------------------------------------------------------------
#    calendar(year[, m=3])     | 지정된 연도의 전체 달력을 문자열로 반환
#    month(year, month)        | 지정된 연도와 월의 달력을 문자열로 반환
#    monthrange(year, month)   | 지정된 연도와월의 시작 요일과 일수 반환
#    firstweekday()            | 달력에 표시되는 주의 첫 번째 요일 값을 반환
#    setfirstweekday(weekday)  | 달력에 표시되는 주의 첫 번째 요일을 지정
#    weekday(year, month, day) | 지정된 날짜 연도,월, 일의 요일을 반환 
#    isleap(year)              | 지정된 연도가 윤년인지 판단해 True, False 반환
#
#    요일   |    지정 상수         | 숫자
#    ----------------------------------------------------
#     월    | calendar.MONDAY     |  0
#     화    | calendar.TUESDAY    |  1
#     수    | calendar.WEDNESDAY  |  2
#     목    | calendar.THURSDAY   |  3 
#     금    | calendar.FRIDAY     |  4
#     토    | calendar.STATURDAY  |  5
#     일    | calendar.SUNDAY     |  6
#

import calendar

print(calendar.calendar(2024))
print(calendar.calendar(2024, 4))
print(calendar.month(2024,10))

print(calendar.monthrange(2024,1))
calendar.firstweekday()

calendar.setfirstweekday(calendar.SUNDAY)
print(calendar.monthrange(2024,1))
calendar.firstweekday()

print(calendar.weekday(2024,1,15))

print(calendar.isleap(2024))

# 바. 패키지
#   - 파이썬 패키지는 여러 개의 파이썬 모듈을 계층적(디렉터리 구조)으로 관리 할 수 있게 해주는 방법
#   - 예를 들어 모듈명이 A.B인 경우 A는 패키지명, B는 모듈이 됨
#
#      gameplay 패키지의 예
#
#      gameplay/   # 디렉터리 명
#            __init__.py   # 파이썬 모듈, __init__.py는해당 디렉토리가 패키지의 일부임을 알려주는 역할
#            sound/
#                 __init__.py
#                 echo.py 
#                 wave.py
#            graphic/ 
#                 __init__.py 
#                 screen.py
#                 rander.py
#            npc/
#                 __init__.py
#                 image.py
#                 rander.py
#

mkdir c:\python_class\packages\image\io_file
%%writefile c:\python_class\packages\image\__init__.py
%%writefile c:\python_class\packages\image\io_file\__init__.py
%%writefile c:\python_class\packages\image\io_file\imagerad.py
def pngread():
    print("pngread is in module")
def jpgread():
    print("jpgread is in module")

!tree /F c:\python_class\packages


import image.io_file.imagerad
image.io_file.imagerad.pngread()

from image.io_file import imagerad
imagerad.pngread()

from image.io_file.imagerad import pngread
pngread()

from image.io_file.imagerad import *
jpgread()

# 1. canlendar 모듈을 사용해 2024년 12월 달력을 출력하시오
#   
# 2. candendar 모듈을 사용해 2024년 12월 1일은 무슨 요일인지, 12월은 몇 일이 있는지 출력하시오
#
# 3. 내장 모듈인 난수 발생 모듈(random)을 활용해 가위 바위 보 게임을 만들고자 한다
#    다음 모듈을 이용해 기존에 학습한 if ~ elif ~ else 문을 활용한 가위 바위 보 케임을 마무리 하시오
#    
#     > import random
#     >
#     > for i in range(3)   # 가위 바위 보 실행 횟수 지정
#     >     sel = int(input("<<0(가위), 1(바위), 2(보) 중 하나를 선택하시오"))
#     >     ai = random.randrange(0,2)
#     >     print(ai)
