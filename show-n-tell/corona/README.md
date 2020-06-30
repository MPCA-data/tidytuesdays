# Novel Coronavirus (COVID-19) Cases

Explore Novel Corona Virus (COVID-19) epidemiological data since 22 January 2020.

> Live map of cases   
> [![Coronavirus map](../../images/corona_map.png)](https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases)  
> https://data.humdata.org/dataset/novel-coronavirus-2019-ncov-cases 


## Load data

```r
library(tidyverse)
library(lubridate)
library(plotly)

data <- read_csv("https://github.com/nytimes/covid-19-data/raw/master/us-counties.csv")

```
