library(tidyverse)

# Read in the data.  Do some cleaning/verification
MaxTemp <- read.csv('https://raw.githubusercontent.com/dereksonderegger/444/master/data-raw/FlagMaxTemp.csv',
                    na.strings=c('',' ')) %>%
  gather('DOM', 'MaxTemp', X1:X31) %>%
  drop_na() %>%
  mutate(MaxTemp = as.numeric(MaxTemp)) %>%
  mutate(DOM  = str_remove(DOM, fixed('X')) ) %>%
  mutate(Date = lubridate::ymd( paste( Year, Month, DOM )) ) %>%
  select(Date, MaxTemp)
