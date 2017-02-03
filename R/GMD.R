#' Create an R Markdown document from a Google Document
#'
#' @param doc_id your google documents unique ID - this can be obtained by using the `doc_tbl()` function and navigating to your document of interest or using your Google Document's editing url in the `get_id()` function
#' @param token your google authentication token
#' @param render 'none' is the default - this will create only a .Rmd file, and not render it. 'pdf_document' will render a pdf document and 'html_document' will render an html document.
#'
#' @return creates a `.Rmd` file in your working directory and, if specified, renders the document
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' GMD(doc_id = edit_url, token, render = 'none')
#' }
#' @export
GMD <- function(doc_id, token, render = 'none'){

  #Check if doc_id is a url
  is_url = grepl("docs.google.com", doc_id)

  #If the document id is supplied as a url strip away the stuff around the true ID
  api_url <-  paste0(drive_url, ifelse(is_url, .get_id(doc_id), doc_id))

  req <- .get_docs(url = api_url, token)

  text_url <- req$exportLinks$`text/plain`

  if (length(text_url) == 0) stop("The id you provided is not for a Google Text Document. Nothing to return.\n")
  filename = paste0(req$title,".Rmd")
  # write(text, file = filename)

  #a function to return upon calling GMD. you can then use this function to download the doc
  #It can also be fed to other functions to continuously update or render in markdown.
  get_doc <- function(printLoc = F){

    if(printLoc){
      return(filename)
    } else {
      text <- .get_docs(url = text_url, token)
      write(text, file = filename)
    }
  }
  return(get_doc)
}
