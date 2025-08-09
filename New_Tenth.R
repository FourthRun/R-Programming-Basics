library(tidyverse)
p1 <- ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point()
p1

mpg %>% 
  filter(cty > 30) %>% 
  select(manufacturer, model, cty)

p1 +
  geom_text(data = filter(mpg, cty > 30), aes(label = paste(manufacturer, model)))

p1 +
  geom_text(data = filter(mpg, cty > 30), aes(label = paste(manufacturer, model)), nudge_x = 0.5, nudge_y = 1)

p1 +
  geom_text(data = filter(mpg, cty > 30), aes(label = paste(manufacturer, model)), hjust = "left", vjust = "top")

p2 <- ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

p2 +
  geom_text(data = filter(mpg, hwy > 40),
            aes(label = paste(manufacturer, model)),
            hjust = "left", vjust = "top")

p2 +
  geom_text(data = filter(mpg, hwy > 40),
            aes(label = paste(manufacturer, model)),
            hjust = "left", vjust = "top",
            check_overlap = TRUE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(aes(color = "lm"),
              method = "lm",  se = FALSE, size = 1.2) +
  geom_smooth(aes(color = "loess"),
              method = "loess", se = FALSE, size = 1.2) +
  labs(x = "Engine displacement", y = "Highway MPG", color = NULL, title = "Scatter plot with regression lines") + # color = NULL 유뮤의 차이점은?
  theme(legend.position = "bottom") # 범례의 위치 조정


mpg %>% 