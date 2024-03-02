
rm(list = ls())

# From the NAU sub-reddit, extract the most recent threads.
# https://bookdown.org/dereksonderegger/444/data-scraping.html

#install.packages("RedditExtractoR")
library(RedditExtractoR)

Nau_sub <- find_thread_urls(subreddit = "NAU", sort_by = "new", period = "day")
View(Nau_sub)

# Tidyverse for filtering 
library(tidyverse)

# Filtering restaurant recommendations and comments
FoodPlaces <- filter(Nau_sub, grepl('campus and why', text))

# Getting specific restaurant recommendation thread comments
FoodPlacesComments <- get_thread_content(FoodPlaces)

# So apparently, the food is not that good. Shocker!
View(FoodPlacesComments$comments)
