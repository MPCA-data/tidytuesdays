# Exercises

<img src="../../images/bert_ernie.jpg" width=248 align="right" />
## Partners

### :book: Reading aloud

They say you should read to write better.  

Let's practice interpreting R scripts to our parnter who will try to turn it back into code. It will be kind of like a game of telephone, but for R.

#### Steps

_First find a partner and decide who gets to be **Bert** and who's **Ernie**._

1. Bert looks at the first code block and reads it to Ernie.
1. Ernie then writes a code snippet that follows what Bert said.
1. Bert can offer more clues to help
    - But try **NOT** to say the names of functions, like "`filter`" or "use `select`"

### Bert reads: block 1

<details>

<summary>Bert's eyes only **(No looking Ernie!)** </summary>
    
```r

fishes <- read_csv("lake_superior_fish.csv")

big_fishes <- filter(fishes, length > 20)
 
```

**Hint**  
*Read in the Lake Superior fish data stored in a .csv and name it "fishes". Create a new table called "big_fishes" by pulling out only the fish that are longer than 20 inches.*

</details>
