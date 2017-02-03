# Google Markdown

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
id <- get_id(edit_url)
GMD(doc_id = id, token, render = 'none')
```

By default, this will add a `.Rmd` file to your current working directory. If you would like to change this location, you can use the `setwd()` command.
