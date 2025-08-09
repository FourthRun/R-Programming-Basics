library(tidyverse)
library(rvest)

mtcars_t <- rownames_to_column(mtcars, var = "model") %>% 
  as_tibble() %>% 
  print(n = 3)

cars <- mtcars_t %>% 
  select(model:hp, wt, am)

cars %>% mutate(disp_cc = cars$disp * 16.4, type = case_when(disp_cc < 1000 ~ "Compact", 
                                                        disp_cc < 1500 ~ "Small", 
                                                        disp_cc < 2000 ~ "Midsize", 
                                                        TRUE ~ "Large")) %>% 
  select(-disp)

cars %>% filter(am == 1 && cyl == 8) %>% 
  select(model, mpg, disp_cc, type)

cars %>% 
  group_by(cyl) %>% 
  summarize(n = n(), mpg = mean(mpg), disp_cc = mean(disp_cc), hp = mean(hp), wt = mean(wt))


# 3
n <- 10; m <- 5
air <- airquality %>% slice_sample(n = n + m)
air_1 <- slice_head(air, n = n); air_1

# 4
df <- tibble("item" = c("A", "B", "C"), Park = c(14, 12, 4), Lee = c(21, 16, 8), Kim = c(15, 5, 10))
df

df %>% summarise(across(where(is.numeric), sum))

df %>% rowwise(item) %>% 
  mutate(total = sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(Park:Kim, ~ .x/total))
