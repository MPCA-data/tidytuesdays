# Waldo
### Compare files and Find differences


![](https://compote.slate.com/images/da10c202-1283-4e22-9edf-a2a26f5880dc.jpg)


```r
library(tidyverse)

#install.packages("waldo")
library(waldo)
```


```r
old <- 4
new <- 5
compare(old, new)


apples  <- c(40, 4000)
oranges <- c(40, "4,000")
compare(apples, oranges)

fruit <- c("apple", "orange", 4) 
```

[Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/)

![](https://allisonhorst.github.io/palmerpenguins/articles/articles/img/lter_penguins.png)

```r
#install.packages("remotes")
remotes::install_github("allisonhorst/palmerpenguins")
library(palmerpenguins)
```

```r
penguins <- penguins

glimpse(penguins)

penguins %>% count(species)
```



cars[1, 1] <- 33

compare(cars, mtcars)

