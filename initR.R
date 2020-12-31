## Run 단축키
# cmd shift enter
# - 전체
# cmd enter
# - 현재 줄

## 주석
# #
# cmd shift c
# cmd /로 수정함

## Working directory
# getwd()
# - 현재 working directory 확인
# setwd(string dir)
# - working directory 설정
dir = "./"
setwd(dir)
getwd()

## 데이터 불러오기
# - header=T: 첫줄을 변수 명으로 인식
# - 설정한 working directory에 있어야 함
# - 변수 설정 시 <- 또는 =
# dat = read.table(“file.dat”, header=T)
# txt = scan(“file.txt”)
# csv = read.csv(“file.csv”)
dat <- read.csv("iris.csv", header=T)
# dat

## Data preview
head(dat)
tail(dat)
dat$Sepal.Length
dat[,1]

## 간단한 통계
len_sepal <- dat$Sepal.Length
mean(len_sepal)
median(len_sepal)
min(len_sepal)
max(len_sepal)


## 시각화
# table()
# barplot()
# hist()
# pie()
# stem()
# plot(x, y)
# boxplot()
# mosaicplot(x) # 이때 x는 분할표


## 시각화: 숫자형

## histogram
hist(len_sepal)
hist(len_sepal, 
     main = "Histogram of Sepal Length", 
     xlab = "Sepal Length", 
     col = cm.colors(10), 
     breaks = seq(4, 8, by=0.25) # seq(10, 40, by=1)
     )
lines(density(len_sepal))

## stem-and-leaf plot
stem(len_sepal)
stem(len_sepal, scale = 0.5) # scale: controls the plot length

## scatter plot
# plot(x, y)
plot(dat$Sepal.Length)
plot(dat$Sepal.Length, dat$Petal.Width)
plot(dat$Sepal.Length, 
     dat$Petal.Width, 
     main = "Histogram of Sepal Length", 
     xlab = "Sepal Length", 
     ylab = "Petal Width",
     type = "l" # 시계열 플롯
     )

## scatter plot matrix
plot(dat[1:4],
     col = c("red", "blue", "green")[iris$Species]
     )

## box plot
boxplot(len_sepal)
boxplot(Sepal.Length ~ Species, data = dat)
boxplot(Sepal.Length ~ Species, data = dat,
        col = terrain.colors(3),
        xlab = "Species",
        ylab = "Sepal Length",
        main = "Boxplot"
        )
boxplot(Sepal.Length ~ Species, data = dat,
        col = c("lightcyan", "palegreen3", "khaki"),
        xlab = "Species",
        ylab = "Sepal Length",
        main = "Boxplot"
        )

## parallel plot
# install.packages("lattice")
library(lattice)
parallelplot(dat[1:4],
             main = "parallel graph"
             )
parallelplot(dat[1:4],
             groups = dat$Species,
             main = "parallel graph",
             horizontal.axis = FALSE
             )


## 시각화: 범주형
freq <- table(dat$Species)
relative <- prop.table(freq) # 상대도수
freq; relative
ft = cbind(freq, relative)
ft

## bar plot
barplot(relative)

## pie chart
pie(relative,
    main = "Pie Chart")
pie(relative,
    labels = paste(unique(dat$Species), round(relative*100, 1), "%"),
    main = "Pie Chart")

## mosaic plot
library(datasets)
data("Titanic")
Titanic
mosaicplot(Titanic)
mosaicplot(~Sex + Survived,
           data = Titanic,
           main = "Survived on the Titanic",
           color = TRUE,
           cex = 1.5
           )
mosaicplot(~Sex + Survived + Class,
           data = Titanic,
           main = "Survived on the Titanic",
           col = terrain.colors(7)
           )

