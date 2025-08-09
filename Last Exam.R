library(tidyverse)

# 1
mpg %>%
  select(where(is.character)) %>% 
  print(n = 3)

# 2
mpg %>%
  select(where(is.character)) %>% 
  mutate(across(3:6, as.factor)) %>% 
  print(n = 3)

# 3
mpg %>%
  select(where(is.character)) %>% 
  mutate(across(3:6, as.factor)) %>% 
  count(trans)

# 4
mpg %>% 
  mutate(am = case_when(
    trans %in% c("manual(m5)", "manual(m6)") ~ "Manual",
    trans %in% c("auto(l3)", "auto(l4)", "auto(l5)", "auto(l6)") ~ "Auto-T1",
    TRUE ~ "Auto-T2")) %>% 
  count(am) %>% 
  ggplot() +
  geom_bar(aes(x = am, y = n), stat = "identity", fill = "steelblue") +
  xlab("Type of transmission")

# 5-1
mpg %>% 
  mutate(am = case_when(
    trans %in% c("manual(m5)", "manual(m6)") ~ "Manual",
    trans %in% c("auto(l3)", "auto(l4)", "auto(l5)", "auto(l6)") ~ "Auto-T1",
    TRUE ~ "Auto-T2")) %>% 
  filter(cyl != 5) %>% 
  ggplot(aes(x = am, fill = as.factor(cyl))) +
  geom_bar() +
  ylab(NULL) +
  xlab("Type of transmission")

# 5-2
mpg %>% 
  mutate(am = case_when(
    trans %in% c("manual(m5)", "manual(m6)") ~ "Manual",
    trans %in% c("auto(l3)", "auto(l4)", "auto(l5)", "auto(l6)") ~ "Auto-T1",
    TRUE ~ "Auto-T2")) %>% 
  filter(cyl != 5) %>% 
  ggplot(aes(x = am, fill = as.factor(cyl))) +
  geom_bar(position = "dodge") +
  ylab(NULL) +
  xlab("Type of transmission")

# 5-3
mpg %>% 
  mutate(am = case_when(
    trans %in% c("manual(m5)", "manual(m6)") ~ "Manual",
    trans %in% c("auto(l3)", "auto(l4)", "auto(l5)", "auto(l6)") ~ "Auto-T1",
    TRUE ~ "Auto-T2")) %>% 
  filter(cyl != 5) %>% 
  ggplot() +
  geom_bar(aes(x = cyl, y = after_stat(prop), group = 1), fill = "steelblue") +
  facet_wrap(vars(am)) +
  ylab(NULL) +
  xlab("Type of transmission")
