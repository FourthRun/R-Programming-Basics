library(rvest)
url <- "https://finance.naver.com/item/main.nhn?code=208890"
read_html(url)

web <- read_html(url, encoding = "EUC-KR")
Xpath <- '//*[@id="fav_kospi"]/table'
node <- html_nodes(web, xpath = Xpath)
Sys.setlocale("LC_ALL", "English")
tbl <- html_table(node)
Sys.setlocale("LC_ALL", "Korean")
tbl[[1]]

# %>% : Shift + Ctrl + M
# x %>% f() = f(x)
# x %>% f(y) = f(x, y)
# x %>% f(y, .) = f(y, x)

mtcars_t <- as_tibble(mtcars)
mtcars_t %>% filter(mpg >= 30)

mtcars_t %>% filter(mpg >= 30) %>% filter(wt < 1.8)
mtcars_t %>% filter(mpg >= 30, wt < 1.8)

mtcars_t %>% filter(mpg <= 30, cyl %in% c(6, 8), am == 1)

mtcars_t %>%
  filter(mpg >= median(mpg), mpg <= quantile(mpg, probs = 0.75)) %>% 
  print(n = 3)

mtcars_t %>% 
  filter(between(mpg, median(mpg), quantile(mpg, probs = 0.75)))

airs <- as_tibble(airquality) %>% 
  print(n = 3)

airs %>% 
  filter(is.na(Ozone) | is.na(Solar.R)) %>% 
  print(n = 3)
