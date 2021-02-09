# Stage 1 |  A Wampa Rumpus

<img src="https://i.ebayimg.com/images/g/gcQAAOSwkylfAyto/s-l1600.jpg" width="35%" align="right">

<br>

> It happened again. Foolhardy Luke has gotten himself into a pickle all by himself. This time he's stuck in a wampa cave and hanging upside down no less. And we were so looking forward to taking a nice nap while recharging our batteries. That will have to wait. 
>
> Lucky for Luke, I did just bump into a researcher at the cantina recently. They weren't happy about spilling their peas, but were pleased I agreed to help with their study. She mentioned she had been observing the movement patterns of wampas in the area. I think if we do a little data digging we could find an optimum time to rescue Luke. And if we're wrong, well, we sure won't be the one sneaking into the cave to find out. That's Han's job. 

<br>

## Your Mission

- What hour of the day is the Wampa most likely to be absent from their cave?


### Required packages

```r
library(readr)
library(dplyr)
```

### Instructions

0. Download the 3 Excel files from here: [Wampa data](https://github.com/MPCA-data/tidytuesdays/tree/master/show-n-tell/R2D2_missions/stage_1_data) 
1. Open each Excel file and save it as a.CSV file *(in latter trainings you we'll learn how to read data directly from Excel & other data sources)*
    - <img src="https://cdn4syt-solveyourtech.netdna-ssl.com/wp-content/uploads/2016/03/excel-2013-save-as-csv-4.jpg" width="60%" >
    - Save the 3 .CSV files to your project's `data` folder.
2. Read each of these 3 CSV files into R using `read_csv()`
3. Bind the first 2 data sets together into a single data frame with `bind_rows()`
4. Use `bind_rows` one more time to bind this new data frame to the 3rd week of data 
    - This will be your super "ALL the data" table
5. Use `summary()` to find the hour of day with the highest amount of time spent "wampa_out_hunting". Hopefully Luke was caught by a very predictable wampa. 

- **Final step** Clap 5 times. Out loud. For real. :clap::clap::clap::clap::clap:

<br>

## Save and share
Send us your script and your best recommendation for the time for a Luke rescue mission. Han Solo will really appreciate it. We'll let you know how it goes. 

