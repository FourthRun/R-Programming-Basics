df1 <- data.frame(x = c(2, 4, 6), y = c("a", "b", "c"))
colnames(df1)
names(df1)

rownames(df1)
length(df1)

typeof(df1)

df1[1]
df1[[1]]
df1["x"]
df1[["x"]]
df1$x

df1[c(1, 2), 1]
df1[c(1, 2),]

z.Temp <- (Teamp-mean(Temp)) / sd(Temp)
z.Temp <- (airquality$Temp-mean(airquality$Temp)) / sd(airquality$Temp)
z.Temp <- with(airquality, (Temp-mean(Temp)) / sd(Temp))

filter

library(tidyverse)

filter

as_tibble(cars)

tibble(x = 1:3, y = x + 1, z = 1)
data.frame(x = 1:3, y = x + 1)

tribble(
  ~x, ~y,
  1, "a",
  2, "b",
  3, "c"
)

#전통적 데이터 프레임 : 가능한 모든 자료를 화면에 출력, 대규모 자료의 경우 내용 확인 어려움

data(Cars93, package = "MASS")
Cars93

as_tibble(Cars93)

print(as_tibble(Cars93), n = 10, width = Inf)

head(mtcars)
mtcars_t <- as_tibble(mtcars)
print(mtcars_t, n = 6)

mtcars_d <- rownames_to_column(mtcars, var = "rownames")
mtcars_t <- as_tibble(mtcars_d)
mtcars_t

mtcars[, 1:2]
mtcars[, 1]
mtcars_t[, 1:2]
mtcars_t[, 1]
mtcars_t[1, 1]

x <- list(a = c("one", "two", "three"), b = 1:3, c = list(-1, -5), d = data.frame(x1 = c("s1", "s2"), x2 = 1:2))
x

x[1]
x[[1]]
str(x[1])
str(x[[1]])

x[[4]]
x$d
x[[4]][[2]]
x[[4]][2]
