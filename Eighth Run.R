library(readxl)
read_excel("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data5.xlsx")

read_excel("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data5.xlsx", range = "A1:B5")

library(xlsx)
read.xlsx("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data5.xlsx", sheetIndex = 1)

library(haven)
read_sas("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data6.sas7bdat")

library(rvest)

URL <- "https://en.wikipedia.org/wiki/World_population"
web <- read_html(URL)
tbl <- html_nodes(web, "table")

length(tbl)
head(tbl)

tbl_1 <- html_table(tbl[6])
tbl_1

Xpath <- '//*[@id="mw-content-text"]/div[1]/table[5]'
node_1 <- html_nodes(web, xpath = Xpath)
tbl_1 <- html_table(node_1)
tbl_1

top_pop <- tbl_1[[1]]
names(top_pop) <- c("rank", "country", "pop", "area", "density")
str(top_pop)

pop <- top_pop$pop
pop <- gsub(",", '', pop)
mean(as.numeric(pop))

URL_2 <- "https://www.koreabaseball.com/Record/Team/Hitter/Basic1.aspx"
web_2 <- read_html(URL_2)
node_2 <- html_nodes(web_2, "table")
tbl_2 <- html_table(node_2[[1]])

Sys.setlocale("LC_ALL", "English")
tbl_2 <- html_table(node_2)[[1]]

Sys.setlocale("LC_ALL", "Korean")
tbl_2

URL_3 <- "http://lib.stat.cmu.edu/datasets/fl2000.txt"
fl2000 <- readr::read_table(URL_3, comment = "#")
print(fl2000, n = 3)

names(fl2000) <- gsub('"', '', names(fl2000))
fl2000$county <- gsub('\"', '', fl2000$county)
fl2000$technology <- gsub('\"', '', fl2000$technology)
