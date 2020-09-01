library(dplyr)
library(tidyr)


# Generate demo data
two_years <- seq(as.Date("2018-09-02"), 
                 as.Date("2020-08-01"), 1)

wildfires <- tibble(erupt_id   = 1:10,
                    erupt_date = sample(two_years, 20))

monitor_times <- tibble(mon_id     = rep(1:3, 4),
                        start_date = sample(two_years, 12),
                        end_date   = start_date + 6)

# Add list of monitoring dates as a column

## This WONT work!
monitor_times <- monitor_times %>%
                 rowwise() %>%    # Only look at 1 row at a time
                 mutate(date_window = seq(start_date, end_date, 1))

## This will
## ADD list() around seq()
monitor_times <- monitor_times %>%
                 rowwise() %>%
                 mutate(date_window = seq(start_date, end_date, 1) %>% list())

