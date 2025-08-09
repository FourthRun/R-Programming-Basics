library(tidyverse)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(se = FALSE) #se = FALSE : 비모수 회귀 곡선의 회색이 사라짐


ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(aes(group = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(data = filter(mpg, drv == "4"), se = FALSE, color = "red")

ggplot(mpg, aes(x = trans)) +
  geom_bar()
ggplot(mpg, aes(x = trans)) +
  stat_count()

ggplot(mpg) +
  geom_bar(aes(x = trans, after_stat(prop)))

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = trans, y = after_stat(prop), group = 1))

mpg_am <- mpg %>% 
  mutate(am = substr(trans, 1, nchar(trans) - 4)) %>%
  count(am)
mpg_am

ggplot(mpg_am) +
  geom_bar(aes(x = am, y = n), stat = "identity")
