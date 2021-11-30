install.packages("readxl")
library(readxl)
df_exam <-read_excel("excel_exam.xlsx")
df_exam
mean(df_exam$english)
df_exam_novear <-read_excel("excel_exam_novar.xlsx")
df_exam_novear
df_exam_novear <- read_excel("excel_exam_novar.xlsx",col_names = F)
df_exam_novear
# 시트가 여러개 있는 경우 read_excel("파일명",sheet=3)
# csv 파일 불러오는 경우 똑같음 .csv만 바뀜
# 문자가 들어있는 파일을 불러올때는 strignsAsFactors = F

english <- c(20,30,10,20,50)
math <-c(60,70,40,20,50)
df_midterm <- data.frame(english, math)
df_midterm
class <-c(1,1,2,2,3)
df_midterm<-data.frame(english,math, class)

write.csv(df_midterm,file="df_midterm.csv")

# R 데이터 파일로 저장하기
save(df_midterm,file= "df_mditerm.rda")

# RData 파일 불러오기

rm(df_midterm)
df_midterm

load("df_mditerm.rda")

df_midterm

# load 는 load하면서 자동으로 새 데이터 프레임이 만들어지고 데이터가 읽어와짐
# 엑셀파일이나 csv파일은 불러와서 변수에 할당해줘야 함.