
rm(list = ls())


suppressPackageStartupMessages({
  library(tidyverse)
  library(rvest)   
  library(janitor)
})

url <- read_html("https://www.iihs.org/topics/fatality-statistics/detail/state-by-state")

table_seatbelt <- url %>% 
  html_nodes("table") %>% 
  .[[5]]

table_fatality <- url %>% 
  html_nodes("table") %>% 
  .[[1]]

seatBeltDataset <- table_seatbelt %>% 
  html_table(header=FALSE, fill=TRUE) %>% 
  filter(!row_number() %in% c(1)) %>%
  row_to_names(row_number = 1) %>% magrittr::set_colnames(c('State','StatPercent','Restrained Number', 'Restrained %','Unrestrained Number','Unrestrained %','Unknown Number','Unknown %','Total Fatal Number')) %>%
  filter(!row_number() %in% c(1)) 

str(seatBeltDataset)

seatBeltDataset <- seatBeltDataset %>%  
  mutate_at( vars(!matches('State')), str_remove_all, ',') %>%
  mutate_at( vars( !matches('State')), as.numeric)

fatalCrashTable <- table_fatality %>%
  html_table(header=FALSE, fill=TRUE) %>% 
  filter(!row_number() %in% c(1)) %>%
  row_to_names(row_number = 1) %>%
  mutate_at( vars(matches('Population')), str_remove_all, ',') %>%
  mutate_at( vars(matches('millions')), str_remove_all, ',') %>%
  mutate_at( vars( !matches('State')), as.numeric)  

merging_two <- merge(fatalCrashTable, seatBeltDataset, by = 'State')

merging_two %>% ggplot(aes(x=StatPercent, y=`Deaths per 100,000 population`)) +
  geom_point() + 
  labs(x="State Percent", y='Deaths Per 100000', title = 'Percent Seat belt to fatalities per 100000 people')  + theme(text= element_text(size =9)) 

