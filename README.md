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
