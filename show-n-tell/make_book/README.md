# Make a web book :book:

> The `bookdown` package is great for a wiki-type documentation of a long term project.
>
> You can include narrative along side images and charts with your analysis code.

#### Resources

- User guide: https://bookdown.org/yihui/bookdown/
- Book example: https://github.com/rstudio/bookdown-demo
- MPCA's air example: https://mpca-air.github.io/air-methods/  

<br>

## Today's steps

We're kicking off with a 3-page book. 

1. Open R
    - Use https://rstudio.cloud if you don't have access to R
1. Create a new R project
    - File > New project... > Name it "my_book"
1. Install the R package `bookdown`

```r
install.packages("bookdown")
```

1. Create a new R file _(This will be your book's title or Home page)_
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

6. Save the file as `index.Rmd` _(The Rmd extension stands for R markdown)_
6. Fix any spacing changes that occurred (`title` and `# Hello fans` should start all the way to the left)

### New page!

8. Click `New File > R Markdown...`
8. Leave the default options and click `OK`
8. Delete the top header information starting and ending with the 3 ticks: `---`
8. Drop one of the `#` signs in front of "## R Markdown" to create a level 1 header
8. Save the file as `02-page_2` or `02-my_section_name`


