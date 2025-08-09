library(tidyverse)
#library(readr)
read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_1.txt", col_types = "dcd")

read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_2.txt", col_names = FALSE)
read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_2.txt", col_names = c("age", "gender", "income"))

read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_3.txt", comment = "#")
read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_3.txt", skip = 3)

read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_4.txt", na = ".")
read_table("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data2_4.txt", na = c(".", "NA"))

read_csv("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data3_1.txt")

read_csv("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data3_2.txt", col_names = FALSE, col_types = "dcd", comment = "#", na = c(".", "NA"))

read_fwf("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data4.txt", col_positions = fwf_widths(widths = c(2, 1, 4), col_names = c("age", "gender", "income")))
read_fwf("C:/Users/sungsu/Desktop/Hanshin University/2-1/R/data4.txt", col_positions = fwf_positions(start = c(1, 3, 4), end = c(2, 3, 7), col_names = c("age", "gender", "income")))

write_delim(women, "C:/Users/sungsu/Desktop/Hanshin University/2-1/R/women.txt")
write_csv(women, "C:/Users/sungsu/Desktop/Hanshin University/2-1/R/women.csv")
write_tsv(women, "C:/Users/sungsu/Desktop/Hanshin University/2-1/R/women.tsv")
