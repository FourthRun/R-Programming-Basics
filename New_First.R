library(tidyverse)
library(rvest)

as_tibble(mtcars) %>% 
  mutate(kml = 0.43*mpg, gp_kml = if_else(kml >= 10, "good", "bad")) %>% 
  relocate(kml, gp_kml)

as_tibble(mtcars) %>%
  mutate(kml = 0.43*mpg, gp_kml = case_when(
    kml >= 11 ~ "excellent",
    kml >= 8 ~ "good",
    TRUE ~ "bad"), .before = mpg)

as_tibble(mtcars) %>% 
  transmute(kml = 0.43*mpg, gp_kml = if_else(kml >= 10, "good", "bad")) %>% 
  relocate(kml, gp_kml)

as_tibble(mpg) %>% 
  summarise(n = n(), n_hwy = n_distinct(hwy), avg_hwy = mean(hwy))

as_tibble(mpg) %>%
  summarise(avg_hwy = mean(hwy), rng_hwy = range(hwy))

mpg %>% 
  summarise(avg_hwy = mean(hwy), rng_hwy = range(hwy), q_hwy = quantile(hwy, probs = c(0.25, 0.5, 0.75)))

# 분위수 : 무슨 뜻인지 알아두기

by_cyl <- mpg %>% group_by(cyl)
by_cyl

by_cyl %>% tally()
by_cyl %>% count()
mpg %>% count(cyl)
mpg %>% tally()

by_cyl %>% group_by(drv, .add = TRUE)
by_cyl %>% group_by(drv)
by_cyl %>% ungroup()
