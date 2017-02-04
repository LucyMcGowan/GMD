[![Build Status](https://travis-ci.org/LFOD/GMD.svg?branch=master)](https://travis-ci.org/LFOD/GMD)



# Google Markdown
**Authors:** [Nick Strayer](www.nickstrayer.me) & [Lucy D'Agostino McGowan](www.lucymcgowan.com) 
**License:** [MIT](https://opensource.org/licenses/MIT)

Create collaborative R Markdown files in Google Docs and render them in `R`.

## Install

```
devtools::install_github("lucymcgowan/GMD")
```

## Load GMD
```
library('GMD')
```

## Demo

Until we build our own authentication, use the lovely Jenny Bryans:

```
token <- googlesheets::gs_auth()
```

Copy the URL you see when editing your Google Doc & use our function GMD to render it as an `.Rmd` file. For example:

```
edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
my_doc <- GMD(doc = edit_url, token)
my_doc()
```

By default, this will add a `.Rmd` file to your current working directory. If you would like to change this location, you can use the `setwd()` command.

### If you would like it to update continuously

```
live_update(my_doc)
```

### If you are into pipes

```
edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
edit_url %>%
 GMD(token) %>%
 render_doc(type = "html_document")
```
