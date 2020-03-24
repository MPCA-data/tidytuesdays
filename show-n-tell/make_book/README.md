# :book: Make a web book 

> The `bookdown` package is great for a wiki-type documentation of a long term project.
>
> You can include narrative next to images and charts and your analysis code.

#### Resources

- User guide: https://bookdown.org/yihui/bookdown/
- Book example: https://github.com/rstudio/bookdown-demo
- MPCA's air example: https://mpca-air.github.io/air-methods/  

<br>

## First steps

We're kicking off with a 3-page book. 

1. Open R
    - Try https://rstudio.cloud if you have telework troubles
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
  
# Hello
  
Hi.

Bye.

```

6. Save the file as `index.Rmd` _(The Rmd extension stands for R markdown)_
6. Fix any spacing changes that occurred (`title` and `# Hello fans` should start all the way to the left)
6. Add an image by placing the following after the `# Hello` header
    - `![](link-to-my-image.png)`

<br>

### New page!

8. Click `New File > R Markdown...`
8. Leave the default options and click `OK`
8. Delete the top header information starting and ending with the 3 ticks: `---`
8. Drop one of the `#` signs in front of "## R Markdown" to create a level 1 header
8. Save the file as `02-page_2` or `02-my_section_name`
8. Preview the page
    - Click the `Knit` button at the top left
    - It's under the .Rmd file tabs and has a __yarn__ icon

### Last page

14. Repeat the first 4 steps above to create a new page
14. Save the file as `03-page_3` or `03-my_section_name`
14. Preview the page _(click the `knit` button)_

### Build your book

16. 

## :star: Bonus options :star:

### Download options

![](https://bookdown.org/yihui/bookdown/images/gitbook.png)

1. Create a new R file
1. Save it as `output.yml`
1. Paste these configuration options into it:

```r
bookdown::gitbook:
  config:
    download: ["pdf", "epub"]
 
```
4. Re-build your book.
