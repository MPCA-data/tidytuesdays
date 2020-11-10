Loon survey 2021
================

![](https://abcbirds.org/wp-content/uploads/2020/03/common-loon-for-blog.jpg)

### *Working with dates and times*

<br>

> **Objective**
> 
> Great news\! The DNR invited us to help put on a statewide loon
> survey. There will be 3 survey locations: Bemidji, Minneapolis, and
> Ely. Good luck.

<br>

We want to perform a loon count once a week from the months of May to
October for the year 2021. You can generate the full list of dates
during this time span using the sequence function `seq()`.

<br>

> Try running the code below and store the result to `survey_window`.

``` r
library(tidyverse)
library(lubridate)

start_date <- ymd("2021-05-01")

end_date   <- ymd("2021-10-31")

seq(start_date, end_date, by = 1) # Sequence from start to end by 1 day
```

<br>

## 1. Scheduling weekdays

![](https://cdn.iconscout.com/icon/free/png-128/calendar-1562-518053.png)

You are in charge of creating a schedule for each location. Here are the
weekdays the volunteers are available at each of the locations:

  - Bemidji: `Tuesdays`
  - Minneapolis: `Fridays`
  - Ely: `Thursdays`

Use the `seq()` function and the assumption that each week has 7 days to
generate the survey dates for each site. You will want to use a new
`seq()` function for each site.

<br>

To kick things off - the first Tuesday in May of 2021 is `'2021-05-04'`.

``` r
first_tues <- ymd('2021-05-04')  # StarWars day

all_bemidji_tues <- #seq(...
```

<br>

> Congrats\! Your schedule worked perfectly. Now let’s take a look at the
survey results.

<br>

## 2. A missing site

Oh no. We have a data problem.

There’s a data point in the results that wasn’t labeled with the site
location. We do know the date however. On `2021-06-12` there were a
whopping 12 loons counted - we just don’t know where.

<br>

> **Can you determine the site based on the date of the loon count?**

``` r
mystery_site_date <- "2021-06-11"
```

<br>

> Load the loon data below and update the missing site name for the
> result recorded on
`2021-06-11`.

``` r
loonies <- read_csv("loon_survey_fake_data.csv")  # Not the Canadian coin
```

<br>

## The best loon month?

> **Add a `month` column to the data.**

``` r
loonies <- loonies %>%
           #mutate(month = ...)
```

<br>

> **Which month saw the most loons across all of the sites?**

<br>

## Best time of day?

The time of each loon count was stored in a separate table. Load the
time data and join it to the loon counts using `left_join()`.

> **Join the times to the dates.**

``` r
count_times <- read_csv("loon_survey_fake_times.csv")
```

<br>

> **Darn. Some people recorded times using local Central time, but
> others used GMT time. Use `with_tz()` to convert all times to local
> Central Time (“America/Chicago”).**

``` r
loonies <- loonies %>%
           #mutate(time_fix = ...)
```

<br>

> **Add an hour column to the data. Which hour of the day saw the most
> loons across all of the sites?**

<br>

## :star: Bonus :star:

> **Use the tiny functions `am()` or `pm()` to determine whether it is
> better to look for loons in the first half or the second half of the
> day.**

<br><br>

# Great work\!

You showed some impressive data skills today. We’ll be in touch for *Loon Survey 2022*. Stay tuned\!

##
