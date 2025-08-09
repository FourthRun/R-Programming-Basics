library(tidyverse)
library(rvest)

# 1번
x <- c(17, 16, 20, 24, 22, 15, 21, 18)
length(x)
x[length(x)]

# 2번
y <- c(10.4, 5.6, 3.1, 6.4, 9.6, 7.8, 12.1)
length(y)
y[length(y[-1])]

# 3번
grade <- c("1st", "1st", "2nd", "3rd", "2nd", "3rd", "1st")
grade <- as.factor(grade)
factor(grade)
factor(grade, order = TRUE, level = c("3rd", "2nd", "1st"))

# 4번
m1 <- matrix(c(12, 21, 32, 17, 22, 34, 19, 25, 35), nrow = 3, ncol = 3, byrow = TRUE)
colnames(m1) <- c("var1", "var2", "var3")
rownames(m1) <- c("Case #1", "Case #2", "Case #3")
m1[,2]

# 5번
d1 <- data.frame(var1 = c(12, 17, 19), var2 = c(21, 22, 25), var3 = c(32, 34, 35))
d1
d1[, 2, drop = F]

 # 6번
iris_t <- as_tibble(iris)
iris_t
iris_t %>% slice_head(n = 3)
iris_t %>% slice_tail(n = 3)

# 7번
df1 <- tibble(x = 1, y = 1:9, z = rep(1:3, times = c(3, 3, 3)), w = sample(letters, 9))
df1[["y"]]
df1$y
df1[,2] # 티블에서는 벡터 형태로 나오지 않음
as.data.frame(df1)
df2[,2]
df1[1:5, 2]
df2[1:5, 2]

# 8번
a <- seq(from = -5, to = 5, by = 0.2)
b <- seq(from = 1, to = 9, by = 2) %>%
  append(seq(from = 2, to = 10, by = 2))
c <- rep(1:4, times = 1:4)
d <- rep(1:3, times = 3)
e <- rep(c("a", "b"), times = 2:3)
f <- paste0("a", 1:5)
g <- paste0(rep(c("a", "b", "c"), times = 3), rep(c("a", "b", "c"), times = c(3, 3, 3)))

# 9번
al <- paste0(letters, 1:26) ##
a2 <- paste0(al, collapse = "-")
a3 <- gsub("-", "", a2)

# 10번
##

# 11번
y <- c(17, 16, 20, 24, 22, 15, 21, 18)
y[grep("24", y)] <- 23
sum(y > 20)
mean(y < 18)
sum(y < 18) / length(y)

# 12번
score <- c(85, 91, 75, 69, 52, 95, 88, 100)

score_g <- (score >= 0) + (score >= 60) + (score >= 70) + (score > 80) + (score >= 90)
grade <- factor(score_g, labels = c("E", "D", "C", "B", "A"))

grade <- cut(score, breaks = c(0, 60, 70, 80, 90, 100), right = TRUE, labels = c("E", "D", "C", "B", "A"))
grade

grade_d <- data.frame(score = c(score), grade = c(grade))
grade_d

# 13번

# 14번
A <- list(mat = matrix(c(1.2, 1.5, 2.1, 2.5, 2.7, 2.1, 3.1, 3.2, 2.8), nrow = 3, byrow = TRUE), df = data.frame(x1 = c("Park", "Lee", "Kim"), x2 = c(14, 16, 21)))
A

rownames(A$mat) <- c("SUb1", "Sub2", "Sub3")
colnames(A$df) <- c("name", "sales")

rowMeans(A$mat[,1:3])

mean(A$df$sales)

# 3장 1번
URL_1 <- "http://lib.stat.cmu.edu/datasets/fl2000.txt"
fl2000 <- readr::read_table(URL_1, comment = "#")
print(fl2000, n = 3)

names(fl2000) <- gsub('"', '', names(fl2000))
fl2000$county <- gsub('\"', '', fl2000$county)
fl2000$technology <- gsub('\"', '', fl2000$technology)

# 2번
URL_2 <- "http://lib.stat.cmu.edu/datasets/cloud"
cloud <- readr::read_table(URL_2, skip = 13)
cloud <- cloud[-1:-10, -9:-11]
cloud

# 3번
URL_3 <- "https://en.wikipedia.org/wiki/South_Korea"
top_company <- read_html(URL_3)
Xpath <- '//*[@id="mw-content-text"]/div[1]/table[9]'
node_1 <- html_nodes(top_company, xpath = Xpath)
top_company <- data.frame(html_table(node_1))
top_company
top_company_1 <- rvest::html_table(top_company)

# 4장 1번
airquality_t <- as_tibble(airquality)
airquality_t
air_sub1 <- airquality_t %>% filter(mean(Wind) <= Wind & mean(Temp) < Temp) %>% 
  select(any_of(c("Ozone", "Solar.R", "Month")))
air_sub1
