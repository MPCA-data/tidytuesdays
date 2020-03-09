# tidytuesdays

![](https://cdn-images.threadless.com/threadless-shop/products/5979/1272x920design_01.jpg?w=200&h=200)

#### Are you ready for our R hour?

> Each week features a new data set to explore. Come see examples of how others clean, analyze, and visualize data. Learn new methods and share your own. Bring all your burning questions, new packages, funny graphs, puzzles, and everything else you'd like to discuss. 
> 
> **:rocket: Explore this week's [[ Data ]](https://github.com/rfordatascience/tidytuesday#datasets)**
> 
> :eyes: See what people are [sharing](https://twitter.com/hashtag/TidyTuesday).

<br>

## Anouncements

- Next week timing & location, show-n-tell, share a problem

<br>

## Upcoming/Recent events

| Date | Time | Event  | Event link | Group webpage |  
| ---  | --- | --- | --- | --- |
| July 7-10, 2020 | -- | R User Conference - St. Louis, MO | [useR 2020](https://user2020.r-project.org/program/tutorials/) | https://user2020.r-project.org/ | 
| May 31, 2020 | 8-5 | Cascadia R Conference - :evergreen_tree: Eugene, Oregon | https://cascadiarconf.com/ | https://www.meetup.com/portland-r-user-group/ | 
| Feb 4, 2020 | 1:30-3 | Eco Data Science - :santa: Santa Barbara - GIS analysis + editing | [Zoom link](https://ucsb.zoom.us/j/390601568) | https://eco-data-science.github.io/  |    
| Jan 29, 2020 | 10-4  |  RStudio Conf 2020 - Recordings available | [RStudio 2020](https://resources.rstudio.com/rstudio-conf-2020)  |   https://resources.rstudio.com   |


<br>


## :phone: Calls for **HELP!**

- [ ]  Get the TITAN analysis to run super fast  
    - Data and code here: `X:\Agency_Files\Data_Services\DAU\Data Analytics User Group\Shared\r\tidytuesday\show-n-tell\bug_count`
- [ ]  Publish an Rmarkdown report as a webpage (*Barbara*)

<br>


## :hatching_chick: Featured functions

Play along! You can remote to your desktop or jump to [RStudio Cloud](https://rstudio.cloud/) to use R in your browser.

- [`dplyr::add_count()`](https://github.com/MPCA-data/tidytuesdays/blob/master/featured_functions.md#counting-is-easy-with-add_count)
- `pmax()` - _Find the max value across 2 columns, row by row._
- [`EnvStats::elnormAltCensored()`](https://github.com/MPCA-data/tidytuesdays/blob/master/show-n-tell/non-detects/EnvStats%20Tutorial.md) 
- [`tidylog::filter()`](https://github.com/MPCA-data/tidytuesdays/blob/master/featured_functions.md#librarytidylog)
- [`beepr::beep("mario")`](https://github.com/MPCA-data/tidytuesdays/blob/master/featured_functions.md#beep-beepnotes)

<br>


## What we're learning

<a href="https://tinystats.github.io/teacups-giraffes-and-statistics/01_introToR.html"><img src="https://tinystats.github.io/teacups-giraffes-and-statistics/images/Landing_page/singleGiraffe-clickme-hover.jpg" width="11%" align="left" /></a>
<br><br>

- [Cute giraffe stats](https://tinystats.github.io/teacups-giraffes-and-statistics/01_introToR.html)
- [Intro to modeling & predictions](https://supervised-ml-course.netlify.com/chapter1)

<br><br><br>

## :book: Reading

- Hadley's [R 4 Data Science](https://r4ds.had.co.nz/)
- Helsel's books at [Practical Stats](http://www.practicalstats.com/info2use/books.html)


## Discussion

Things to talk about.

<details>
<summary> 1 </summary>
    
> How do we approach reproducibility, collaboration and communication about data?

</details>

<details>
<summary> 2 </summary>

> What would a team workflow using open data science tools look like? How do we get there?

</details>

<details>
<summary> 3 </summary>
    
> How do we store and share our methods and code? Do your analyses have versions?

</details>

<br>


## Future topics

> 1. Show-n-tell what you want to replace: mega Excel tools, Access
> 1. Is it an outlier?
> 1. Non-detects: `NADA` vs `EnvStats` 
> 1. Time series forecasting 
> 1. Maps and shapefiles
>     - Kriging / Spatial interpolating between map points
> 1. Conditional probability
> 1. `broom` your modeling results
> 1. What is Rmarkdown?
> 1. `gganimate`
>     - gifs for mpca tweets
> 1. Working w/ strings & text
>     - Find words
>     - Split text columns
>     - Pull data from PDFs  
>     - Get data from web pages  
> 1. Project swap - Will it run?
> 1. Working in GitHub
> 1. `data.table` *(Derek)*
> 1. Create R packages
> 1. Write tests - testthat *(Barbara)*
> 1. Add data set to Kaggle - Pose questions to the world
> 1. [R generative art](https://www.data-imaginist.com/art)
>    - <img src="https://d33wubrfki0l68.cloudfront.net/68c4238194b9e2a403f144836aeb0dd8dec6cec8/51cfa/art/005_genesis/genesis4563_hu094ca1b1a2a99a63b276daf95703c5da_1678978_500x500_fill_box_center_2.png" width="25%"/> <img src="https://d33wubrfki0l68.cloudfront.net/d2690abfd68ec3d3abd3a0d84d79b2ff449f7aac/e0f3d/art/005_genesis/genesis9458_hu00b8f3fe8c7f8351b6b4597d079006d8_4379029_500x500_fill_box_center_2.png" width="25%"/> 
> 1.

<br>


## :earth_africa: Community projects

> Open to everyone to contribute – that's you!

- MPCA / MN R hex sticker <img src="https://raw.githubusercontent.com/rstudio/hex-stickers/master/PNG/modelr.png" width="20%"> 
    - A porg, or a flyging squirrel, or a porg on a flying squirrel?
- `library(mpcadata)`
    - Connect to delta, equis, AirVision, tempo, GIS resources
    - Store common reference data
        - Facility ID --> TEMPO ID    
- `library(mpcaggthemes)`
    - _ggplot_ colors and fonts
- _(unofficial)_ [MPCA Data Guide](https://mpca-data.github.io/Data-Guide/)
    - Add data sharing & publishing steps
- [MPCA Methods Guide](https://mpca-air.github.io/air-methods/) _(currently air focused)_ 
- `library(chemicalnames)`
    - I have `Methyl Bromide`, you have `Bromomethane`, but we all want `74-83-9`
- `library(mpcadashboard)`
    - Can we make this static [paper](https://www.pca.state.mn.us/about-mpca/dashboard-environmental-and-performance-measures) auto-update?
- `library(mpcatemplates)` or `library(mpcareports)`
    - RMarkdown templates with logo, header, fonts
    - <img src="images/mpca_template.png" width="40%"> 
- R training
    - Annual __R week__?
    - [Star Wars training](https://itep-r.netlify.com/)
    - [Workshops](https://mpca-air.github.io/RTrain/#workshops)
        - Maps
        - Connect to databases
    - The original old-school [Cat training](https://mpca-air.github.io/RCamp/)
- `library(ecoquotes)` or for Barbara `trekkiequotes`

<br>
