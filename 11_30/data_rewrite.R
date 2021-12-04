# filter 행추출
# select 열 추출
# arrange 정렬
# mutate 변수 추가
# summarise 통계치 산출

# group_by 집단별로 나누기
# left_join() 데이터 합치기(열로)
# bind_rows() 데이터 합치기 (행으로)


library(dplyr)
library(readxl)
exam <- read_excel("~/R_study/data/excel_exam.xlsx")
exam
exam %>% filter(class ==1) # exam %>% filter(조건)


exam  %>% filter(class %in% c(1,3,5)) #%iN% in 명령어 사용하기

mpg<-as.data.frame(ggplot2::mpg)
head(mpg)

displ_4<-mpg%>%filter(displ<=4)
head(displ_4)
displ_5<-mpg%>%filter(displ>=5)
head(displ_5)

mean(displ_4$hwy)
mean(displ_5$hwy)

exam %>% select(math) # 열 추출
exam%>% select(-math) # math 빼고 추출출

# dplyr 패키지 함수들은 %>% 를 조합해서 쓸 수 있다.
exam %>% filter(class==1) %>% select(english) # class=1 이고 행 추출

#보통 아래처럼 가독성 있게 작성함
exam %>%
  filter(class==1) %>%
  select(english)
exam %>%
  select(id,math) %>%
  head
mpg
mpg_1 <- mpg %>% 
  select(class,cty)
mpg_1 %>% head


mean((mpg_1 %>% filter(class=="suv"))$cty)

mean((mpg_1 %>% filter(class=="compact"))$cty)


# 정렬하기

exam %>% arrange(math)

exam %>% arrange(class,math)


mpg %>% 
  filter(manufacturer=="audi") %>% 
  arrange(desc(hwy)) %>%
  head(5)


# 파생변수 추가하기 

exam %>%
    mutate(total=math+english+science) %>%
    head

exam %>%
    mutate(total = math+ english- science,
    mean=(math+english+science)/3) %>%
    head

exam %>% 
    mutate(test= ifelse(science >= 60,"pass","fail")) %>%
    head

exam %>%
    mutate(total = math + english + science) %>%
    arrange(total) %>%
    head

mpg %>% head
mpg <-as.data.frame(ggplot2 :: mpg)
mpg %>% head
mpga<-mpg %>% 
    mutate(u_yc=hwy+cty) %>%
    head

mpga<-mpga %>%
    mutate(a_yc=u_yc/2) %>%
    head

mpga %>% 
    arrange(a_yc) %>%
    head(3)

mpg %>% 
    mutate(a_yc=(hwy+cty)/2) %>%
    arrange(a_yc) %>%
    head(3)


# 집단별로 요약하기 

exam %>% summarise(mean_math= mean(math))

exam %>%
    group_by(class) %>% 
    summarise(mean_math = mean(math))

exam %>% 
    group_by(class) %>%
    summarise(mean_math = mean(math),
              sum_math= sum(math),
              median_math= median(math),
              n=n() )


mpg %>%
    group_by(manufacturer) %>%
    filter(model=="suv") %>%
    mutate(av = (hwy+cty)/2) %>%
    summarise(av_tot = mean(av)) %>%
    arrange(desc(av_tot)) %>% 
    head(5)


mpg %>% head()

mpg %>%
    group_by(class) %>%
    summarise(mean(cty))

mpg %>%
    group_by(class) %>%
    summarise(m = mean(cty)) %>%
    arrange(m)

test1 <- data.frame(id = c(1,2,3,4,5), midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5), final = c(70,83,65,95,80))

total <- left_join(test1, test2, by= "id")
total

name <- data.frame (class = c(1,2,3,4,5), teacher= c("kim","lee","park","choi","jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id=c(1,2,3,4,5), test = c(60,80,70,90,85))
group_b <- data.frame(id= c(6,7,8,9,10), test= c(70,83,65,95,80))

group_a
group_b

group_all <- bind_rows(group_a, group_b)
group_all

fuel <- data.frame(f1=c('c','d','e','p','r'),price_fuel=c(2.35,2.38,2.11,2.76,2.22))
fuel

mpg %>% head

fuel

mpg2 <- left_join(fuel, mpg, by= "f1")
mpg2
mpg %>% head()
