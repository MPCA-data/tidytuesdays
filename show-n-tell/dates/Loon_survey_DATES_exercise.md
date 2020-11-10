Loon survey 2021
================

![](https://abcbirds.org/wp-content/uploads/2020/03/common-loon-for-blog.jpg)

### *Working with dates and times*

<br>

> **Objective**
> 
> Great news. The DNR has invited us to help put on a statewide loon
> survey. There will be 3 survey locations: Bemidji, Minneapolis, and
> Ely. Good luck!

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
first_tuesday <- ymd('2021-05-04')  # StarWars day

bemidji_tuesdays <- seq(...
```

<br>

> **How many survey dates are at each site?**
> 
> *Hint: It should be more than 20.*

<br>
<br>

Congrats\! Your schedule worked perfectly. Now let’s take a look at the
survey results.

<br>

## 2. A missing site

<br>

> **Load the loon data.**

``` r
loons <- read_csv("https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/show-n-tell/dates/loon_survey_fake_data.csv")   
```
<br>

*Explore a bit.*

<br>

It looks like we have a slight missing data problem.

There’s a data point in the results that wasn’t labeled with the site
location. We do know the date however. On `2021-06-11` there were a
whopping 4 loons counted - we just don’t know where.

<br>

> **Can you determine the site based on the date of the loon count?**

``` r
mystery_site_date <- "2021-06-11"
```

<br>

> Use `ifelse()` to update the missing site name for the
> survey date `2021-06-11`.

``` r
loons <- loons %>%
         mutate(...)  
```


<br>

## The best loon month?

> **Add a `month` column to the data.**

``` r
loons <- loons %>%
         mutate(month = ...)
```

<br>

> **Which month saw the most loons across all of the sites?**

<br>

## Best time of day?

The time _(hour:minutes:seconds)_ for the start of each loon count was stored in 
a separate table. Load the survey times and join it to the loon counts by using `left_join()`.

> **Join the times to the dates.**

``` r
count_times <- read_csv("https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/show-n-tell/dates/loon_survey_fake_times.csv")

left_join(...)
```
<br>

> **View one of the specific `time` values with `count_times$time[1]`. What do you notice?

<br>

> Wups! By default, R assigned the times to UTC time. Plus, if we scroll down in the data table we see that most of the times were recorded using local Central time, but a few are in GMT time. We can fix this all up with one use of `force_tz()`.
> 
> **Use `force_tz()` to assign all times to the designated time zone in the `time_zone` column.**

``` r
loons <- loons %>%
         rowwise() %>%
         mutate(time_cdt = force_tz(...) )
```

<br>


> All times should now be shown in local CDT time.
>
> **View one of the specific `time` values again with `count_times$time_cdt[1]`. 

<br>

> **Did the GMT times change?**

<br><br>

> **Add an hour column to the data. Which hour of the day saw the most
> loons across all of the sites?**

``` r
loons <- loons %>%
         mutate(hour = ...)
```


<br><br>

## :star: Bonus 

Use the tiny function `am()` to determine whether it was
better to look for loons in the first half or the second half of the day.

<br><br>

# Great work

You showed some impressive data skills today. We’ll be in touch for *Loon Survey 2022*.

##
