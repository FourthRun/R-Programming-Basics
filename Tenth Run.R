library(tidyverse)
iris_t <- as_tibble(iris)
iris_t %>% slice(5:10)
iris_t %>% slice(-(5:10))
iris_t %>% slice(n())
iris_t %>% slice_head(n = 3) # 앞에서 부터 셋
iris_t %>% slice_tail(n = 3) # 뒤에서 부터 셋

# 비복원 : 한 번 뽑히면 다시 안뽑힘, 복원 : 뽑혀도 다시 뽑힐 수 있음.
iris_t %>% slice_sample(n = 3) # 무작위로 셋, 비복원이 기본
iris_t %>% slice_sample(prop = 0.02, replace = TRUE) # 전체 중 2% 추출, 복원으로 지정

iris_t %>% slice_max(Sepal.Width, n = 2) # Sepal.width의 값이 가장 큰 2개
iris_t %>% slice_min(Petal.Length, n = 2) # Petal.Length의 값이 가장 작은 2개

mtcars_t <- as_tibble(mtcars)
mtcars_t %>% arrange(mpg) %>%
  print(n = 3) # mpg를 기준으로 재배열(오름차순이 기본)

mtcars_t %>% arrange(mpg, desc(wt)) %>%
  print(n = 3)

airquality_t <- as_tibble(airquality)
airquality_t %>% filter(Month == 5, Day <= 10) %>%
  arrange(Ozone)

airquality_t %>% arrange(!is.na(Ozone)) # 결측값을 가진 케이스가 우선 순위

airquality_t %>% filter(Month == 5, Day <= 10) %>%
  arrange(!is.na(Ozone), desc(Ozone))

df1 <- tibble(id = rep(1:3, times = 2:4), x1 = c(1:2, 1:3, 1:4))
df1

df1 %>% distinct(id, .keep_all = TRUE)
df1 %>% arrange(id, desc(x1)) %>% 
  distinct(id, .keep_all = TRUE)

df2 <- tibble(id = rep(1:3, each = 2), x1 = c(2, 2, 3, 1, 4, 4))
df2 %>% distinct()

mtcars_t <- mtcars %>%
  rownames_to_column(var = "row.name") %>% 
  as_tibble()

mtcars_t %>% select(1:3, 7) # select의 ,는 filter의 ,와다르다.
mtcars_t %>% select(row.name : cyl, wt)

mtcars_t %>% select(!c(1:3, 7))
mtcars_t %>% select(1:3, -1)
# select(1:3, -1) : 1, 2, 3에서 1 제외 (2, 3)
# select(1:3, !1) : 1, 2, 3과 1을 제외한 나머지의 합집합 -> 전체
mtcars_t %>% select(-c(1:3, 7))

mpg %>% print(n = 3)
mpg %>% select(where(is.numeric))
mpg %>% select(where(is.numeric)|where(is.character))

mtcars_t %>% select(1, last_col())
mtcars_t %>% select(starts_with("m"))
mtcars_t %>% select(ends_with("p"))                    
mtcars_t %>% select(contains("A")) #소문자 대문자 구분 X
mtcars_t %>% select(contains("A", ignore.case = FALSE)) #소문자 대문자 구분 O

vars <- c("model", "mpg", "wt")
mtcars_t %>% select(any_of(vars))
mtcars_t %>% select(all_of(vars)) #mtcars_t에 model이 없기 때문에 실행 안됨)

mtcars_t %>% select(where(is.numeric) & contains("C"))
mtcars_t %>% select(where(is.numeric) | contains("C"))
mtcars_t %>% select(where(is.numeric), contains("C"))

mtcars_t %>% pull()
mtcars_t %>% pull(var = 3)
mtcars_t %>% pull(var = am)

mtcars_t <- mtcars %>%
  rownames_to_column(var = "row.name") %>% 
  as_tibble()
mtcars_t %>% select(model = row.name) #select(model = 1)도 똑같은 결과 값
mtcars_t %>% select(model = row.name, everything())
mtcars_t %>% rename(model = row.name)

mtcars_t %>% rename_with(toupper) #변수 이름 모두 대문자로 만들기
mtcars_t %>% rename_with(toupper, contains("a")) #소문자 a가 들어있는 변수 이름 모두 대문자로 변경

iris_t <- as_tibble(iris)
iris_t %>% relocate(Species)
iris_t %>% relocate(ends_with("th"), .after = Species)
iris_t %>% relocate(ends_with("th"), .after = last_col())
