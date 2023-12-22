#### 텟스트 마이닝 - 워드 클라우드
#

install.packages(wordcloud)
install.packages(KoNLP)                                         # 한국어 처리  
install.packages(RColorBrewer)                                  # 팔레트 사용  
install.packages(rJava)

library(wordcloud)
library(rJava)
library(KoNLP)
library(RColorBrewer)

# 자바 경로 직접 설정
Sys.setenv("JAVA_HOME"="C:/Program Files/Java/Jre1.8.0_231")
text = readlines("hwang.txt", encoding = "UTF-8")
text

buildDictionary(ext_dic="woorimalsam")                          # "우리말씀" 한글사전 로딩

pal2 = brewer.pal(8, "Dark2")
noun = sapply(text, extractNoun, USE.NAMES = F)                 # 명사 추출  
noun

noun2 = unlist(noun)
noun2 
wordcount = table(noun2)
wordcount

temp = sort(wordcount, decreasing = T)[1:20]
temp


temp = temp[-1]
temp 

barplot(temp, names.arg = names(temp), col="blue", 
        main = "빈도수가 높은 단어",
        ylab = "단어 빈도수")

wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(6,1),
          min.freq = 2,
          random.order = F,
          rot.per = .2,
          colors = pal2)

##################################################

# 패키지 설치 확인 방법
# system.file(package = 'xxx')

# 없앨 단어 모두

# 빈도수가 높은데 워드 클라우드에 없으면 사용자 사전에 추가 
buildDictionary(ext_dic = "woorimalsam",
                uwer_dic = data.frame("정치", "ncn"),
                replace_user_dic = T)


noun = sapply(text, extractNoun, USE.NAMES = F)
noun2 = unlist(noun)

# 무의미한 단어 제거 
noun2 = noun2[nchar(noun2 > 1)]
noun2

noun2 = gsub("모두", "", noun2)
noun2 = gsub("그동안", "", noun2)
wordcount = table(noun2)

wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(6,1),
          min.freq = 2,
          random.order = F,
          rot.per = .2,
          colors = pal2)

