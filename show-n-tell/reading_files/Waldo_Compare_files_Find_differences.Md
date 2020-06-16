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

Bigger things and subtle changes.

```r
sites_2019     <- c("Westview School",             
                    "Waseca Road",                 
                    "Voyageurs",                   
                    "Virgina City Hall",            
                    "U of M - Duluth",            
                    "U of M - Cedar Creek",         
                    "Talahi School ",               
                    "Stanton Air Field",           
                    "St. Paul Park Refinery 438",   
                    "St. Paul Park Refinery 436",   
                    "St. Michael Elementary School",
                    "St. Louis Park City Hall")

sites_2020 <- sites_2019[-9]
sites_2020[7] <- "Talahi School"


compare(sites_2019, sites_2020)
```

> Let's move on to comparing Data Frames.

[Palmer Penguins!](https://allisonhorst.github.io/palmerpenguins/)

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

Exciting! Let's share our preliminary data with our Antarctica research partners.

```r
shared_penguins <- penguins
```

Then you fix some errors in the data.

```r
# Wups! Remove a doubled measurement 
penguins[1, "culmen_length_mm"] <- penguins[1, "culmen_length_mm"] / 2

# This penguin got recorded twice, drop duplicate entry
penguins <- filter(penguins, island != "Torgersen" | body_mass_g != 3050)
```

Time flies by. A month later you notice a chart your research partner is sharing doesn't align with your results. Hmmm... Do they have the latest data?

```r
compare(penguins, shared_penguins)

```

Try flippering the order.
```r
compare(shared_penguins, penguins)

```



