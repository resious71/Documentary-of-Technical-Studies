### 텍스트 마이닝
# 
#  1. 워드클라우드의 개념
#    - 지금까지 숫자 형태의 데이터를 다루는 방법에 관하여 학습
#    - 분석 대상 데이터 중에는 숫자가 아닌 문자나 문장 형태의 데이터도 있음
#       ex) 이메일 내용이나 SNS 메시지, 댓글 
#    - 워드클라두드(Word Cloud)는 문자형 데이터를 분석하는 대표적인 방법으로,대상 데이터에서 
#      단어(주로 명사)를 추출하고 단어들의 출현 빈도수를 계산하여 시각화하는 기능
#    - 출현 빈도수가 높은 단어는 그만큼 중요하거나 관심도가 높다는 것을 의미
# 
#  2. 준비 
#  2.1 JRE 설치
#  2.2 워드클라우드 문서 파일 준비
#    - 워드클라우드를 작성할 대상 문서는 일반적으로 텍스트 파일 형태로 준비 
#    - 파일의 끝부분 처리 : 마지막 문장이 끝나면 반드시 줄 바꿈을 한 후 저장
#    - 파일을 저장할 때, 인코딩을 'UTF-8'로 선택하여 저장
#    - 파일 이름이나 파일이 저장된 폴더 경로에 한글이 포함되어 있으면 파일을 읽을 때
#      에러가 발생하는 경우가 있으므로 파일을 저장할 때는 파일 이름을 영어로 저장
# 
#  3. 워드클라우드의 작성
#  3.1 대국민 담화문의 명사 추출

Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_211')
library(wordcloud)                                            # 워드클라우드
library(KoNLP)                                                # 한국어 처리 
library(RColorBrewer)                                         # 색상 선택
text = readLines("mis_document.txt", encoding = "UTF-8")      # 파일 읽기
buildDictionary(ext_dic = "woorimalsam")                      # "우리말씀" 한글사전 로딩
pal2 = brewer.pal*8, "Dark2")                                 # 팔레트 생성
noun = sapply(text,extractNoun, USE.NAMES = F)                # 명사 추출
noun                                                          # 추출된 명사 출력 

#  3.2 빈도수 높은 단어를 막대 그래프로 작성하기
noun2 = unlist(noun)                                          # 추출된 명사 통합
wordcount = table(noun2)                                      # 단어 빈도수 계산
temp = sort(wordcount, decreasing = T)[1:10]                  # 빈도수 높은 단어 10개 추출   
temp
temptemp = temp[-1]                                           # 공백 단어 제거
barplot(temp,                                                 # 막대그래프 작성     
        names.,arg = names(temp),                             # 막대 이름을 단어로 표시
        col = "lightblue",                                    # 막대의 색상 지정
        main = "빈도수 높은 단어", ylab = "단어 빈도수")

# 3.3 워드 클라우드 작성하기

wordcloud(names(wordcount),                                   # 단어들
          freq = wordcount,                                   # 단어들의 빈도
          scale=c(6, 0.7),                                    # 단어들의 폰트 크기
          min.freq = 3,                                       # 단어들의 최소 빈도    
          random.order = F,                                   # 단어들의 출력 위치 
          rot.per = .1,                                       # 90도 회전 비율  
          colors=pal2)                                        # 색상 



