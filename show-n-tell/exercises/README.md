# Exercises


## Partners

<img src="../../images/bert_ernie.jpg" width=248 align="right" />

### :book: Reading aloud

They say you should read more to write better.  

Let's practice interpreting R scripts to a partner, who will take what you say and try to turn it back into code. It will be kind of like a game of telephone, but for R.

#### Steps

_Find a partner and decide who gets to be **Bert** and who is **Ernie**._

1. Bert will look at the first code block and tell Ernie what it does.
1. Ernie will then write a code snippet that accomplishes what Bert said.
1. Bert can then offer more clues to help.
    - But try **NOT** to say the exact names of functions, like "`filter`" or "use `select`"

### Bert reads: block 1

<details>

<summary>For Bert's eyes only **(No looking Ernie!)** </summary>
    
```r

fishes <- read_csv("lake_superior_fish.csv")

big_fishes <- filter(fishes, length > 20)
 
```

**Hint**  
*Read in the Lake Superior fish data stored in a .csv and name it "fishes". Create a new table called "big_fishes" by pulling out only the fish that are longer than 20 inches.*

</details>
