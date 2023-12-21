##### 변수와 자료형 (리스트)
# 2.자료형
# 나. 리스트
#  - 리스트는 []를 사용해서 생성함 
#  - 리스트에 포함되는 항목의 데이터 타입은 숫자, 문자열, bool, 리스트, 튜플, 세트 등
#  - 리스트 생성 시 데이터 타입이 달라도 생성 가능

m_stu = [90, 85, 100, 95, 80]
m_stu
type(m_stu)

#  - 리스트에서 각 항목은 '변수명[i]'로 지정하여 사용할 수 있으며 범위는 0부터 N-1까지임 
#  - m_stu 변수에서 각 순서에 맞는 항목을 출력하는 방법

print(m_stu[0])
print(m_stu[0])
print(m_stu[2])
print(m_stu[3])
print(m_stu[4])

#  - 특정 항목을 변경하기 위해서는 '변수명[i] = new data'를 활용하면 됨

m_stu[0] = 70     # 첫번째 항목을 90에서 70으로 변경
m_stu
   
#  - 리스트는 숫자, 문자, bool, 리스트 등을 혼합할 수 있음

mix_list = [0,1, 'match-up', 'program', m_stu]
mix_list

#  - 리스트는 문자열과 같이 더하거나 곱할 수 있음

list1 = [1,2,3,4]
list2 = [11,12,13,14]
listsum = list1 + list2   # 리스트 연결하기
listmul = list1 * 3       # 리스트 반복하기

#  - 리스트에서 원하는 범위의 데이터만 추출하기
#  - a[시작번호:끝번호]를 지정하면 끝 번호에 해당하는 것은 포함되지 않음
#     ex: 시작번호 <= a < 끝번호, a[0:5] = 0,1,2,3,4

list = [1,2,3,4,5,6,7,8,9,10]
print(list)                      # 리스트 전체
print(list[0:3])                 # 3번째 자료까지 추출  
print(list[3:10])                # 3번째 자료부터 10번째 자료까지 추출
print(list[:3])                  # 3번째 자료까지 추출
print(list[6:])                  # 7번째부터 끝까지 자료 추출
  
#  - 리스트에서 'del 리스트명[i]'를 통해 인덱스를 삭제할 수 있음

print(list)
del list[9]
print(list)

#  - 해당 위치에 인덱스가 존재하는지 확인하는 방법

print(4 in list)
print(7 in list)
print(10 in list)

#  - 파이썬에서는 데이터 타입별로 이용할 수 있는 다양한 함수를 제공
#    . 이를 '메서드'라고 칭하며, 이를 이용하여 손쉬운 데어터 처리가 가능함
#    . 리스트에서는 데이터 추가, 삽입, 삭제 등의 작업을 메서드로 수행할 수 있음
# 
#   메서드 리스트  |              설명                              |            예
#  --------------------------------------------------------------------------------------------
#   append()      | 리스트에서 항목 하나를 맨 마지막에 추가              | m_stu.append('이강인')
#   insert()      | 리스트에서 특정 위치에 항목을 삽입                   | m_stu.insert(4,'이승우')
#   extend()      | 리스트에서 항목 여러 개를 맨 마지막에 추가           | m_stu.extend(['백승호','정우영'])
#   remove()      | 입력값과 첫 번째로 일치하는 항목을 리스트에서 삭제    | m_stu.remove('이청용')
#   pop()         | 리스트의 마지막 항목을 제거한 후 반환                | popstu = m_stu.pop()
#   index()       | 리스트에서 인자와 일치하는 첫 번째 항목의 위치를 반환 |  indexstu = m_stu.index('박지성')
#   count()       | 리스트에서 인자와 일치하는 항목의 개수를 반환         | countstu = m_stu.count('기성용')
#   sort()        | 숫자나 문자열로 구성된 리스트 항목을 순방향으로 정렬   | m_stu.sort()
#   reverse()     | 리스트 항목을 끝에서부터 역순으로 정렬               | m_stu.reverse() 


m_stu = ['박지성','기성용','손흥민', '이청용']
print(m_stu)

m_stu.append('이강인')
print(m_stu)

m_stu.insert(4,'이승우')
print(m_stu)

m_stu.extend(['백승호','정우영'])
print(m_stu)

m_stu.remove('이청용')
print(m_stu)

popstu = m_stu.pop()
print(popstu)
print(m_stu)

indexstu = m_stu.index('박지성')
print(indexstu)

countstu = m_stu.count('기성용')
print(countstu)

m_stu.sort()
print(m_stu)

m_stu.reverse() 
print(m_stu)
