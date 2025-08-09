library(tidyverse)
# 2-1-1
x <- c(17, 16, 20, 24, 22, 15, 21, 18)

# 2-1-2
x[length(x)]

# 2-2-1
y <- c(10.4, 5.6, 3.1, 6.4, 9.6, 7.8)

# 2-2-2
y[length(y - 1)]

# 2-3-1
grade <- c("1st", "1st", "2nd", "3rd", "2nd", "3rd", "1st")
grade_f <- as.factor(grade)

# 2-3-2
factor(grade, order = TRUE, level = c("3rd", "2nd", "1st"))

# 2-4-1

# 4-1-1
air_sub1 <- as_tibble(airquality) %>% 
  filter(Wind >= mean(Wind) & Temp < mean(Temp)) %>% 
  select(Ozone, Solar.R, Month)
air_sub1

# 4-1-2
air_sub2 <- airquality %>% 
  filter(Wind < mean(Wind) & Temp >= mean(Temp)) %>% 
  select(Ozone, Solar.R, Month)
air_sub2

# 4-1-3
air_sub1 %>% summarise(n = n(), m_oz = mean(Ozone, na.rm = TRUE), m_solar = mean(Solar.R, na.rm = TRUE))

air_sub2 %>% summarise(n = n(), m_oz = mean(Ozone, na.rm = TRUE), m_solar = mean(Solar.R, na.rm = TRUE))

# 4-1-4
air_sub1 %>% group_by(Month, .add = TRUE) %>% 
  summarise(n = n(), m_oz = mean(Ozone, na.rm = TRUE), m_solar = mean(Solar.R, na.rm = TRUE))

air_sub2 %>% group_by(Month, .add = TRUE) %>% 
  summarise(n = n(), m_oz = mean(Ozone, na.rm = TRUE), m_solar = mean(Solar.R, na.rm = TRUE))


# 4-2-1
mtcars_t <- mtcars %>% 
  rownames_to_column(var = "model") %>%
  as_tibble %>% 
  print(n = 3)

# 4-2-2
cars <- as_tibble(mtcars_t) %>% 
  select(1:5, 7, 10)
cars

# 4-2-3
cars %>% 
  mutate(disp_cc = 16.4 * disp) %>%
  select(-4)

# 4-2-4
cars %>% 
  mutate(disp_cc = 16.4 * disp,
         type = case_when(
           disp_cc < 1000 ~ "Compact",
           disp_cc < 1500 ~ "Small",
           disp_cc < 2000 ~ "Midsize",
           TRUE ~ "Large")) %>% 
  print(n = 3)

# 4-2-5
cars %>% 
  mutate(disp_cc = 16.4 * disp,
         type = case_when(
           disp_cc < 1000 ~ "Compact",
           disp_cc < 1500 ~ "Small",
           disp_cc < 2000 ~ "Midsize",
           TRUE ~ "Large")) %>% 
  filter(am == 1 & cyl == 8) %>% 
  select(model, mpg, disp_cc, type)

# 4-2-6
cars %>% 
  mutate(disp_cc = 16.4 * disp,
         type = case_when(
           disp_cc < 1000 ~ "Compact",
           disp_cc < 1500 ~ "Small",
           disp_cc < 2000 ~ "Midsize",
           TRUE ~ "Large")) %>% 
  group_by(cyl) %>% 
  summarise(n = n(), across(c(2, 7, 4:5), mean)) %>% 
  print(n = 3)


# 온라인 교과서
# 5-1
p1 <- airquality %>% 
  filter(is.na(Ozone) | is.na(Solar.R))

p1 <-  ggplot(p1, aes(x = Month))

p1 + geom_bar() +
  ylab(NULL)

# 5-2
p2 <- airquality %>% 
  filter(Month != 6)

p2 <- ggplot(p2, aes(x = Solar.R, y = Ozone))

p2 +  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(vars(Month), scales = "free")
