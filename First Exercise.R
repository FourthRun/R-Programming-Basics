library(tidyverse)

# 1번
iris_t <- as_tibble(iris)
iris_t %>% slice(1:3, 51:53, 101:103)

# 2번
iris_t %>% grep("setosa", iris_t$name)

filter(Species == setosa)

grep("setosa", iris_t$Species)

# 3번
iris_t %>% filter(Petal.Width <= 1 & Petal.Length <= 4)

# 4번
mtcars_t <- as_tibble(mtcars)
mtcars_t <- filter(mpg)