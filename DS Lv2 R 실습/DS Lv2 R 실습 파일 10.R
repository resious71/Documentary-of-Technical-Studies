#### 데이터 전처리: 사용자 정의 함수 활용
# 
# 1. 사용자 정의 함수 개요
#    - 사용자 정의 함수 특징 및 사용 
#       + 가용한 함수를 조합하여 만든 새로운 함수
#       + 패키지와 유사하게 사전 실행 및 등록 필요
#    - 사용자 정의 함수 구조
#       +  #함수명 = function(#인자){}
#             #실행 코드
#             return (#반환값)
#          }

udf_mean_round = function(X){
    result = round(mean(X))
    return(result)
}

# 2. 사용자 정의 함수 설정 및 주의점
#   - 들여쓰기
#      + 제어문과 같이 사용자 정의 함수 또한 중괄호 내부에 위치한 실행코드 들여쓰기 필수
#      + 들여쓰기를 올바르게 하지 않을 경우 가독성 저하
#   - 반환값
#      + 함수 연산 결과를 별도의 객체에 할당하게 하기 위해서는 반환값 명시 필요  
#      + 반환하고자 하는 값 또는 객체를 return() 함수 내에 할당
#   - 함수명
#      + 새로 생성하는 함수는 기존에 사용하던 함수 또는 객체명과 다르게 하는 것을 권장
#      + 함수 자체의 기능을 대표하는 이름 권장
#   - 기본값
#      + 특정 인자에 값 입력 여부에 관계없이 함수가 동작할 때 사용
#      + 사용자 정의 함수 생성 시 함수명 뒤 소괄호 내부에 지정 

udf_01 = function(){}
udf_01()

udf_02 = function(x){x}
udf_02()                       # error
udf_02(x = "dfasdas")
udf_02("dfasad")
?head

udf_03 = function(x = 3){x}
udf_03()                      
udf_03 = function(x = 5){x}

udf_04 = function(x){
  result = x * 2
  return(result)
}
mul = udf_04(6)
mul

udf_05 = function(x){
  result = round(sd(x)*2, 2)
  return(result)
}

udf_05(c(2,4,6,8,20))
df=iris
head(df, 2)

df[, "cal"] = apply(df[,-5], MARGIN = 1, FUN = udf_05)
head(df,2)


df[, "cal2"] = apply(df[,1:4], MARGIN = 1, FUN = function(x){ round(sd(x)*2, 2)})
head(df,2)

################################################################################
#
#  Q1. 입력 객체의 원소를 모두 제곱한 후 그 원소를 더한 다음 제곱근을 취하는 
#      사용자 정의 함수를 만들었을 때, 해당 사용자 정의 함수에 C(3, 5, 9, 20)을
#      입력으로 하는 경우 그 출력값은?
# 
#      1) 171
#      2) 22.69
#      3) 400
#      4) 17.23

udf_euc = function(X){
  result = sqrt(sum(X^2))
  return(result)
}
udf_euc(c(3,5,9,20))

# Q2. 표준화(Standardization) 사용자 정의 함수를 만들고 c(-4, 5, 7, 9)를 입력한 경우 
#      DURLTJ DLQFURGKS 7은 몇으로 반환되는가?
# 
#     1) -1.43
#     2) 0.48
#     3) 0.69
#     4) 0.85

nor_std = function(X){
  result = (X - mean(X)) / sd(X)
  return(result)
}

nor_std(c(-4, 5, 7, 9))
round(nor_std(c(-4, 5, 7, 9)), 2)

# Q3. MinMaz 정규화 사용자 정의 함수를 만들고 c(-4, 5, 7, 9)를 입력한 경우  
#     여기서 입력한 7은 몇으로 반환되는가?
#    
#     1) 1  
#     2) 0
#     3) 0.69
#     4) 0.85

nor_minmax = function(X){
  result = (X - min(X)) / (max(X) - min(X))
  return(result)
}

nor_minmax(c(-4, 5, 7, 9))
round(nor_minmax(c(-4, 5, 7, 9)), 2)


