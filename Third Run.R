x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")
(y <- strsplit(x, split=", "))
unlist(y)

unlist(strsplit("PARK", split = ""))

unlist(strsplit("a.b.c", split = ".")) #오류 발생
unlist(strsplit("a.b.c", split = "[.]"))

x <- c("park", "lee", "kwon")
(y <- toupper(x))
tolower(y)

substr(x, 1, 1) <- toupper(substr(x, 1, 1))
x


x <- "Park hates stats. He hates math, too."
sub("hat", "lov", x)
gsub("hat", "love", x)

(y <- paste0("banana", 1:3))
sub("a", "A", y)
gsub("a", "A", y)

x <- c(7, 8, 9, 10)
y <- c(1, 2, 3, 4)
x + y
x - y
x * y
x / y
x ^ y

1:4 + 1:3

c(-1, 0, 1) / 0
sqrt(-1)
Inf-Inf
Inf/Inf

abs(-2) #절대값
sqrt(25) #제곱근
ceiling(3.475) #N보다 작지 않은 가장 작은 정수
floor(3.475) #N보다 크지 않은 가장 큰 정수
ceiling(-3.475)
floor(-3.475)
trunc(5.99) #소숫점 버림
round(3.475, 2) #소숫점 N만큼 버림
signif(0.00347, 2) #자리수 N만큼 올리고 반올림

x <- c(1, 2, 3, 4, 50)
mean(x) #평균
median(x) #중앙값
range(x) #범위
IQR(x)
sd(x)
var(x)
sum(x)
min(x)
max(x)

diff(c(1, 2, 4, 7, 11))
x <- c(1, 0 , 3, 5, NA)
is.na(x)
x == NA
mean(x); max(x)

X <- c(1, 0, 3, 5, NA) 
mean(x, na.rm = TRUE); max(X, na.rm = TRUE)
