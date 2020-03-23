# Make a web book :book:

> This is great for a wiki-type documentation of a long term project.
>
> You can include narrative along side images and charts with  
> the code used for your anlyses.

#### Resources

- User guide: https://bookdown.org/yihui/bookdown/
- An example: https://github.com/rstudio/bookdown-demo

<br>

## Today's steps

We're making a simple 3-page book to learn the ropes. 

1. Open R
    - Use https://rstudio.cloud if you don't have access to R
1. Create a new R project
    - File > New project... > Name it "my_book"
1. Install the R package `bookdown`

```r
install.packages("bookdown")
```

1. Create a new R file
1. Paste this starter code into the file:

```r
---
title: "A Book"
author: "My name"
site: bookdown::bookdown_site
documentclass: book
output:
  bookdown::gitbook: default
  #bookdown::pdf_book: default
---
  
# Hello fans!
  
Hi.

Bye.

<!-- If you need PDF output, uncomment bookdown::pdf_book above in YAML. -->
<!-- You will need a LaTeX installation, e.g., https://yihui.name/tinytex/ -->
```

6. Save the file as `index.Rmd`
6. 
