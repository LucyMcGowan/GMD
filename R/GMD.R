#' Create an R Markdown document from a Google Document
#'
#' @param doc_id your google documents unique ID - this can be obtained by using the `doc_tbl()` function and navigating to your document of interest or using your Google Document's editing url in the `get_id()` function
#' @param token your google authentication token
#' @param render 'none' is the default - this will create only a .Rmd file, and not render it. 'pdf_document' will render a pdf document and 'html_document' will render an html document.
#'
#' @return
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' id <- get_id(edit_url)
#' GMD(doc_id = id, token, render = 'none')
#' }
#' @export
GMD <- function(doc_id, token, render = 'none'){
  api_url <- paste0(drive_url, doc_id)
  req <- .get_docs(url = api_url,
                   token)
  text_url <- req$exportLinks$`text/plain`
  if (length(text_url) == 0) stop("The id you provided is not for a Google Text Document. Nothing to return.\n")
  text <- .get_docs(url = text_url,
                    token)
  filename = paste0(req$title,".Rmd")
  write(text, file = filename)
  if (render == 'pdf_document'){
  rmarkdown::render(filename, "pdf_document")
  }
  if (render == 'html_document'){
    rmarkdown::render(filename, "html_document")
  }
}
