library(tidyverse)
library(rvest)

airs_M <- airquality %>% group_by(Month)

airs_M %>% summarise(avg_Oz = mean(Ozone, na.rm = TRUE))
airs_M %>% summarise(n_miss = sum(is.na(Ozone)), n_obs = sum(!is.na(Ozone)))
airs_M %>% summarise(firs_Oz = first(Ozone), last_Oz = last(Ozone))
airs_M %>% summarise(max_Oz = max(Ozone, na.rm = TRUE), min_Oz = min(Ozone, na.rm = TRUE))
m_Oz <- mean(airquality$Ozone, na.rm = TRUE)
airs_M %>% summarise(low_Oz = sum(Ozone < m_Oz, na.rm = TRUE))

mpg %>% group_by(cyl) %>% 
  select(hwy)

mpg %>% group_by(cyl) %>% 
  arrange(hwy, by_group = TRUE)


mpg %>% select(cyl, hwy) %>% 
  mutate(std_hwy = hwy - mean(hwy), rank = min_rank(hwy))

mpg %>% select(cyl, hwy) %>% 
  group_by(cyl) %>% 
  mutate(std_hwy = hwy - mean(hwy), rank = min_rank(hwy))

mpg %>% group_by(cyl) %>% 
  select(1:2, hwy) %>% 
  filter(hwy == max(hwy)) %>% 
  arrange(hwy, .by_group = TRUE)

airs_M <- airquality %>% 
  group_by(Month) %>% 
  select(1, 5, 6)

airs_M %>% slice_head(n = 1)
airs_M %>% slice_tail(n = 1)
airs_M %>% slice_min(Ozone, n = 1)
airs_M %>% slice_max(Ozone, n = 1)

mtcars %>% summarise(mpg = mean(mpg), cyl = mean(cyl), disp = mean(disp), hp = mean(hp))
mtcars %>% summarise(across(mpg:hp, mean))
