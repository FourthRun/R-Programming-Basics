library(tidyverse)
library(rvest)

df1 <- tibble(x = 1:2, y = 3:4, z = 5:6)
df1 %>% rowwise()

df1 %>% 
  rowwise() %>% 
  mutate(total = sum(c(x, y, z)))

df1 %>% 
  mutate(total = sum(c(x, y, z))) #rowwise()가 없으면 전체의 원소를 더한 값이 적용된다.

df2 <- tibble(id = 1 : 3, w = 10 : 12, x = 20 : 22, y = 30 : 32, z = 40 : 42)

df2 %>% 
  rowwise() %>% 
  summarise(total = sum(c_across(where(is.numeric))))

df2 %>% 
  rowwise(id) %>% 
  mutate(total = sum(c_across(where(is.numeric))))

df2 %>% 
  rowwise(id) %>% 
  mutate(total = sum(c_across(where(is.numeric)))) %>%
           ungroup() %>% 
           mutate(across(w:z, ~ .x/ total))
