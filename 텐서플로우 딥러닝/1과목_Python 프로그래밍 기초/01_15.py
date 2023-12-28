##### 입력과 출력 (기본출력1,기본출력2)
# 2장 Python 프로그래밍
# 4.입력과 출력
# 라. 반복문을 이용한 파일 읽고 쓰기
#  1) 파일에 문자열 한 줄씩 쓰기
#   - for 문을 이용하여 문자열을 한 줄씩 파일에 쓸 수 있다
#  2) 파일에서 문자열 한 줄씩 읽기  
#   - readline()이나 readlines()를 이용
#   - readline()의 경우 실행한 횟수만큼 문자열을 한 줄씩 읽어냄
#   - readlines()의 경우 파일 전체의 모든 줄을 읽어서 한 줄씩 리스트 타입으로 반환

cd C:\python_class

f = open("file2.txt")
line1 = f.readline()
line2 = f.readline()
f.close()
print(line1)
print(line2)

f = open("file2.txt")
line = f.readline()
while line:
    print(line, end="")
    line=f.readline()
f.close()

f = open("file2.txt")
lines = f.readlines()
f.close()
print(lines)                 # 리스트 형태로 출력

f = open("file2.txt")
lines = f.readlines()
f.close()
for line in lines:
    print(line, end="")

f = open("file2.txt")
for line in f.readlines():
    print(line, end="")
f.close()

# 마. with를 이용한 파일 읽고 쓰기
#  1) with문의 구조
#   - 기존 open() 함수 이용 시 파일을 연 후 close()를 통해 닫아 줘야 했으나 with는 자동으로 닫음
#      > with open('file_name','mode' as f:)
#      >    <코드 블록>
#   - 텍스트 파일 쓰기 
#      > with open('file_name','w') as f:
#      >    f.write(str)
#   - 텍스트 파일 읽기
#      > with open('file_name','r') as f: #r의 경우 안써도 상관없음
#      >    data = f.read()

with open("c:/python_class/file4.txt","w") as f:
    f.write("File read/write test2: line1\n")
    f.write("File read/write test2: line2\n")
    f.write("File read/write test2: line3\n")
    
with open("c:/python_class/file4.txt") as f:    
    file_string = f.read()
    print(file_string)

