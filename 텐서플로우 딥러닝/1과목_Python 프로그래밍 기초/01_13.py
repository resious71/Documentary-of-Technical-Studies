##### 입력과 출력 (기본출력1,기본출력2)
# 2장 Python 프로그래밍
# 4.입력과 출력
# 가. 화면 출력
#  1) 기본 출력
#   - print() 함수를 이용하여 문자열과 숫자열을 출력 할 수 있음
#   - 문자열을 출력할 경우 "", ''를 이용하여 출력할 수 있음
#   - 문자열 내에 sep=구분자를 추가하여 문자열 사이를 구분할 수 있음
#   - + 연산자를 이용하여 문자열을 연결 할 수 있음
#   - \n을 이용하여 출력 시 줄을 바꿀 수 있음
#   - end=""를 추가하여 라인 끝에 문자열을 추가하여 출력할 수 있음
#

print("Hello Python")
print("Best", "Python", "Course")
print("Best", "Python", "Course", sep="*")
print("Best"+"Python"+"Course")                 # 빈칸 없음
print("Best", "Python", "Course" + ":", "Jsdata")

name = "Jun"
tall = 185
print("Name:", name + ",", "Tall:",tall)

print("Jun is my friend. \nHe is smart")

print("Jun is my friend.")
print("He is smart")

print("Jun is my friend.", end = "")
print("He is smart")

#  2) 형식 지정 출력
#   - print() 함수에서 연산자를 이용해 데이터의 출력 형식과 위치를 지정할 수 있음
#       print("%type" % data)
#   - 문자열의 경우 %s, 정수의 경우 %d(혹은 %i), 실수일 경우 %f(%F)를 이용하여 활용 할 수 있음
#   - Data가 두 개 이상인 경우
#       print("%type %type" % (data1, data2))
#   - 형식 지정 문자열에서 출력 위치 지정
#       print("{0}{1}{2}...{n}".format(data_0, data_1, data_2, ..., data_n))

name = "dohun"
print("%s likes sleeping" %name)

r = 5
PI=3.131592
print("반지름: %d, 원주율: %f" %(r, PI))

cellphone_0 = "Galaxy"
cellphone_1 = "Iphone"
cellphone_2 = "LGphone"

print("cellphone:{0}".format(cellphone_0))
print("cellphone:{0},{1},{2}".format(cellphone_0, cellphone_1, cellphone_2))
print("cellphone:{2},{0},{1}".format(cellphone_0, cellphone_1, cellphone_2))
print("cellphone:{2},{0}".format(cellphone_0, cellphone_1, cellphone_2))
print("cellphone:{},{},{}".format(cellphone_0, cellphone_1, cellphone_2))

name = "dohun"
age = 26
a=1.234567890

sum_string = "String:{0}, Integer:{1}, float:{2}"
print(sum_string.format(name, age, a))

#   - 형식 지정 문자열에서 숫자 출력 형식 지정
#   
#    데이터(x)    |   출력 형식   |    출력 결과    |  설명                 
#  ----------------------------------------------------------------------------
#    4           |  {N:2d}      |  4             | 정수를 공백 포함해 두자리로 표시
#    4           |  {N:04d}     | 0004           | 정수를 네 자리로 표시, 앞의 공백은 0으로 처리
#    12          |  {N:>4d}     |    12          | 정수를 네 자리로 표시, 오른쪽 정렬
#    0.123456    |  {N:.4f}     | 0.1235         | 실수를 소수점 넷째자리까지 표시, 뒤는 반올림
#    123456000   |  {N:,}       | 123,456,000    | 셋째 자리마다 콤마 표시
#    0.4789      |  {N:.2%}     | 47.89%         | 소수를 퍼센트로 표시. 소수점 자리수는 .다음 숫자
#    95700000000 |  {N:.3e}     | 9.570e+10      | 숫자를 지수로 표시. 소수점 자리수는 .다음 숫자
#    16          |  {N:#x}      | 0x10           | 숫자를 16진수로 표시. #기호 없으면 0x없이 출력
#    8           |  {N:#o}      | 0o10           | 숫자를 8진수로 표시. #기호 없으면 0o없이 출력
#    2           |  {N:#b}      | 0b10           | 숫자를 2진수로 표시. #기호 없으면 0b없이 출력
#

a = 1.234567890
print("{0:.2f}, {0:.5f}".format(a))
