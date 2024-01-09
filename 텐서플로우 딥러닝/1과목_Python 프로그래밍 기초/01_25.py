##### 문자열과 텍스트 다루기 ( 문자열 다루기 1 )
# 2장 Python 프로그래밍
# 7. 문자열과 텍스트 다루기
#  가. 문자열 다루기
#   - 큰 따옴표("), 작은 따옴표(') 안에 들어있는 문자의 집합을 문자열이라고 함
#   - 텍스트 파일의 내용을 읽어서 처리하는 방법을 파악해 보고자 함
#   - 문자열을 처리하기 위한 문자열 분리, 불필요한 문자열 제거, 문자열 연결 등을 진행
#    1) 문자열 분리하기   
#      . split() 메서드를 이용하여 문자열 분리 
#         > str.split([sep])
#         > str.split([sep ,] maxsplit=숫자)    # 원하는 횟수만큼 문자열 분리 가능
#      . 문자열에서 구분자인 sep를 기주능로문자열을 분리할 때 활용, 대괄호 부분 생략 가능
#     
#         str = "에소프레소 아메리카노 카페라테 카푸치노"
#                               |
#                               |   str.split() 공백 기준 문자열 분리
#                               |
#
#              에소프레소 | 아메리카노 | 카페라테 | 카푸치노
#

lunch_menu_str = "돈까스, 된장찌개, 김치찌개, 순두부"
lunch_menu_str.split(",")

"돈까스, 된장찌개, 김치찌개, 순두부".split(",")

"돈까스 된장찌개 김치찌개 순두부".split(" ")
"돈까스 된장찌개 김치찌개 순두부".split()

"  돈까스  \n 된장찌개    \n 김치찌개 \n순두부".split()

"돈까스 된장찌개 김치찌개 순두부".split(maxsplit=2)    # 2개로 나누는 것이 아닌 split을 2번 함

phone_number = "+82-02-2345-6789"
split_num=phone_number.split("-", 1)
print(split_num)
print(split_num[1])

#
#    2) 필요없는 문자열 삭제하기
#     - strip() 메서드를 이용해 불필요한 부분 삭제
#        > str.strip([chars])
#     - strip() 메서드는 문자열의 앞과 뒤에서 시작하여 지정한 문자를 모두 삭제한 문자열을 반환함
#     - 지정한 문자가 여러 개일 경우에 순서에 구애받지 않고 삭제됨
#
#            str = " Python "
#                      |
#                      |       str.strip() 문자열에서 공백 제거
#                      | 
#                   'Python'
#

"aaabbbPythonbbbaaa".strip("a")

test_str="aaabbbPythonbbbaaa"
temp1=test_str.strip("a")
temp1

"aaabbbPythonbbbaaa".strip("ab")
"aaabbbPythonbbbaaa".strip("ba")

test_str2 = "@#$%^&* Python *&^%$#@!"
temp1 = test_str2.strip("*&^%$#@! ")
temp1

"000000Pythobn000000".lstrip("0")
"000000Pythobn000000".rstrip("0")
"000%000Pythobn000000".lstrip("0")
"000000Pythobn000#000".rstrip("0#")
