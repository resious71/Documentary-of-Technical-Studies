##### 변수와 자료형 (딕셔너리)
# 2.자료형
# 바. 딕셔너리
#   - 표제어와 설명을 사전형식으로 구축하여 사용하는 방법
#   - 키(key)와 값(value) 쌍으로 구성되어 있음
#   - 중괄호를 이용해 구성하며 키와 값의 구분은 :로 구분하여 데이터를 생성

dict = {"남자":"Men", "여자":"Woman", "아이":"Baby"}
dict
dict["남자"]

#   - 숫자와 문자열로 이루어진 경우, 특정 위치의 데이터를 출력하기 위해서는 [숫자]를 이용함
#   - 이는 딕셔너리 키로 인덱스처럼 위치를 뜻하는 것은 아님

dict1 = {1:"Man", 2:"Woman", 3:"Baby"}
dict1
dict1[1]

#   - 키와 값이 모두 숫자인 경우의 예

dict2 = {1:100, 2:200, 3:300, 4:400}
print(dict2)
print(dict2[2])

#   - 키가 문자열이고 값이 리스트인 예

dict3 = {"list1":[1,2,3], "list2": [4,5,6]}
print(dict3)
print(dict3["list2"])

#   - 다양한 형태의 키와 값을 갖는 경우

dict4 = {1:100, "list": {1:"100", 2:"200"}, "tuple":{"A":[1,2,3], "B":(4,5,6)}, "string":"파이썬"}
dict4

#   - 딕셔너리에 데이터 변경하고 추가하기

dict1[1] = "Gender"
dict1

dict1[4] = "Grand mother"
dict1

#   - 딕셔너리에 데이터 삭제하기 

del dict1[2]
dict1

#   - 딕셔너리에 활용되는 메서드
# 
#      메서드     |         설명                            |    예
#  --------------------------------------------------------------------
#    keys()      | 키 전체를 리스트 형태로 반환할 때 사용     | dict1.keys()
#    values()    | 값 전체를 리스트 형태로 반환할 때 사용     | dict1.values()
#    items()     | 키와 값을 튜플 상태로 반환할 때 사용       | dict1.items()
#    update()    | 딕셔너리 데이터를 추가할 때 사용           | dict1.update(dict2)
#    clear()     | 모든 항목 삭제                           | dict1.clear()
# 
#   - 딕셔너리에서 키 & 값 출력하기
dict1
print(dict1.keys())
print(dict1.values())
print(dict1.items())

dict2 = {4:100, 5:200, 6:300, 7:400}
dict1.update(dict2)
dict1

dict2.clear()
dict2
type(dict2)
