### 데이터 시각화 기법
#
# 1. 데이터 시각화의 중요성
#   + 데이터 시각화(data visualization): 숫자 형태의 데이터를 그래프나 그림 등의형태로 표현하는 과정
#   + 데이터 분석 과정에서 중요한 기술 중의 하나
#   + 데이터를 시각화하면 데이터가 담고 있는 정보나의미를 보다 쉽게 파악
#   + 경우에 따라서는 시각화 결과로부터 중요한 영감을 얻기도 함
#   + 독립적인 교육과정이 존재할 만큼 중요
#
# 2. 트리맵
#   + GNI2014 데이터셋으로 트리맵 작성하기
#     - 사각타일 형태로 구성되어 있으며, 각 타일의 크기와 색깔로 데이터의 크기를 나타냄
#     - 각각의 타일은 계층 구조가 있기 때문에 데이터에 존재하는 계층 구조도 표현
#     - treemap 패키지 설치 필요
#     - 예제 데이터 셋: treemap 패키지 안에 포함된 GNI2014. 
#       + 2014년도의 전세게 국가별 인구, 국민 총소득(GNI), 소속 대륙의 정보를 담고 있음

library(treemap)                                         # treemap 패키지 불러오기    
data(GNI2014)                                          # 데이터 불러오기
head(GNI2014)                                            # 데이터 내용보기  
treemap(GNI2014,
        index=c("continent", "iso3"),                    # 계층구조 설정(대륙 - 국가)     
        vSize="population",                              # 타일 크기
        vColor="GNI",                                    # 타일 색깔
        type="value",                                    # 타일 컬러링 방법
#        bg.labels = "yellow",                            # 레이블의 배경색        
        title = "World's GNI")                           # 트리맵 제목

# - 타일의 면적은 인구수와 비례
# - 타일의 색은 GNI를 의미
# - 소득이 높을수록 진한 초록색에 가까움
# - 소득이 낮을수록 노랑색에 가깝다
# - 그림으로 보면 아시아의인구가 매우 많다 (인도와 중국)
# - 소득은 북아메리카, 유럽이 높다.

library(treemap)
st = data.frame(state.x77)                               # 매트릭스를 데이터프레임으로 변환    
st = data.frame(st, stname = rownames(st))               # 주 이름 열 stname을 추가

treemap(st,
        index = c("stname"),
        vSize = "Area",
        vColor = "Income",
        type = "value",
        title = "USA states area and income")
