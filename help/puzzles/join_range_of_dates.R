# How do I find if a wildfire happened during one of the monitoring times?

# I want to join the wildfire dates to the monitoring table, but the monitoring dates
# are a range: a start and an end date. I want to know if a fire occurred on any of the 
# days in that window.

library(dplyr)
library(tidyr)


# Some demo data
two_years <- seq(as.Date("2018-08-01"), 
                 as.Date("2020-08-01"), 1)

wildfires <- tibble(erupt_id   = 1:20,
                    erupt_date = sample(two_years, 20))

monitor_times <- tibble(mon_id     = rep(1:3, 4),
                        start_date = sample(two_years, 12),
                        end_date   = start_date + 6)

# Add list of monitoring dates as a column

## This WONT work
monitor_times <- monitor_times %>%
                 rowwise() %>%    # Only look at 1 row at a time
                 mutate(date_window = seq(start_date, end_date, 1))

## This will work
## ADD list() around seq()
monitor_times <- monitor_times %>%
                 rowwise() %>%
                 mutate(date_window = seq(start_date, end_date, 1) %>% list())

