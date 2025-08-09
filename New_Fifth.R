library(tidyverse)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
# geom_point : 점을 찍겠다, mapping : 데이터의 값을 aes안에 연결, aes : 매핑은 aes로 시작함, setting 사용자가 일정한 값을 지정 aes 밖에서 지정

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = drv)) # shape에는 이산형 함수만 들어갈 수 있다.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv, shape = drv))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class, shape = drv, shape = drv, size = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy),color = "red")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue", shape = 21, size = 3, fill = "red", stroke = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(vars(class))

mpg %>% 
  filter(class != "2seater") %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(vars(class))

pp <- mpg %>% 
  filter(class != "2seater") %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy))

pp +
  facet_wrap(vars(class), ncol = 2)
pp +
  facet_wrap(vars(class), ncol = 2, dir = "v")
