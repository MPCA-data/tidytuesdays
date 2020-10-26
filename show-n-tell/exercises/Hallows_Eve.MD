# Camera... Action!

<br>

> **Grab the ketchup folks, we're making a scary movie.**
>


<img src="https://i.pinimg.com/564x/fe/9c/32/fe9c3239eb69dbc16ee4e78bd386ebc5.jpg" align="left" width="70%">

## Boo!

<img src="https://i.pinimg.com/originals/5b/4d/6b/5b4d6be9dbe61d57eacf3e467fbb4ea8.png" width="25%" align="left" >


## The DATA

> Before we get too far, let's look at past films for clues about what makes a good spooky movie.


1. Load the data

```{r}
library(tidyverse)

all_films <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-10-23/movie_profit.csv")

scary <- filter(all_films, genre == "Horror") ##But, did you get all the horror genre? The genre has lists. Use grepl to filter all movies that could possiblt be considered horror.
```

<br>

## Explore

> **We need answers. Can you find them?**

### Inspiration

Use `ggplot2` or `plotly`.

- Which film grossed the most $$$?  
- Which film made the most profit?

### Timing

Use `lubridate`.

- Which `month` is best to release our film?
- Which `day` of the month is best to release our film?

### Budget

- For most profit, should we spend: 
    - less than 1 million
    - more than 1 million
    - more than 10 million
    - or more than 100 million?

## Title

- How long should our title be?
    - Less than 3 words?
    - Between 3 and 5 words?
    - More than 5 words?
- What 3 words would most likely help our film make money?
- Create a title that includes those 3 words   
 
## Forecast 
- Predict how much money we'll make.


<br>

## BUT CANDY! DONT FORGET THE CANDY

1. Load the data

```{r load candy}

candy_data <- read_csv("https://raw.githubusercontent.com/MPCA-data/tidytuesdays/master/show-n-tell/exercises/candy-data.csv")

```

2. Process

- Use mutate and some algebra to create a candy index. You can weight each candy descriptor according to your/your group's proferences.
- Chart your rankings.
- Share your screen and show us your favorite candy. Have you tried that one?


