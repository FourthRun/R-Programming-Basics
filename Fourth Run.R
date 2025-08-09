x <- c(3, 8, 2)
y <- c(5, 4, 2)

x > y  
x >= y  
x < y
x <= y
x == y
x != y

x <- 1:3

x > 2
x < 2
x <= 2 | x >= 3
x <= 2 & x >= 1

x <- 1:5

any(x >= 4)
all(x >= 4)
x >= 4
sum(x >= 4)
mean(x >= 4)
x %in% c(2, 4)

y <- c(2, 4, 6, 8, 10)
y[c(1, 3, 5)]
y[c(-2, -4)]
y[c(2, 2, 2)]
y[6]
y[0] #파이썬은 0부터 시작, R은 1부터 시작, 해석 : 해당되는 자료가 없다.



pop <- c(Seoul = 9930, BUsan = 3497, Inchon = 2944, Suwon = 1194)

#or

pop <- c(9930, 3497, 2944, 1194)
names(pop) <- c("Seoul", "Busan", "Inchon", "Suwon")

pop
names(pop)
pop[c("Seoul", "Suwon")]

x <- c(80, 88, 90, 93, 95, 94, 99, 78, 101)
x <= mean(x)
x[x >= mean(x)]
sd(x)

z <- (x - mean(x)) / sd(x) 

x[abs(z) <= 1] #평균으로 부터 +-1 표준편차 안에 있는 관찰값
# mean(x) - sd(x) - 1 < 구할 값 < mean(x) + sd(x) + 1

x[abs(z) > 1 & abs(z) <= 2] #평균으로 부터 +-1 표준편차와 +-2 표준편차 사이에 있는 관찰값
# mean(x)

x[abs(z) > 2] #평균으로 부터 +-2 표준편차를 벗어나는 관찰값


gender <- c("Male", "Female", "Female")
gender_f <- as.factor(gender)
gender_f

is.factor(gender)

x <- c(1, 3, 2, 2, 1, 4)
factor(x)
x1 <- factor(x, labels = c("A", "B", "C", "D")); x1

x2 <- factor(x, labels = c("A", "A", "B", "B")); x2

levels(x1); levels(x2)
nlevels(x1); nlevels(x2)

income <- c("Low", "Medium", "High", "Medium")
factor(income, order = TRUE)
factor(income, order = TRUE, level = c("Low", "Medium", "High"))

x <- c(80, 88, 90, 93, 95, 94, 100, 78, 65)
cat.x <- cut(x, breaks = c(0, 80, 90, 100), include.lowest = TRUE, right = FALSE, labels = c("C", "B", "A"))
cat.x

cut(x, breaks = c(-Inf, 80, 90, Inf), right = FALSE, labels = c("C", "B", "A"))
