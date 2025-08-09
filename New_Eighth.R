library(tidyverse)
library(rvest)

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_jitter(width = 0.4, height = 0.05)

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_jitter(width = 0.05, height = 0.4)

ggplot(diamonds) +
  geom_point(aes(x = carat, y = price))

mpg_1 <- mpg %>% 
  mutate(am = substr(trans, 1, nchar(trans) - 4)) %>% 
  filter(cyl != 5)

p_1 <- ggplot(mpg_1, aes(x = as.factor(cyl), fill = am)) +
  xlab("Number of Cylinders")

#as.facotr을 쓰는 이유 cyl은 숫자형. 숫자 그대로 그리면 숫자가 남아있음 : 지저분함. factor을 쓰면 범주가 되기 때문에 정리됨.

p_1 + geom_bar() # 디폴트 position = "stack"

p_1 <- ggplot(mpg_1, aes(x = cyl, fill = am)) +
  xlab("Number of Cylinders") 

p_1 + geom_bar()

p_1 + geom_bar(position = "dodge")

p_1 + geom_bar(position = "dodge2")

p_1 + geom_bar(position = "fill") #비율, 조건부 확률????

#boxplot 그래프 : Q(2) = median / Q(3) - (1) = IQR(자료의 퍼짐 정도) / 직선 : IQR * 1.5를 넘지 않은 마지막 관찰값 / 점 : IQR * 1.5를 넘은 관찰값

ggplot(mpg_1, aes(x = as.factor(cyl), y = hwy)) +
  geom_boxplot() +
  xlab("Number of Cylinders") #geom_boxplot에서는 as.factor 꼭 쓰기!!!
22
ggplot(mpg_1, aes(x = cyl, y = hwy)) +
  geom_boxplot() +
  xlab("Number of Cylinders") #as.facotr을 안쓰면 오류가 난다. 하나만 그려지는 이유 : 데이터를 하나의 자료로 만들어짐.

ggplot(mpg_1, aes(x = hwy, y = as.factor(cyl))) +
  geom_boxplot() +
  ylab("Number of Cylinders")

ggplot(mpg_1, aes(x = as.factor(cyl), y = hwy)) +
  geom_boxplot(aes(fill = am)) +
  xlab("Number of Cylinders")

ggplot(mpg_1, aes(x = as.factor(cyl), y = hwy)) +
  geom_boxplot(aes(fill = am)) +
  xlab("Number of Cylinders")

ggplot(mpg_1, aes(x = as.factor(cyl), y = hwy)) +
  geom_boxplot() +
  xlab("Number of Cylinders") +
  facet_wrap(vars(am))
