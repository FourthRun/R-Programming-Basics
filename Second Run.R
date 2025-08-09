x <- c(11, 12, 13, 14)
c(x, 15)
y <- c(16, 17, 18)
c(x, y)

append(x, 15)
append(x, 15, after = 2)
append(x, y)
append(x, y, after = 3)

#수열
1:5
-3:3
1.5:5.4
5:0

seq(from = 0, to = 5) #seq(0, 5)
seq(from = 0, to = 5, by = 2) #seq(0, 5, by = 2)
seq(from = 0, to = 5, length = 3) #seq(0, 5, len = 3)
seq(from = 0, by = 2, length = 3) #seq(0, by = 2, len = 3)

seq(3)
seq(-3)

#반복
rep(1, times =3)
rep(1:3, times = 2)
rep(c("M", "F"), times = c(2, 3))

rep(1:3, each = 2)
rep(1:3, each = 2, times = 2)

rep(1:3, length = 6)
rep(1:3, each = 2, length = 12)

# 문자
x <- c("Park", "Lee", "Kwon")
nchar(x)
nchar("응용통계학과")

paste("모든", "사람에게는", "통계적", "사고능력이", "필요하다")
paste("모든", "사람에게는", "통계적", "사고능력이", "필요하다", sep = "-")
paste("모든", "사람에게는", "통계적", "사고능력이", "필요하다", sep = "")

paste("원주율은", pi, "이다")

paste(c("Stat", "Math"), 1:2, sep = "")
paste("Stat", 1:3, sep = "")
paste(c("Stat", "Math"), 1:3, sep = "-")
paste0("stat", 1:3)

paste0(letters, collapse = "")
paste0(LETTERS, collapse = ",")
paste0(letters, LETTERS, collapse = ",")

substr("Statistics", 1, 4)
x <- c("응용통계학과", "정보통계학과", "학생회장")
substr(x, 3, 6)
substr(x, c(1, 3), c(2, 6))

x <- c("New York, NY", "Ann Arbor, MI", "Chicago, IL")
substr(x, nchar(x) -1, nchar(x))
