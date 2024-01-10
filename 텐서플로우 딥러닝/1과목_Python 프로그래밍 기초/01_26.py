##### 문자열과 텍스트 다루기 (문자열 다루기 2)
# 2장 Python 프로그래밍
# 7. 문자열과 텍스트 다루기
#    3) 문자열 연결하기
#     - 기존 더하기(+) 연산자를 통해 문자열을 연결하는 방법
#     - 문자열이 아닌 리스트의 모든 항목을 하나의 문자열로 만들 경우 join() 메서드를 이용함
#       > str.join(seq)
#
#       | 부산 광역시 | 남구 | 용소로 | 14번길 10 |
#                           |
#                           |  str.join(seq)
#                           |
#             "부산 광역시 남구 용소로 14번길 10"
#

lunch_menu = "돈까스,   된장찌개,  김치찌개,       순두부"
lunch_menu_list = lunch_menu.split(",")
lunch_menu_list

lunch_list = []
for lunch in lunch_menu_list:
    temp = lunch.strip()
    lunch_list.append(temp)
    
print("lunch menus are  ", lunch_list)

name1 = "도훈"
name2 = "아영"
hello = "님의 주소는 어떻게 돠나요?"

print(name1+hello)
print(name2+hello)

address=["서울시", "영등포구", "여의도동", "63번지"]
address
a = " "
a.join(address)
" ".join(address)

#
#    4) 문자열 찾기
#     - find() 메서드를 이용하여 문자열에서 원하는 단어를 찾을 수 있음
#       > str.find(search_str)
#     - 문자열에서 찾으려는 검색 문자열과 첫번째로 일치하는 위치를 반환함
#     - 찾으려는 문자열이 없는 경우 -1을 반환함
#
#          문자열    H  E  L  L  O      P  Y  T  H  O  N 
#     문자열 위치    0  1  2  3  4  5   6  7  8  9  10  11
#
#    str.find("HELLO")  --> 0을 반환함
#    str.find("PYTHON)  --> 6을 반환함
#

str = "Python program"
print("찾는 문자열의 위치는 ", str.find("Python"))
print("찾는 문자열의 위치는 ", str.find("program"))
print("찾는 문자열의 위치는 ", str.find("n"))
print("찾는 문자열의 위치는 ", str.find("Good"))    # 없는 경우 -1 반환

#
#    - 시작 위치와 끝 위치를 추가로 지정해서 검색 범위를 지정할 수 있음
#      > str.find(search_str, start, end)        # 범위를 지정하여 검색
#      > str.find(search_str, start)             # 앞부터 끝까지 검색
#      > str.find(search_str, end)               # 끝부터 앞까지 검색 
#    - 해당 문자열이 몇번째에 위치해 잇는지 확인하기 위해서는 count() 메서드를 이용함
#      > str.count(search_str)                 
#      > str.count(search_str, start)          
#      > str.count(search_str, end)             
#    - 다른 찾기 메서드로 startswith()와 endswith() 메서드가 있으며, 각각 문자열이 
#      지정된 문자열로 시작하는지, 끝나는지를 검사할 때 활용
#      > str.startwith(prefix) 
#      > str.startwith(prefix, start)
#      > str.startwith(prefix, start, end)
#      > str.endswith(prefix) 
#      > str.endswith(prefix, start)
#      > str.endswith(prefix, start, end)
# 

str_s = "   python is powerful. Python is easy"

print(str_s.find("Python", 20, 30))
print(str_s.find("Python", 30))

print("Python의 개수는: ", str_s.count("Python"))
print("is의 개수는: ", str_s.count("is"))

print("Python의 시작 위치는: ", str_s.startswith("Python"))
print("문자의 끝은 easy로 끝나는가? ", str_s.endswith("easy."))
