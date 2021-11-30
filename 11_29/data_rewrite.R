df_raw<-data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_raw
install.packages("dplyr")
library(dplyr)
df_new<-df_raw
df_new<-rename(df_new,v2=var2) # var2를 v2로 수정 
df_new
df_new$var_sum<-df_new$var1+ df_new$v2 # 새 col 생성
df_new
df<-df_new
df$var_mean <- (df$var1+df$v2)/2

mpg
mpg$total<-(mpg$cty+mpg$hwy)/2
mpg$test<-ifelse(mpg$total>=20,"pass","fail") # ifelse(조건,참일때 넣을 값, 거짓일때 넣을 값)
table(mpg$test)

library(ggplot2)
qplot(mpg$test)
