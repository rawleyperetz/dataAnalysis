
rm(list = ls())

suppressPackageStartupMessages({
  library(tidyverse)
  library(rvest)   
  library(janitor)
})

url <- read_html("https://www.iihs.org/topics/fatality-statistics/detail/state-by-state")

table_selection <- url %>% 
  html_nodes("table") %>% 
  .[[1]] 

fatalCrashTable<- table_selection %>% 
    html_table(header=FALSE, fill=TRUE) %>% 
    filter(!row_number() %in% c(1)) %>%
  row_to_names(row_number = 1)
    #set_names(fatalCrashTable[1, ]) %>%
    #filter(!row_number() %in% c(1))

fatalCrashTable <- fatalCrashTable %>%  
  # mutate_at( vars(matches('Population')), str_remove_all, ',') %>%
  mutate_at( vars(!matches('State')), str_remove_all, ',') %>%
  mutate_at( vars( !matches('State')), as.numeric)  %>%
  arrange(desc(Deaths))

fatalCrashTable[is.na(fatalCrashTable)] <- 0

 fatalCrashTable %>% ggplot(aes(x=State, y=`Deaths per 100,000 population`)) +
  geom_col() + 
  labs(x=NULL, y='%Percent Change', title = 'Mortality Rate per 100000 people') + coord_flip() + theme(text= element_text(size =9)) 
  
