#[연습문제 2.1]-------------------------------------------------------------
# • 막대의 색을 “tomato”색으로 칠해보시오.
# • 제목: “품종의 막대그래프”
#   가로축: “품종”
#   세로축: “개수”
#----------------------------------------------------------------------------
plot(iris$Species,
     col = "tomato",
     main = "품종의 막대그래프프",
     xlab = "품종",
     ylab = "개수")

# [연습문제 2.2]------------------------------------------------------------
# • 꽃잎의 너비(Petal.Width)에 대해서 다음 통계량을 구하시오.
# • 꽃잎의 너비(Petal.Width)에 대해서 히스토그램을 그려보시오.
#   - 히스토그램의 색을 변경해보시오.
#   - 제목과 축의 라벨을 변경해보시오.
# --------------------------------------------------------------------------
# 평균
mean(iris$Petal.Width)
# 분산
var(iris$Petal.Width)
# 표준편차
sd(iris$Petal.Width)
# 히스토그램
hist(iris$Petal.Width,
     col = "tomato",
     main ="꽃잎의 너비에 대한 히스토그램",
     xlab = "꽃잎의 너비",
     ylab = "빈도수")

# [연습문제 2.3]-------------------------------------------------------------
# • mtcars 데이터셋에서
#   - 마력(hp)의 히스토그램을 그려보시오.
#   - 히스토그램에서 축의 범위를 바꿔보시오. 𝑥축:c(0, 400), 𝑦축: c(0, 12)3
# • mtcars 데이터셋에서
#   - 마력(hp)과 연비(mpg)의 관계를 나타내는 산점도를 그려보시오.
#   - 산점도에서 점의 색과 모양을 여러 가지로 바꿔보시오.

# --------------------------------------------------------------------------
hist(mtcars$hp,
     xlim = c(0,400),
     ylim = c(0,12))

plot(mtcars$hp,mtcars$mpg,col='tomato',pch='+')

# [연습문제 2.4] cars ------------------------------------------------------
# • 변수와 관측값의 개수는 각각 얼마인가?
#   - speed, dist 변수에 대해서 다음 통계량을 각각 구해보시오.
# • 평균, 중앙값, 최대값, 최소값, 1 사분위 값, 3 사분위 값
#   - speed와 dist 변수의 관계를 나타내는 산점도를 그려보시오.
# • 산점도에서 점의 색과 모양을 바꿔보시오.
# • 산점도의 세로축과 가로축의 범위를 바꿔보시오.
# --------------------------------------------------------------------------

str(cars)
summary(cars$speed)
summary(cars$dist)
plot(cars$speed,cars$dist,
     col = 'tomato',
     pch = '+',
     xlim = c(0,30),
     ylim = c(0,150))

# [연습문제 3.1]------------------------------------------------------------
# • 한 변의 길이가 𝑥인 정사각형의 넓이 𝑎𝑟𝑒𝑎를 구하는 수식을 만드시오.
#   - 𝑥가 5, 10, 15일 때 𝑎𝑟𝑒𝑎의 값을 확인해 보시오.
# • 반지름의 길이가 𝑟인 원의 둘레 𝑟𝑜𝑢𝑛𝑑와 넓이 𝑎𝑟𝑒𝑎를 구하는 수식을 만드시오.
#   - 𝑟이 5, 10, 15일 때 𝑟𝑜𝑢𝑛𝑑와 𝑎𝑟𝑒𝑎의 값을 확인해 보시오.
#---------------------------------------------------------------------------
# 함수
square_area <- function(x) x^2
circle_area <- function(r) pi*(r^2)
circle_round <- function(r) 2*pi*r

# 정사각형 넓이(x =5,10,15)
sapply(c(5,10,15), FUN = square_area)
# 원 넓이(r =5,10,15)
sapply(c(5,10,15), FUN = circle_area)
# 원 둘레(r =5,10,15)
sapply(c(5,10,15), FUN = circle_round)

# [연습문제 3.2]: 피자나라의 치킨공주----------------------------------------
# • 양의 정수 𝑛의 값에 따라 𝑜𝑟𝑑𝑒𝑟에 다른 값을 할당하시오.
#   - 𝑛이 3의 배수이면 𝑜𝑟𝑑𝑒𝑟는 “피자”
#   - 𝑛이 5의 배수이면 𝑜𝑟𝑑𝑒𝑟는 “치킨”
#   - 𝑛이 3과 5의 배수이면 𝑜𝑟𝑑𝑒𝑟는 “피자나라치킨공주” 
#   - 𝑛이 그 이외의 수이면 𝑜𝑟𝑑𝑒𝑟는 “다이어트”
# • 𝑛 이 6, 10, 13, 15일 때 𝑜𝑟𝑑𝑒𝑟 의 값을 확인하시오.
# ---------------------------------------------------------------------------
PC <- function(n) {
  if (n %% 15 == 0){
    print('PC')  
  }
  else if (n %% 3 == 0){
    print('P')  
  }
  else if (n %% 5 == 0){
    print('C')  
  }
  else{
    print('D')  
  }
}

sapply(c(6,10,13,15),FUN=PC)

# ifelse 활용방법
order <- function(v)  ifelse( v %% 15 ==0, 'PZ',
                          ifelse(v %% 3 ==0, 'P',
                              ifelse(v %% 5 == 0, 'C','D')))
v <- 1:15
w <- order(v)
w


# [연습문제 3.3]------------------------------------------------------------
# • 임의의 자연수 𝑛에 대하여
#   - 𝑆= 1 + 2^3 +3^3+ ...+ (𝑛 − 1)^3 +𝑛^3 를 구하는 코드를 작성하시오.
#   - 𝑛이 10, 15, 20일 때 𝑆의 값을 확인하시오.
# • 임의의 자연수 𝑛에 대하여
#   - 𝑛!을 구하는 코드를 작성하시오.
#   - 𝑛이 10, 15, 20일 때 𝑛!의 값을 확인하시오.
#---------------------------------------------------------------------------
cal_S <- function(n) sum((1:n)^3)
cal_F <- function(n) factorial(n)

sapply(c(10,15,20),FUN = cal_S)
sapply(c(10,15,20),FUN = cal_F)

# 더 효율적인 방식으로 개선
cal_S2 <- function(n) ((n*(n+1)/2)^2)
sapply(c(10,15,20), cal_S2)


# [연습문제 3.5]------------------------------------------------------------
# • 임의의 홀수 𝑛에 대하여
#   - 이중 for-loop를 이용하여 아래와 같이 별(*) 모양을 찍어보시오.
#   - 아래 예시는 𝑛 = 5일 때이다.
# (1) *****   (2) *       (3) *****
#     *****       **          *
#     *****       ***         *****
#     *****       ****        *
#     *****       *****       *****
#(1)
draw_lec <-  function(num){
  for (i in 1:num){ 
    cat('\n')
    for (j in 1:num) {  
        cat('*')
      }
  }  
}

#(2)
draw_tri <- function(num){
  for (i in 1:num){ 
    cat('\n')
    for (j in 1:num) {  
      if (i>=j) cat('*')
    }
  }
}

#(3)
draw_E <- function(num){
  
  for (i in 1:num){
    cat('\n')
    if(i%%2!=0)
      for(j in 1:num){
        cat('*')
        }
    else {cat('*')
    }
  }
}

sapply(c(3,5,7),FUN=draw_lec)
sapply(c(3,5,7),FUN=draw_tri)
sapply(c(3,5,7),FUN=draw_E)
draw_E(9)

# [연습문제 3.6]-------------------------------------------
# • 임의의 자연수 𝑛에 대하여 1부터 𝑛까지의 수 중에서
#   - 소수를 모두 출력하고,
#   - 소수의 개수를 구하는 코드를 작성하시오.
# • 𝑛이 10, 100, 1000일 때 소수와 소수의 개수를 확인하시오.
#-----------------------------------------------------------
# n의 약수 개수 찾기
div.cnt <- function(n) length((1:n)[n%%(1:n)==0])

# 1~n까지 소수 찾기
prime <- function(n) (1:n)[sapply(1:n, FUN =div.cnt) == 2]

# 1~n까지 소수개수 찾기
prime_count <- function(n) length(prime(n))

sapply(c(10,100,1000),FUN = prime)
sapply(c(10,100,1000),FUN = prime_count)

# [연습문제 3.7 ]-------------------------------------------
#  • 1부터 𝑛까지의 자연수에 대하여
#   - 약수의 개수를 모두 출력하고, 
#   - 약수의 개수가 가장 많은 숫자를 찾는 코드를 작성하시오.
#   - 단, 약수의 개수가 가장 많은 숫자가 여러 개이면 가장 큰 수를 찾으시오.
#   - 𝑛이 10, 100, 1000일 때 약수의 개수가 가장 많은 숫자를 확인하시오.
#-------------------------------------------------------------
# 약수 개수 찾기 함수
div.cnt <- function(n) length((1:n)[n%%(1:n)==0])

# 1~n지 약수 개수 모두 출력 함수
div.cnt.all <- function(n) sapply(c(1:n),FUN=div.cnt)
div.cnt.all(100)
which.max(div.cnt.all(100))

# 약수의 개수가 가장 많은 숫자를 찾는 코드          
max <- 0
for (i in 1:100){
  if(div.cnt(max) <= div.cnt(i)){
    max <- i
  }
}
max

# 효율적인 계산
div <- function(n) {
  for (i in 1:sqrt(n)){
    if (n%% i ==0)
    cat(i, n/i,'\n')
  }
}
div(48)
53
install.packages("rmarkdown")
# [연습문제 4.1]------------------------------------------------------
# • 피자나라치킨공주 벡터를 생성하는 코드를 참조하여
#   - 1에서 15까지 각 인덱스 숫자의 약수의 개수 벡터 div를 생성하시오.
#   - div: 1 2 2 3 2 4 2 4 3 4 2 6 2 4 4
# • div 벡터에서 벡터의 인덱싱과 벡터 연산을 이용하여 물음에 답하시오.
#   - 약수의 개수가 2인 원소의 개수는 몇 개인가? 
#       - 반드시 sum() 함수를 이용할 것
#   - 약수의 개수가 2인 원소의 인덱스를 모두 출력하시오.
#       - 반드시 which() 함수를 이용할 것
# • 1에서 15까지 소수의 개수는 몇 개인가?
#----------------------------------------------------------------------
# 1~n까지 약수 개수 모두 출력 함수 
div.cnt.all <- function(n) sapply(c(1:n),FUN=div.cnt)

# 벡터 div 생성
div <- c(div.cnt.all(15))

# 약수의 개수가 2인 원소의 개수
sum(div ==2)

# 약수의 개수가 2인 원소의 인덱스
which(div ==2)

# 1~n까지 소수 개수 찾기
prime_count <- function(n) sum(sapply(1:n, FUN =div.cnt) == 2)
prime_count(15)

# [ 연습문제 4.2 ]-----------------------------------------------------
#  • 다섯 사람의 키와 몸무게를 조사한 표가 아래와 같이 제시되었다.
#   - 키, 몸무게의 벡터 height, weight를 생성하시오.
#   - 혈액형의 팩터 blood를 생성하시오.
#   - height, weight, blood를 각각 원소의 이름으로 가진 리스트 lst를 생성하시오.
#   - lst$height와 lst$weight의 평균을 계산하시오.
#   - lst$blood의 빈도표를 출력하시오.
#----------------------------------------------------------------------

# 키, 몸무게 벡터
height <- c(163,175,182,179,161)
weight <- c(65,87,74,63,51)

# 혈액형 팩터로 저장
blood <- factor(c(1,2,3,4,1),
            levels = 1:4,
            labels = c('A','B','AB','O'))
blood

# 원소의 이름으로 가진 리스트 lst
lst <- list(height = height , weight = weight, blood=blood)

# lst$height와 lst$weight의 평균
mean(lst$height)
mean(lst$weight) 

# lst$blood의 빈도표
table(lst$blood)

# [연습문제 5.1]------------------------------------------------------
#  • 임의의 자연수 𝑛에 대하여
#   - 약수의 개수를 구하는 div.cnt() 함수를 작성하시오.
#     - 입력값: 임의의 자연수 𝑛
#     - 출력값: 𝑛의 약수의 개수
#   -1에서 15까지의 𝑛에 대해서 약수의 개수를 확인하시오.
#----------------------------------------------------------------------
div_cnt <- function(n) length((1:n)[n%%(1:n)==0])
sapply(1:15,div_cnt)

# [ 연습문제 5.2]------------------------------------------------------
#  • 임의의 자연수 𝑛에 대하여
#   - 1부터 𝑛까지 소수의 개수를 리턴하는 prime.cnt() 함수를 작성하시오.
#     - 입력값: 임의의 자연수 𝑛
#     - 출력값: 1부터 𝑛까지 소수의 개수
#   - 𝑛이 10, 100, 1000, 10000, 100000일 때 소수의 개수를 확인하시오.
#     - 소수인지 판단하는 is.prime() 함수를 먼저 작성하시오.
#     - is.prime() 함수를 이용하여 prime.cnt() 함수를 작성하시오.
#   - is.prime()에서 𝑛 까지만 확인해도 됨을 확인하고,
#     - 내장 함수를 이용해서 is.prime()을 수정하시오.
#---------------------------------------------------------------------
# 소수개수 리턴 함수
prime_cnt <- function(n) sum(sapply(1:n,div.cnt)==2)
sapply(c(10,100,1000,100000),prime_cnt)

# 소수인지 판단하는 is.prime() 함수
is_prime <- function(n) div.cnt(n)==2
prime_cnt <- function(n) sum(sapply(1:n,is_prime))
prime_cnt(100)

# 루트N
div_cnt <- function(n) length((1:sqrt(n))[n%%(1:n)==0])
is_prime <- function(n) div.cnt(n)==2
prime_cnt <- function(n) sum(sapply(1:n,is_prime))
prime_cnt(100)

# [연습문제 6.1]------------------------------------------------------------
# • state.x77 데이터셋에 대하여 R 코드를 작성하시오.
#   - state.x77 데이터셋을 st 변수에 저장: 데이터 프레임 형태로 저장할 것
#   - st 데이터 프레임의 변수와 관측값의 개수는?
#      - 각 주별 소득(Income)의 평균은?
#      - 인구(Population)가 10,000보다 큰 주의 인구, 소득은?
#      - Florida 주의 인구와 소득은?
# • rownames(st) 는 st 각 주의 이름 벡터를 리턴한다.
#   - 인구가 1,000보다 작고, 소득이 4,436보다 작은 주의 모든 정보를 출력하라.
#   - 문맹률(Illiteracy)의 평균을
#      - 소득이 5,000보다 작은 주에 대해서 구하라.
#      - 소득이 5,000보다 큰 주에 대해서 구하라.
#--------------------------------------------------------------------------
st <- data.frame(state.x77)
# 변수와 관측값의 개수
dim(st)
# 주별 소득 평균/ 인구가 10000보다 큰 주의 인구,소득 / florida 인구,소득
mean(st$Income)
st[st$Population>10000,c(1,2)]
#colnames(st)
st[rownames(st) == 'Florida',c(1,2)]
# 인구 1000미만, 소득4436미만 주 모든 정보 / 문맹평균(소득5000이상,이하)
st[st$Population<1000 & st$Income <4436,]
mean(st[st$Income<5000,"Illiteracy"])
mean(st[st$Income>=5000,"Illiteracy"])

# 파일 불러오기 저장
library(readxl)
df <- read_excel('성적표.xlsx',sheet=1)
df$평균 <- round(apply(df[, 3:5], MARGIN =1, mean),2)
df$평균 <- apply(df[,4:6],MARGIN =1,mean)
df$평균

# 파일  csv저장
write.csv(df,"성적표2",row.names=F)

library(mice)
df <- airquality
df[complete.cases(df),]

# [연습문제 8.1] --------------------------------------------------------
#  • state.x77 데이터셋에 대하여, 다음 R 코드를 작성하시오.
#    - Population을 기준으로 오름차순으로 정렬하시오.
#    - Income을 기준으로 내림차순으로 정렬하시오.
#    - Illiteracy를 기준으로 오름차순으로 정렬하되,
#     - 문맹률이 같은 주에 대해서는 Population의 내림차순으로 정렬하시오.
# -----------------------------------------------------------------------
df = data.frame(state.x77)
sort(df$Population)

# 열 하나만 뽑아도 인덱스 함께 보기
Pop_ord <- order(df$Population)
Pop_ord

df <- df[Pop_ord,]

subset(df, 
       select = 2)

# [연습문제 8.2]---------------------------------------------------------------
# • mtcars 데이터셋에 대하여, 다음 R 코드를 작성하시오.
#   - mtcars 데이터셋을 gear의 개수에 따라 그룹을 나누시오. 
#     • split() 함수를 이용하여 df.split에 저장
#   - mtcars 데이터셋에서 gear의 개수가 3인 그룹과 4인 그룹을 합치시오.
#      • rbind() 함수를 이용하여 df.34에 저장
#------------------------------------------------------------------------------
str(mtcars)
df.split <- split(mtcars, f=df$gear)
df.split$'3'
df.split$'4'
df.34 <- rbind(df.split$'3', df.split$'4')
df.34

# [연습문제 8.3]----------------------------------------------------------------
# • airquality 데이터셋에 대하여, 다음 R 코드를 작성하시오.
#   - airquality에서 1, 2, 3, 4번 column을 추출하여 df에 저장: subset() 함수
#   - 위에서 추출한 변수에 대해 월별(Month)로 평균을 구하시오.
#     • aggregate() 함수로 mean() 함수를 범주를 Month로 하여 구할 수 있음.
#     • NA 값에 대해서는 na.rm = T로 매개변수값을 지정
#   - 위에서 추출한 변수에 대해 일별(Day)로 표준편차를 구하시오.
#     • aggregate() 함수로 sd() 함수를 적용하여 df.day 에 저장
#-------------------------------------------------------------------------------
df <- airquality[,1:4] # 그냥하기
df <- subset(airquality,select =1:4) #subset사용
df 

airquality
airquality_aggr <- aggregate(df,
                            by=list(Month = airquality$Month),
                            FUN = mean,
                            na.rm = TRUE)
plot(airquality_aggr)

df.day <- aggregate(df,
                    by=list(Day=airquality$Day),
                    FUN = sd,
                    na.rm= TRUE)
df.day


#[팔머 펭귄 분석] -------------------------------------------------
install.packages("palmerpenguins")
library(palmerpenguins)
df <- penguins

table(df$island)
install.packages('gmodels')
library(gmodels)
CrossTable(df$island,df$species,
           prop.t = F, Prop.chisq =F)

?CrossTable

install.packages('psych')
library(psych)

aggregate(df[,3:6], 
          by=list(species = df$species),
          FUN=mean,
          na.rm=T)

tapply(df$bill_length_mm,
       INDEX = list(species = df$species),
       FUN=mean,
       na.rm=T)

tapply(df$bill_depth_mm,
       INDEX = list(species = df$species),
       FUN=mean,
       na.rm=T)


str(df)
boxplot(flipper_length_mm~species,
        data=df, col=2:4)

adelie <- split(df, df$species)$Adelie
adelie
outlier <- boxplot.stats(adelie$flipper_length_mm)$ouut
outlier
df[df$flipper_length_mm %in% outlier,]


adelie <- df[df$species=='Adelie',]
adelie 
outlier <- boxplot.stats(adelie$flipper_length_mm)$out
outlier
result <- df[df$flipper_length_mm %in% outlier,]
dim(result)

df <- na.omit(penguins)
df <- data.frame(df)

# 날개 길이 오름차순, 체질량 내림차순 정렬

ord <- order(df$flipper_length_mm, df$body_mass_g)
ord
df_ord <- df[ord,5:6]
df_head <- head(df_ord,n=10)
rownames(df_ord) <- NULL
df_head
