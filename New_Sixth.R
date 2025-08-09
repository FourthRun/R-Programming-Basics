library(tidyverse)
library(rvest)
#library(MASS) 해도 되는데, 하지마라

data(Cars93, package = "MASS")
Cars93 %>% 
  filter(Cylinders %in% c(4, 6)) %>% 
  ggplot() +
  geom_point(aes(x = Weight, y = EngineSize)) +
  facet_wrap(vars(Cylinders), ncol = 1, scales = "free")


my_plot <- mpg %>% 
  filter(cyl != 5, drv != "r") %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy))

my_plot +
  facet_grid(rows = vars(drv))

my_plot +
  facet_grid(cols = vars(cyl))

my_plot +
  facet_grid(rows = vars(drv), cols = vars(cyl))

my_plot +
  facet_grid(rows = vars(drv), cols = vars(cyl), scales = "free")

my_plot +
  facet_wrap(vars(drv, cyl), scales = "free")

airquality

air_1 <- airquality %>% 
  mutate(Wind_d = cut_number(Wind, n = 4))

air_1 %>% 
  ggplot() +
  geom_point(aes(x = Solar.R, y = Ozone)) +
  facet_wrap(vars(Wind_d))

air_1 %>% 
  ggplot() +
  geom_point(aes(x = Solar.R, y = Ozone, color = Wind_d, size = Wind_d))

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy))
ggplot(mpg) +
  geom_smooth(aes(x = displ, y = hwy))

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy))

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
