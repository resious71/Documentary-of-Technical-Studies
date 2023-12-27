##### 입력과 출력 (기본출력1,기본출력2)
# 2장 Python 프로그래밍
# 4.입력과 출력
# 나. 키보드 입력
#   - input() 함수를 이용 데이터를 입력하고 값을 받아 처리 
#     > data = input("문자열") 

yourname = input("이름이 어떻게 되나요?")
print("당신의 이름은 {} 이군요".format(yourname))

num = input("1~100 사이의 숫자를 입력하세요")
print("당신이 입력한 숫자는 {} 이군요".format(num))

a = input("정사각형의 한 변의 길이를 입력하세요")
area = int(a)**2
print("정사각형의 넓이는 {}입니다".format(area))

# 다. 파일 읽고 쓰기
#  1) 파일 열기
#    - 파이썬 내장 함수인 open()을 이용해 파일을 열 수 있다
#      > f = open('file_name', 'mode')
#    - 파일 열기의 mode는 다음과 같음
#
#    mode  |   format
#   ---------------------------------------------------------------------------
#      r   | 기본 모드로 읽기 모드를 의미, 미지정 경우 기본으로 읽기 모드로 지정
#      w   | 쓰기 모드, 같은 이름의 파일이 있는 경우 기존 내용이 모두 삭제됨
#      x   | 쓰기 모드, 같은 이름의 파일이 있을 경우 오류가 발생 
#      a   | 추가 모드, 같은 이름의 파일이 없으면 w와 기능이 같음
#      b   | 바이너리 파일 모드
#      t   | 텍스트 파일 모드로 파일 열기, 미지정 경우 기본적으로 텍스트 모드로 지정
#
#  2) 파일 쓰기
#   - 파이썬 내장 함수인 open()을 이용해 파일을 열 수 있다.
#      > f = open('file_name','w')
#      > f.write(str)
#      > f.close()
#
#  3) 파일 읽기
#   - 파일을 읽기 위해 우선 읽기 모드로 파일을 오픈한 후 read() 함수를 통해 변수에 할당
#      > f = open('file_name','r')
#      > data = f.read()
#      > f.close()

cd C:\python_class

f=open('file.txt','w')
f.write("This is my first time write.")
f.close()

!type file.txt            # 파일 내용 확인

f = open('file.txt','r')
file_text = f.read()
f.close()
print(file_text)

# 라. 반복문을 이용한 파일 읽고 쓰기
#  1) 파일에 문자열 한 줄씩 쓰기
#   - for 문을 이용하여 문자열을 한 줄씩 파일에 쓸 수 있다.
#  2) 파일에서 문자열 한 줄씩 읽기
#   - readline()이나 readlines()를 이용
#   - readline()의 경우 실행한 횟수만큼 문자열을 한 줄씩 읽어냄
#   - readline()의 경우 파일 전체의 모든 줄을 읽어서 한 줄씩 리스트 타입으로 반환
#

f=open("file2.txt","w")
for num in range(6):
    format_string="2x{0}={1}\n".format(num, num*2)
    f.write(format_string)
f.close()

