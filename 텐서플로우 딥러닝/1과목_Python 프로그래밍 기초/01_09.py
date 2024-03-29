##### 
# 3. 제어문
#  - 조건에 따라 명령을 수행하는 '조건문'과 그 조건을 만족할 때 까지 계속 반복하는 "반복문", 
#    반복문을 제어하는 '제어문'이 있다.
#  - 조건에 따라 명령을 수행하는 방법 (= 조건문)
#    . 단일 조건에 따른 분기(if)
#    . 단일 조건 및 그 외 조건에 따른 분기(if ~ else)
#    . 여러 조건에 따른 분기 (if ~ elif ~ else)
#    . 중첩 조건에 따른 분기 (if ~ (if~else) else)
#  - 특정한 조건을 만족할 때까지 코드의 일부분을 반복하는 것(=반복문)
#    . for문 (for a in range)
#    . while 문 (while 조건)
#  - 반복문의 제어를 통해 멈추고 빠져나오거나 다음 반복을 수행하게 하는 것 (= 제어문)
#    . break
#    . continue
#
# 가. 조건문(if)
#  1) 단일 조건에 따른 분기 
#    . 가장 기본적인 if 문의 구조
#        if <조건문>:
#             <코드 블록>
#    . 위의 if 문에서 조건을 만족할 경우 아래의 <코드 블록>을 수행하고 거짓이면 수행하지 않음

x = 90
if x>85:
    print("PASS")

#   . 조건을 판단하기 위해 비교 연산 및 논리 연산을 이용
#     >> <, >, <=, >=, ==, !=, and, or, not
#
#  2) 단일 조건 및 그 외 조건에 따른 분기
#   . else 문을 이용, if 문에서 조건문의 만족 여부에 따라 코드를 다르게 수행할 경우에 사용
#       if <조건문>:
#           <코드 블록1>
#       else:
#           <코드 블록2>
#   . if ~ else 구조에서 조건문을 만족하면 <코드 블록 1>을 시행하고 그 외의 경우 <코드 블록 2>를 실행

x=75
if x> 85:
    print("Pass")
else:
    print("Fail")

#  3) 여러 조건에 따른 분기 
#   . if ~ elif ~ else를 통해 여러 조건에 따라 코드를 각각 다르게 수행 할 수 있음
#       if <조건문>:
#           <코드 블록1>
#       elif <조건문>:
#           <코드 블록2>
#            : 
#            :
#       elif <조건문>:
#           <코드 블록n>
#       else:
#           <코드 블록m>
#

x = 70
if x> 85:
    print("A")
elif (x>=70 and x<85):                    # 70 <= x < 80
    print("B")
else:
    print("F")

#  4) 중첩 조건에 따른 분기 
#   . 조건문 안에 또 다른 조건문을 포함한 경우
#       if <조건문1>:
#           if <조건문 1-1> :
#              <코드 블록1-1>
#           else:
#              <코드 블록1-2>
#       elif <조건문2>:
#           <코드 블록2>
#            : 
#            :
#       else:
#           <코드 블록3>
#

x = 100
if x>85:
    if x == 100 :
        print("A+")
    else: 
        print("A")
elif (x>=70 and x<85):
    print("B")
else:
    print("F")


