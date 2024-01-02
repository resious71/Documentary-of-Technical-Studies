##### 함수 ( 최솟값 최댓값을 구하는 함수)
#
# 라. 유용한 내장함수
#   3) 값을 구하는 함수
#    - 내장 함수를 통해 최소값, 최대값, 절대값, 전체 합, 항목 개수를 구할 수 있음
#
#        형태   |  함수  |    기능                               |  사용 예시
#   ---------------------------------------------------------------------------
#      최소값   |  min() | 리스트 튜플, 세트의 항목이나 문자열 중   | in: nums = [1,2,3,4,45] 
#                         최소값 반환(알파벳의 경우 A부터 최소)         min(nums)
#      최대값   |  max() | 리스트 튜플, 세트의 항목이나 문자열 중   |     max(nums)
#                         최대값 반환(알파벳의 경우 A부터 최소)  
#      절대값   |  abs() | 숫자의 부호와 상관없이 숫자의 크기를 반환 |  abs(1.45)
#     전체 합   |  sum() | 리스트, 튜플, 세트의 모든 항목을 더해    | sum(nums)
#                         전체 합 반환
#    항목 개수  |  len() | 문자열, 리스트, 튜플, 딕셔너리 안에 있는  | len("abcdef")
#                         항목의 개수 반환
# 

y_Num = [15,10,5,0,5,5,90,100]
[min(y_Num), max(y_Num)]

y_str=["zyx","abc"]
[min(y_str), max(y_str)]

[abs(10), abs(-10)]

sum(y_Num)

len("ab cd")
len(['a','b','c','d'])
len(('a','b','c','d'))
len({'a','b','c','d'})
len({1:"yoon", 2:"seo"})

scores = [80, 60, 95, 75]
sum=0
subject=0

for score in scores:
    sum = sum+score
    subject = subject+1

average = sum/subject
average
print("최하 점수:{0}, 최고 점수:{1}".format(min(scores),max(scores)))

#
# 1. 주어진 숫자가 홀수인지 짝수인지 판별해주는 함수(even_odd)를 만들어보시오
# 1-1. 람다 조건부 표현을 통해 간단하게 만들어 보시오
#
# 2. 구구단 계산
#    입력을 n(2부터 9까지의 자연수)으로 받았을 때, n에 해당하는 구구단을 출력하는 함수를 
#    작성해 보시오
#
# 3. 다음은 숫자들로 이루어진 리스트를 입력으로 받아 10보다 크거나 같은 수만 리턴해 주는 
#    함수이다. 
#    
#    > def func1(numbers):
#         result=[]
#         for number in numbers: 
#             if number => 10:        
#                 result.append(number)
#         return result
#   
#    > func1([9,10,11,12,13,14])
#      [10,11,12,13,14]
#
#  이 함수를 람다로 변경해 보시오
#
