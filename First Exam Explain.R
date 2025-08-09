library(tidyverse)
library(rvest)

# 1-1
iris %>% 
  as_tibble() %>% 
  filter(Species == "setosa") %>% 
  slice_max(Sepal.Length, n = 1) %>% 
  select(Species, Sepal.Length)

# 1-2
iris %>% 
  filter(Species != "setosa") %>% 
  slice_min(Petal.Length + Petal.Width, n = 1) %>% 
  select(Species, Petal.Length, Petal.Width)

# 2-1-1
mpg_1 <- with(mtcars, mpg >= mean(mpg))
rownames(mtcars)[mpg_1]

# 2-1-2
mtcars_t <- mtcars %>% 
  rownames_to_column(var = "model")
mtcars_t %>% 
  filter(mpg >= mean(mpg)) %>% 
  pull(model)

# 2-2-1
mpg_2 <- with(mtcars, mpg >= mean(mpg) & gear %in% c(4, 5) & am == 1)
mtcars[mpg_2,]

# 2-2-2
mtcars %>% 
  filter(mpg >= mean(mpg))

# 3-1
y1 <- letters[c(1, 3, 5, length(letters))]
(ex3_1 <- paste0(y1, collapse = ""))

# 3-2
(ex3_2 <- paste(ex3_1, toupper(ex3_1), sep = ","))

# 3-3
y2_1 <- rep(letters[1:3], times = 3)
y2_2 <- rep(letters[1:3], each = 3)
y2_3 <- rep(letters[1:3], times = c(1, 3, 5))
(ex_3 <- paste0(y2_1, y2_2, y2_3))

# 4-1
URL <- "https://en.wikipedia.org/wiki/COVID-19_pandemic_by_country_and_territory"
X_path <- '//*[@id="covid-19-cases-deaths-and-rates-by-location"]/div[5]'
tbl <- read_html(URL) %>% 
  html_elements(xpath = X_path) %>% 
  html_table()
ex4_1 <- tbl[[1]]
ex4_1

# 4-2
ex4_2 <- ex4_1 %>% 
  select(-1) %>% 
  rename(Death_rate = 2) %>% 
  slice(-c(1, (n() - 7) : n()))
ex4_2

# 4-3
ex4_2$Death_rate <- as.numeric(gsub(",", "", ex4_2$Death_rate))
ex4_2$Deaths <- as.numeric(gsub(",", "", ex4_2$Deaths))
ex4_2$Cases <- as.numeric(gsub(",", "", ex4_2$Cases))
ex4_3 <- ex4_2 %>% 
  slice_min(Death_rate, n = 3) %>% 
  print()

# 4-4
ex4_4 <- ex4_2 %>% 
  slice_min(Deaths/Cases, n = 3) %>% 
  print()

# 5
mpg_ch <- mpg %>% 
  rename_with(toupper, where(is.character)) %>% 
  relocate(where(is.character)) %>% 
  print(n = 3)
