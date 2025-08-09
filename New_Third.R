library(tidyverse)
library(rvest)

iris_t <- as_tibble(iris)
iris_t %>% summarise(across(where(is.numeric), mean))
iris_t %>% summarise(across(where(is.numeric), mean), across(where(is.factor), nlevels))
iris_t %>% summarise(across(where(is.numeric), sd), n = n()) # n = n()을 뒤로 넣는 이유 : n = n()은 sd(표준편차) 계산에 포함되면 안되는데, 포함되서 sd 뒤로 넣으면 해결된다.

iris_t %>% summarise(across(starts_with("se"), list(M = mean, SD = sd)))
iris_t %>% summarise(across(starts_with("se"), list(M = mean, SD = sd), .names = "{fn}_{col}"))

iris_t %>% summarise(across(where(is.numeric), ~sum(is.na(.x))))

iris %>% group_by(Species) %>% 
  summarise(across(where(is.numeric), ~length(unique(.x))))
iris %>% group_by(Species) %>% 
  summarise(across(where(is.numeric), n_distinct))

mean_sd <- list(mean = ~mean(.x, na.rm = TRUE),
                sd = ~ sd(.x, na.rm = TRUE))

airquality_t <- as_tibble(airquality)
airquality_t %>% summarise(across(c(Ozone, Solar.R), mean_sd))

iris_t %>% 
  mutate(across(where(is.factor), as.character))

iris_t %>% 
  mutate(across(where(is.numeric), ~ .x/2.54))

iris_t %>% 
  mutate(across(where(is.numeric), ~ .x/2.54, .names = "{col}_inch"), .before = 1)

iris_t %>% 
  filter(across(contains("Len"), ~ .x >= 6.5))

iris_t %>% 
  filter(if_all(contains("Len"), ~ .x >= 6.5))

iris_t %>% 
  filter(if_any(contains("Len"), ~ .x >= 6.5))

airquality_t %>% 
  filter(across(.fns = ~ !is.na(.x)))

airquality_t %>% 
  filter(if_all(.fns = ~ !is.na(.x))) %>% 
  print(n = 3)

airquality_t %>% 
  as_tibble() %>% 
  na.omit()

mpg %>% 
  distinct(manufacturer, model, .keep_all = TRUE) %>% 
  print(n = 3)
mpg %>% distinct(across(1:2), .keep_all = TRUE)
mpg %>%
  distinct(across(starts_with("m")), .keep_all = TRUE)


mpg %>% 
  count(manufacturer, model, sort = TRUE) %>% 
  print(n = 3)
mpg %>%
  count(across(1:2), sort = TRUE)
mpg %>%
  count(across(starts_with("m")), sort = TRUE)
