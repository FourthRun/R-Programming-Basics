library(tidyverse)
library(rvest)

# 1-1
iris_t <- as_tibble(iris)
exe1_1 <- iris_t %>% arrange(desc(Sepal.Length)) %>%
  filter(Species == "setosa") %>%
  select(any_of(c("Species", "Sepal.Length"))) %>% 
  slice_head(n = 1)
exe1_1

# 1-2
exe1_2 <- iris_t %>%
  filter(Species == c("versicolor", "virginica")) %>%
  arrange(Petal.Length + Petal.Width) %>%
  select(any_of(c("Species", "Petal.Length", "Petal.Width"))) %>% 
  slice_head(n = 1)
exe1_2

# 2-1
mtcars_t <- mtcars
mtcars_t <- mtcars %>% 
  rownames_to_column(var = "row.name") %>% 
  as_tibble() %>% 
  filter(mpg >= mean(mpg)) %>% 
  select(any_of(c("row.name")))
ex2_1 <- as.vector(mtcars_t)
ex2_1


# 3-1
ex3_1 <- paste0(letters[c(1, 3, 5, 26)], collapse = "")
ex3_1

# 3-2
ex3_2 <- paste0(ex3_1, "," , toupper(ex3_1))
ex3_2

# 3-3
ex3_3 <- paste0(letters[c(1:3)], (letters[c(1:3)], (letters[c(1:3)])))
ex3_3

# 4번
URL_1 <- "https://en.wikipedia.org/wiki/COVID-19_pandemic_by_country_and_territory"
ex4_1 <- read_html(URL_1)
Xpath <- '//*[@id="covid-19-cases-deaths-and-rates-by-location"]/div[5]'
node_1 <- html_nodes(ex4_1, xpath = Xpath)
ex4_1 <- data.frame(html_table(node_1))
ex4_1

ex <- ex4_1[[1]]
names(ex) <- c("Country", "Deaths / million", "Deaths", "Cases")
str(ex)
