## code to prepare `DATASET` dataset goes here

tabs <- tabulizer::extract_tables("https://www.americanforests.org/wp-content/uploads/2018/09/American-Forests-Champion-Tree-Register-Updated-Jan-2019.pdf")

library(tidyverse)
trees <- do.call(bind_rows, lapply(tabs, function(x) {
  x %>%
    as.data.frame(stringsAsFactors = FALSE) %>%
    select_if(~ any(.x != "")) %>%
    set_names(paste0("X", 1:ncol(.)))
})) %>%
  slice(-(1:3)) %>%
  set_names(c("id", "status", "species", "common_name", "scientific_name", "year_nominated", "circumference", "height", "spread", "total_points", "state", "location"))
write.csv(trees, "data-raw/champions.csv", row.names = FALSE, na = "")


## after the fact
readLines("data-raw/champions.csv") %>% gsub("[^A-z0-9,'\"\\. \\();-]", "", x = .) %>% writeLines("data-raw/champions.csv")
champions <- read.csv("data-raw/champions.csv")

usethis::use_data(champions)
