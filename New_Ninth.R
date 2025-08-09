library(tidyverse)

#세팅과 매핑의 정확히 차이 알아둘 것.

p <- ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

p

p + coord_cartesian(xlim = c(3,6))

p + xlim(3, 6) + xlab("Engine Displacement")

p + coord_cartesian(xlim = c(3,6)) +
  xlab("Engine Displacement")

p1 <- ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

p1

p1 + coord_flip()

p2 <- ggplot(mpg, aes(x = hwy, y = class)) +
  geom_boxplot()

p2

p2 + coord_flip()

mpg %>% 
  ggplot(aes(x = "", y = hwy)) +
  geom_boxplot() +
  xlab(NULL)

mpg %>% 
  ggplot(aes(x = hwy, y = "")) +
  geom_boxplot() +
  ylab(NULL)

b2 <- ggplot(mpg, aes(x = "", fill = class)) +
  geom_bar(width = 1) +
  labs(x = "", y = "")
# width = 1이 없어도 그래프가 만들어지긴 함.
b2 

b2 + coord_polar(theta = "y")

# 각 조각의 각도 : 막대의 높이에 비례
# 각 조각의 반지름 : 막대의 폭에 비례

b2 + coord_polar(theta = "y") +
  theme_void()

b2 + coord_polar() +
  theme_void()
