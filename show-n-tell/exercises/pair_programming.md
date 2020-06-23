# Pair programming

<img src="../../images/pear_program.png" width=236 align="left" />

> "Two pears are better than one."  

Let's practice writing R scripts as a team. One partner will convey what you want to accomplish, while the other writes the R script. There's no pressure, but there might be sugaR :candy: points on the line.

**Come back and join the big group at ` 9:35 `**

#### Instructions

_Use Teams to call your partner. Then tbe person who already has R open should share their screen. They will be the first script doctor. The other person gets to be the visionary coach / fan / moral support for the first go._

1. The script writer will start reading in the data using the given code.
1. The coach will look at the desired end goal and think about possible first steps.
1. Then the coach will convey the goal and steps to their partner as they start building their script.
1. Keep working together to get to the end result shown in the **Goal** section.

> **Ta-da!!** After you complete the first one, switch roles and move on to the next challenge.

<br>

#### :warning: Hold up! Wait until the script writer is sharing their screen to read the challenge. 

<br>

### Code challenge #1: Penguin Waddle Dreams

<b>Read data</b> <i>(For the script writer)</i>
  
We'll be working with Antarctic penguin data.

```r
remotes::install_github("allisonhorst/palmerpenguins")

library(palmerpenguins)

pengs <- penguins 

# Now what? Ask the coach, they will guide you.
```      

<br>

<details>
<summary> <b>Coach's :eyes: only! </b> <i> (Click to see the goal) </i> </summary>

<br>

**Starting data**

<img src="../../images/pengu_start.png" width=688 />

<br><br>

**End Goal**

Then there were four Dreamy penguins.

 <img src="../../images/pengu_end_an.png" width=738 />

  
</details> 
<br>


### Code challenge #2: The first of many

<b>Read data</b> <i>(For the script writer)</i>
  
We'll be working with the African American achievement data at [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-06-23/readme.md).


```r
library(readr)

# Get the Data
#firsts <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-09/firsts.csv')
science <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-09/science.csv')

View(science)

# Now what? Ask the coach, they will guide you.
```      

<br>

<details>
<summary> <b>Coach's :eyes: only! </b> <i> (Click to see the goal) </i> </summary>

<br>

**Starting data**

<img src="../../images/am_achieve_start.png" width=688 />

<br><br>

**End Goal**

<img src="../../images/am_achieve_end.png" width=688 />

  
</details> 
<br>

### Code challenge #3: Caribou Tracks

<b>Read data</b> <i>(For the script writer)</i>
  
We'll be working with the caribou traking data at [Tidy Tuesday Caribou](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-06-23/readme.md).


```r
library(readr)
library(leaflet)
## Leaflet circle markers: https://rstudio.github.io/leaflet/markers.html

# Get the Data
#meet_the_caribou <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-23/individuals.csv')

tracks <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-23/locations.csv')

# Now what? Ask the coach, they will guide you.
```      

<br>

<details>
<summary> <b>Coach's :eyes: only! </b> <i> (Click to see the goal) </i> </summary>

<br>

**Starting data**

<img src="../../images/caribou_start.png" width=688 />

<br><br>

**End Goal**

**Map for Caribou ID:`"GR_C15"`**

<img src="../../images/caribou_map.png" width=738 />

  
</details> 
<br>

