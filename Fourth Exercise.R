# 1-1
data(barley, package = "lattice")

ggplot(barley, aes(x = yield, y = variety)) +
  geom_point(aes(color = year)) +
  facet_wrap(vars(site))

# 1-2
ggplot(barley, aes(x = yield, y = variety)) +
  geom_point(aes(shape = year, color = site))

# 1-3
barley %>% 
  group_by(variety) %>% 
  summarise(mean_yield = mean(yield)) %>% 
  arrange(desc(mean_yield))


# 2-1
mpg %>% 
  group_by(fl) %>% 
  tally()

# 2-2
p3 <- mpg %>%
  filter(fl %in% c("p", "r"))

ggplot(p3) + geom_bar(aes(x = fl, y = after_stat(prop), group = 1))

# 2-3
p3 %>%
  count(trans)

# 2-4
p4 <- p3 %>% 
  mutate(am = substr(trans, 1, nchar(trans)-4))

ggplot(p4, aes(x = fl, fill = am)) +
  geom_bar(position = "fill")

# 2-5
ggplot(p4, aes(x = fl, y = hwy)) +
  geom_boxplot()


# 2-6
ggplot(p4, aes(x = hwy, y = fl)) +
  geom_boxplot() +
  facet_wrap(vars(am), ncol = 1)


# 3-1
airquality %>% 
  mutate(Missing = is.na(Ozone)) %>% 
  ggplot(aes(x = Month, fill = Missing)) +
  geom_bar(position = "fill") +
  ylab("Proportion of missing data")

# 3-2
airquality %>% 
  group_by(Month) %>% 
  summarise(m.oz = mean(Ozone, na.rm = TRUE)) %>% 
  ggplot(aes(x = Month, y = m.oz)) +
  geom_bar(stat = "identity", fill = "steelblue")

# 3-3
airquality %>% 
  mutate(wind_gp = if_else(Wind >= mean(Wind),
                           "High Wind", "Low Wind"),
         temp_gp = if_else(Temp >= mean(Temp),
                           "High Temp", "Low Temp")) %>% 
  ggplot(aes(x = Solar.R, y = Ozone)) +
  geom_point() +
  facet_grid(row = vars(wind_gp), cols = vars(temp_gp))


# 4-1
mtcars_t <- mtcars %>% 
  rownames_to_column(var = "model") %>% 
  as_tibble() %>% 
  select(model, mpg, disp, wt) %>%
  arrange(mpg, desc(disp)) %>% 
  print(n = 5)

# 4-2-1
p1 <- mtcars_t %>% 
  mutate(gp_wt = if_else(wt >= median(wt), 
                         "Heavy", "Not heavy")) %>% 
  ggplot(aes(x = disp, y = mpg))

p1 + geom_point(aes(color = gp_wt), size = 2) +
  geom_smooth(aes(color = gp_wt), method = "lm", se = FALSE)

# 4-2-2
p1 + geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(vars(gp_wt))


# 5-1
mpg_1 <- mpg %>% 
  filter(cyl == 4) %>% 
  mutate(year = as.factor(year)) %>% 
  select(model, year, displ, cty, hwy) %>% 
  arrange(year, desc(displ), cty) %>% 
  print(n = 5)

# 5-2
mpg_1 %>% 
  mutate(gp_displ = if_else(displ >= 2.0,
                            "Large", "Small")) %>% 
  ggplot(aes(x = cty, y = hwy)) +
  geom_jitter(aes(color = gp_displ)) +
  facet_wrap(vars(year), ncol = 1) +
  labs(color = "Displacement \nGroup", "cty", "hwy")

# 5-3
mpg_1 %>% 
  mutate(gp_displ = if_else(displ >= 2.0,
                            "Large", "Small")) %>% 
  ggplot(aes(x = gp_displ, y = hwy)) +
  geom_boxplot() +
  facet_wrap(vars(year))
