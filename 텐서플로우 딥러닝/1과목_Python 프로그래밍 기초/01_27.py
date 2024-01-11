##### 문자열과 텍스트 다루기 (문자열 다루기 2)
# 2장 Python 프로그래밍
# 7. 문자열과 텍스트 다루기
#    5) 문자열 연결하기
#     - 지정한 문자열을 찾아서 바꾸는 메서드로 replace()를 활용함
#       > str.replace(old, new[, count])  # count를 지정하지 않을 경우 문자열 전체에서 찾아 바꿈
#    6) 문자열 구성 확인하기
#     - 문자열의 구성이 숫자인지, 문자인지, 두 개 모두 포함되어 있는지, 알파벳 대문자 인지 등을 판단하는 메서드
#
#           메서드   |           내용 
#      ---------------------------------------------------------------------------------------------
#       isalpha()   | 문자열이 숫자, 특수 문자, 공백이 아닌 문자로 구성되어 있을 경우 True, 이외는 False
#       isdigit()   | 문자열이 모두 숫자로만 이루어진 경우 True, 나머지는 False
#       isalnum()   | 문자열이 특수 문자나 공백이 아닌 문자와 숫자로 이루어진 경우 True, 나머지는 False
#       isspace()   | 문자열이 모두 공백 문자로 구성된 경우 True, 나머지 False
#       isupper()   | 문자열이 모두 로마자 대문자인 경우 True, 나머지 False
#       islower()   | 문자열이 모두 로마자 소문자인 경우 True, 나머지 False
#
#    7) 대소문자로 변경하기
#     - 문자열에서 로마자 알파벳을 모두 소문자나 대문자로 변경할 때 lower()나 upper() 메서드 이용
#       > str.lower()   # 소문자로
#       > str.upper()   # 대문자로
#

str_f="Python is very good. Python is easy and powerful. and Python is fast."

print(str_f.replace("Python", "IPython"))
print(str_f.replace("Python", "IPython", 2))
print(str_f.replace("Python", "", 2))

str_b="[Phthon] [is] [good]"

str_b=str_b.replace("[", "")
str_b
str_b=str_b.replace("]", "")
str_b

print("Phthon".isalpha())
print("Ver.3.1".isalpha())
print("1234".isdigit())
print("1234a".isdigit())
print("   ".isspace())
print("  1  ".isspace())

print("Phthon".isupper())
print("Phthon".islower())

print("Phthon".upper())
print("Phthon".lower())

#
# 1. 다음과 같은 문자열이 있다.
#    > str1 = "아버지:어머니:오빠:형"
#    이를 split() 함수와 join() 함수를 활용하여 다음과 같이 수정하시오
#    > str3 = "아버지/어머니/오빠/형"
#
# 2. 다음과 같은 문자열이 있다.
#    > str1 = "아버지:어머니:오빠:형"
#    이를 replace() 함수를 활용하여 다음과 같이 수정하시오
#    > str3 = "아버지/어머니/오빠/형"
#
# 3. 다음과 같은 문자열이 있다.
#    > str1 = "bigdata have a good future prospect"
#    문자열 내의 소문자를 모두 대문자로 변경하고, 문자열 맨 앞의 공백을 삭제한 후,
#    문자열이 모두 로마자 대문자인지 확인해 보시오
#    hint: upper(), strip(), isupper() 활용
#
