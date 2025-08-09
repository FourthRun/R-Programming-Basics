#양적 자료 : 숫자로 표현 가능, 질적 자료 : 숫자로 표현 불가능(ex. 성별, 지역)

x <- as.Date(c("2017-01-01", "2018-01-01"))
x
typeof(x)
x[2] - x[1]

s1 <- as.Date("2018-03-01")
e1 <- as.Date("2018-03-31")
seq(from = s1, to = e1, by = 7)
seq(from = s1, by = "week", length = 5)
seq(from = s1, by = "month", length = 5)
seq(from = s1, by = "year", length = 5)

x <- matrix(1:12, nrow = 3)
x


y <- matrix(1:12, nrow = 3, byrow = TRUE)
y

x1 <- 1:3
x2 <- 4:6

(A <- cbind(x1, x2))
(B <- rbind(x1, x2))

cbind(A, x3 = 7:9)
rbind(A, 7:8)

x1 <- 1:4
x2 <- 5:6
x3 <- 7

cbind(x1, x2, x3)

x <- 1:12
dim(x) <- c(3,4)

rownames(x) <- c("one", "tow", "three")
colnames(x) <- c("a", "b", "c", "d")

x

x[2, 3]
x[1, ]
x[, 2]
x[1:2, ]
x[1:2, 3:4]

A <- matrix(1:4, nrow = 2)
B <- matrix(1:4, nrow = 2)
A * B
A %*% B
t(A)
colMeans(A)
rowMeans(A)
diag(A)
x <- c(10, 20); diag(x)
diag(2)
solve(A)
solve(A) %*% A

df1 <- data.frame(x = c(2, 4, 6), y = c("a", "b", "c"))
df1

str(df1)

data.frame(x = c(2, 4), y = c("a", "b", "c"))
data.frame(x = 1, y = c("a", "b", "c"))

colnames(df1)
names(df1)

rownames(df1)
length(df1)
