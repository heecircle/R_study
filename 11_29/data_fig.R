# 데이터 파알할떄 사용하는 함수
# head -> 앞부분 출력
# tail -> 뒷부분 출력
# view -> 뷰어창에서 데이터 확인
# dim -> 데이터 차원 출력
# str -> 데이터 속성 출력
# summary -> 요약 통계량 출력
library(readxl)

exam <- read_excel("excel_exam.xlsx")
exam
head(exam)
head(exam,10)
tail(exam)
tail(exam ,10)
View(exam)
dim(exam)
str(exam)
summary(exam)
mpg<-as.data.frame(ggplot2 ::mpg)
head(mpg)
dim(mpg)
str(mpg)

