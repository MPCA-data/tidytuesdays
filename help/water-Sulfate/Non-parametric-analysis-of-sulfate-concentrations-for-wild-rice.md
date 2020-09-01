Non-parametric analysis of sulfate concentrations for wild rice
================
Allison Gamble, Barbara Monaco, Derek Nagel
8/11/2020

## Introduction

A wild rice water is considered impaired if the average annual sulfate
concentration exceeds, with statistical significance, the state water
quality standard. A wild rice water is considered fully supporting if
the average meets, with statistical significance, the standard.
Assessments require data sets of at least 10 independent observations
that give an unbiased representation of overall conditions through the
year. Determinations of statistical significance are made at an 80
percent confidence level, using the Kaplan-Meier estimator and a
boot-strapped confidence interval.

## Nonparametric - Why and When

Non-parametric methods are statistical methods that do not rely on
assumptions built on known distributions (i.e. parametric methods). By
making very few assumptions regarding the data, they often will lack
power but will also be more unbiased and can be used on a vast variety
of data.

In situations where the distribution is unknown, or varied from group to
group, such as the sulfate concentrations, by utilizing non-parametric
techniques, there is no need to transform, or make otherwise erroneous
assumptions about the data.

``` r
#install.packages(c("tidyverse", "skimr", "janitor", "lubridate", "plotly", "glue", "magrittr", "EnvStats", "data.table"))

library(tidyverse)
library(skimr)
library(janitor)
library(lubridate)
library(plotly)
library(glue)
library(magrittr)
library(EnvStats)
library(data.table)

#read in data
sulfate <- read_csv("https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv")
```

    ## Warning: 20 parsing failures.
    ##  row         col               expected   actual                                                                                                                    file
    ## 1449 SAMPLE_DATE no trailing characters /20/2015 'https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv'
    ## 1449 date        no trailing characters /20/2015 'https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv'
    ## 1450 SAMPLE_DATE no trailing characters /29/2015 'https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv'
    ## 1450 date        no trailing characters /29/2015 'https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv'
    ## 1451 SAMPLE_DATE no trailing characters /14/2015 'https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/help/water-Sulfate/sulfate_per_wid_with_min10_obs.csv'
    ## .... ........... ...................... ........ .......................................................................................................................
    ## See problems(...) for more details.

``` r
#use skim for overview of data
skim(sulfate)
```

|                                                  |         |
| :----------------------------------------------- | :------ |
| Name                                             | sulfate |
| Number of rows                                   | 11436   |
| Number of columns                                | 27      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |         |
| Column type frequency:                           |         |
| character                                        | 16      |
| numeric                                          | 11      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |         |
| Group variables                                  | None    |

Data summary

**Variable type: character**

| skim\_variable         | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :--------------------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| SYS\_LOC\_CODE         |          0 |           1.00 |   8 |  14 |     0 |      1011 |          0 |
| SAMPLE\_TYPE\_CODE     |          0 |           1.00 |   6 |   6 |     0 |         1 |          0 |
| STREAM\_CODE           |          0 |           1.00 |  10 |  12 |     0 |       670 |          0 |
| ANALYTIC\_METHOD       |          0 |           1.00 |   3 |  11 |     0 |         4 |          0 |
| FRACTION               |          0 |           1.00 |   5 |   9 |     0 |         2 |          0 |
| DETECT\_FLAG           |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| CHEMICAL\_NAME         |          0 |           1.00 |   7 |   7 |     0 |         1 |          0 |
| RESULT\_UNIT           |          2 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| DETECTION\_LIMIT\_UNIT |        851 |           0.93 |   4 |   4 |     0 |         1 |          0 |
| LOC\_COUNTY\_CODE      |         33 |           1.00 |   4 |  17 |     0 |        85 |          0 |
| SAMPLE\_METHOD         |          0 |           1.00 |   1 |   9 |     0 |         7 |          0 |
| LOC\_DESC              |          5 |           1.00 |   3 | 168 |     0 |       953 |          0 |
| VALUE\_TYPE            |        453 |           0.96 |   6 |   9 |     0 |         2 |          0 |
| month\_name            |          0 |           1.00 |   3 |   9 |     0 |        12 |          0 |
| WID                    |          0 |           1.00 |  10 |  12 |     0 |       670 |          0 |
| HUC 8                  |          6 |           1.00 |   8 |   8 |     0 |        80 |          0 |

**Variable type: numeric**

| skim\_variable              | n\_missing | complete\_rate |       mean |         sd |         p0 |        p25 |        p50 |        p75 |        p100 | hist  |
| :-------------------------- | ---------: | -------------: | ---------: | ---------: | ---------: | ---------: | ---------: | ---------: | ----------: | :---- |
| SAMPLE\_DATE                |         10 |           1.00 |   41752.21 |     935.24 |   40087.00 |   41043.00 |   41813.00 |   42487.00 |    43732.00 | ▆▆▇▅▂ |
| REPORT\_RESULT\_VALUE       |          0 |           1.00 |      65.21 |     156.79 |       0.15 |       3.00 |      12.20 |      65.60 |     4950.00 | ▇▁▁▁▁ |
| METHOD\_DETECTION\_LIMIT    |       4181 |           0.63 |       0.48 |       0.84 |       0.02 |       0.15 |       0.17 |       0.25 |        5.00 | ▇▁▁▁▁ |
| REPORTING\_DETECTION\_LIMIT |       1360 |           0.88 |       4.12 |      15.47 |       0.02 |       0.50 |       1.00 |       3.00 |      375.00 | ▇▁▁▁▁ |
| RESULT\_NUMERIC             |       1909 |           0.83 |      77.73 |     169.03 |       0.15 |       5.41 |      20.20 |      85.10 |     4950.00 | ▇▁▁▁▁ |
| LOC\_MAJOR\_BASIN           |          0 |           1.00 | 7357432.10 | 1427399.39 | 4010101.00 | 7010203.00 | 7020010.00 | 9020108.00 | 10230003.00 | ▁▁▇▁▃ |
| LONGITUDE                   |          0 |           1.00 |    \-93.97 |       1.57 |    \-97.24 |    \-95.11 |    \-93.71 |    \-92.88 |     \-89.97 | ▃▅▇▅▁ |
| LATITUDE                    |          0 |           1.00 |      46.11 |       1.51 |      43.50 |      44.83 |      45.95 |      47.46 |       48.98 | ▆▇▃▇▅ |
| date                        |         10 |           1.00 |   41752.21 |     935.24 |   40087.00 |   41043.00 |   41813.00 |   42487.00 |    43732.00 | ▆▆▇▅▂ |
| year                        |          0 |           1.00 |    2013.78 |       2.56 |    2009.00 |    2012.00 |    2014.00 |    2016.00 |     2019.00 | ▆▆▇▅▂ |
| month                       |          0 |           1.00 |       6.90 |       2.06 |       1.00 |       5.00 |       7.00 |       8.00 |       12.00 | ▁▅▇▇▂ |

``` r
#clean column names
sulfate <- clean_names(sulfate)

sulfate <- mutate(sulfate,
                  #convert integer date to r date object
                  sample_date = as_date(sample_date, ymd(19000101)),
                  #convert detect_flag to logical
                  detect_flag = detect_flag == "Y",
                  cens = !detect_flag,
                  #set censoring level to mdl or rdl, whichever is higher
                  cens_level = pmax(method_detection_limit, 
                                    reporting_detection_limit, na.rm = T))

#check for any non detects without a censoring level
filter(sulfate, !detect_flag, is.na(cens_level))
```

    ## # A tibble: 0 x 29
    ## # ... with 29 variables: sys_loc_code <chr>, sample_date <date>,
    ## #   sample_type_code <chr>, stream_code <chr>, analytic_method <chr>,
    ## #   fraction <chr>, report_result_value <dbl>, detect_flag <lgl>,
    ## #   chemical_name <chr>, method_detection_limit <dbl>,
    ## #   reporting_detection_limit <dbl>, result_numeric <dbl>, result_unit <chr>,
    ## #   detection_limit_unit <chr>, loc_county_code <chr>, sample_method <chr>,
    ## #   loc_major_basin <dbl>, loc_desc <chr>, value_type <chr>, longitude <dbl>,
    ## #   latitude <dbl>, date <dbl>, year <dbl>, month <dbl>, month_name <chr>,
    ## #   wid <chr>, huc_8 <chr>, cens <lgl>, cens_level <dbl>

``` r
#get sample counts for each stream code
sample_counts <- sulfate %>% group_by(stream_code) %>% summarise(n())
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
sample_counts %>% head()
```

    ## # A tibble: 6 x 2
    ##   stream_code `n()`
    ##   <chr>       <int>
    ## 1 01-0033-00     10
    ## 2 01-0069-00     10
    ## 3 01-0070-00     10
    ## 4 01-0072-00     10
    ## 5 01-0074-00     10
    ## 6 01-0087-00     10

``` r
#create plotly widget to view data
plot_ly(sulfate, x = ~sample_date, y = ~report_result_value) %>%
  add_markers(hoverinfo = "text",
              color = ~detect_flag,
              colors = c("orange", "blue"),
              text = ~glue("Stream Code: {stream_code}
                           Sample date: {sample_date}
                           Result: {report_result_value} {result_unit}"))
```

    ## Warning: `arrange_()` is deprecated as of dplyr 0.7.0.
    ## Please use `arrange()` instead.
    ## See vignette('programming') for more help
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_warnings()` to see where this warning was generated.

    ## Warning: Ignoring 10 observations

<!--html_preserve-->

<div id="htmlwidget-e6eb7ea4085b676d30bd" class="plotly html-widget" style="width:672px;height:480px;">

</div>


<!--/html_preserve-->

## Methods

`enparCensored` - Estimate the mean, standard deviation, and standard
error of the mean nonparametrically given a sample of data from a
positive-valued distribution that has been subjected to left- or
right-censoring, and optionally construct a confidence interval for the
mean.

It can be shown that the mean of a positive-valued distribution is equal
to the area under the survival curve (Klein and Moeschberger, 2003,
p.33):

\(\mu = \int\limits_{0}^{\infty}[1 -F(t)]dt = \int_{0}^{\infty}S(t)dt\)

where \(F(t)\) denotes the cumulative distribution function evaluated at
\(t\) and \(S(t) = 1−F(t)\) denotes the survival function evaluated at
\(t\). When the Kaplan-Meier estimator is used to construct the survival
function, you can use the area under this curve to estimate the mean of
the distribution, and the estimator can be as efficient or more
efficient than parametric estimators of the mean (Meier, 2004; Helsel,
2012; Lee and Wang, 2003). Let \(\hat{F}(t)\) denote the Kaplan-Meier
estimator of the empirical cumulative distribution function (ecdf)
evaluated at \(t\), and let \(\hat{S}(t) = 1 − \hat{F}(t)\) denote the
estimated survival function evaluated at \(t\).

**Kaplan Meier empirical distribution function (EDF)**

Empirical distribution functions (EDF) plot the sample percentiles for
each observation in the data set by ranking them from lowest to highest
and are estimations of the true cumulative distribution function (CDF)
of the population.

The Kaplan Meier method places each non‐detect at its reporting limit
prior to ranking and assigns the smallest rank possible in the case of
ties. This allows us to account for censored observations in the
creation of the EDF. However, if all data are censored or the same value
then no EDF can be determined as the Kaplan Meier relies on the number
of observations lower than each detected value. (Helsel, 2012)

**Bootstrapping**

Bootstrapping is any test or metric that uses random sampling with
replacement, and falls under the broader class of resampling methods.
Bootstrapping assigns measures of accuracy (bias, variance, confidence
intervals, prediction error, etc.) to sample estimates. This technique
allows estimation of the sampling distribution of almost any statistic
using random sampling methods.

Bootstrapping estimates the properties of an estimator (such as its
variance) by measuring those properties when sampling from an
approximating distribution. One standard choice for an approximating
distribution is the empirical distribution function of the observed
data. In the case where a set of observations can be assumed to be from
an independent and identically distributed population, this can be
implemented by constructing a number of resamples with replacement, of
the observed data set (and of equal size to the observed data set).

``` r
#set number of bootstrap samples
n_bootstrap <- 100

#set seed for reproducability
set.seed(20200317)

stream_summary <- sulfate %>% group_by(stream_code) %>%
  #Use group_modify instead of summarize since we want to extract 2 values
  #out of bootstrap samples (ci_lower and ci_upper)
  group_modify(~tibble(unique_vals = .x %$% uniqueN(report_result_value[!cens]),
                       pct_censored = .x %$% mean(cens),
                       mean = .x %$% if(unique_vals < 2) NA else
                         if (all(detect_flag)) mean(report_result_value) else
                           enparCensored(report_result_value, 
                                         !detect_flag)$parameters["mean"],
                       #if the mean is NA, the ucl should be as well
                       ci95 = .x %$% if(is.na(mean)) NA else {
                         #repeat sampling n times
                         n = length(cens)
                         replicate(n_bootstrap,
                                   #sample two distinct non-censored values as row numbers
                                   sample((1:n)[!cens & !duplicated(report_result_value * !cens)],
                                          2, replace = F) %>%
                                     #sample n-2 rows (censored or non-censored) and combine with the 2 rows
                                     #from line above
                                     c(sample(1:n, n - 2, replace = T)) %>% {
                                       #use elnormAltCensored if any values in bootstrap sample are censored
                                       if(any(cens[.]))
                                         enparCensored(report_result_value[.],
                                                       cens[.])$parameters["mean"]
                                       else
                                           #just take the mean if all values in bootstrap sample are detected
                                           mean(report_result_value[.])
                                     }
                         )} %>%
                         #create list column to get both lower and upper ci bounds
                         {tibble(ci_lower = quantile(., 0.025), 
                                 ci_upper = quantile(., 0.975)) %>% list()},
                       #find min and max value for each stream
                       min = .x %$% min(report_result_value),
                       max = .x %$% max(report_result_value),
                       #get total number of samples for each stream
                       n = nrow(.x)
  ),
  keep = T
  )
```

    ## Warning: The `keep` argument of `group_modify()` is deprecated as of dplyr 1.0.0.
    ## Please use the `.keep` argument instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_warnings()` to see where this warning was generated.