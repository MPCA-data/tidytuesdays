# Exercises


### :book: Reading aloud

<img src="../../images/bert_ernie.jpg" width=248 align="right" />

> "Read more to write better."  

Let's practice reading R scripts to a partner, who will listen to what you say and try to turn it back into code. It's like a game of *telephone*, but for R.

#### Steps

_Find a partner and decide who gets to be **Bert** and who gets to be **Ernie**._

1. Bert will look at the first code block and tell Ernie what it does.
1. Ernie will then write a code snippet that accomplishes what Bert said.
1. Then Bert can offer more clues to help.
    - Try **not** to say the exact syntax or names of functions, like "use `filter`" or "use `write csv`"


<details>
<summary>Example</summary>
    
```r
library(sandwich)
    
slices_bread <- 4

fillings <- read_csv("fillings.csv")

nrow(fillings)

names(fillings)
```    

</details>    


We'll start by turning some fishy code into plain language.

### Bert reads: `big fish` :fish:

<details>

<summary> Bert's :eyes: only!  <i> (No peeking Ernie)</i> </summary>
    
```r

library(readr)

fishes <- read_csv("lake_superior_fish.csv")

names(big_fishes)

nrow(fishes)
 
big_fishes <- filter(fishes, length > 20)

nrow(big_fishes)

```

<details>

**<summary> Example reading  </summary>**

> *Load the package "readr".*  
> *Then read in the Lake Superior fish data stored in a .csv file and name the data "fishes".   
> View the column names in the fishes data.  
> Count the number of fish.*  
>   
> *Create a new table called "big_fishes" that contains only the fish with a length longer than 20 (inches?).  
> Finally, count the number of big fish.*  

</details></details>

<br>

Now let's go the other direction. We'll try to turn _plain language_ into R code.

### Ernie's turn: `sheep count` :sheep::sheep::sheep:

<details>

<summary> Ernie's :eyes: only </summary>
    
>     
> *Load the package "ggplot2".*  
> *Create a new variable named "asleep" and set it to false.     
> Create a vector called "names" that contains the 3 text values: "Shaun", "Lambchop" & "Dolly"    
> Create a new variable named "sheep_id" and assign it three values: 1, 2, & 3    
> Create a data frame called "my_sheep" with 2 columns:*  
>    - *"sheep_name" that contains the "names" vector above*  
>    - *"sheep_id" that contains the "sheep_ids" above*    
>  
> *Make a gg-scatterplot of my_sheep, with the sheep names along the x-axis and the sheep IDs as the y-axis.    
> Give the plot the title "Counting sheep backwards makes me Zzzz...".  
> Set the variable "asleep" to true.*  


<details> <summary> Example code </summary>
 
```r

library(ggplot2)

asleep <- FALSE

names <- c("Shaun", "Lambchop", "Dolly")

sheep_ids <- 1:3

my_sheep <- data.frame(sheep_name = names, 
                       sheep_id   = sheep_ids)

ggplot(my_sheep, aes(x = names, y = sheep_id)) +
  geom_point()

ggplot(my_sheep, aes(x = names, y = sheep_id)) +
  geom_point() +
  labs(title = "Counting sheep backwards makes me Zzzz...")

asleep <- TRUE
 
``` 

</details>
</details>
