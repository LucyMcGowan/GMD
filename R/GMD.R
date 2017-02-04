#' Create an R Markdown document from a Google Document
#'
#' @param doc your google documents unique ID or edit URL. The unique ID can be obtained by using the `doc_tbl()` function and navigating to your document of interest. The edit URL is the Google Doc url you use to edit the document.
#' @param token your google authentication token
#' @param output_name the desire file name (sans extension). Defaults to google doc name.
#'
#' @return creates a `.Rmd` file in your working directory and, if specified, renders the document
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' GMD(doc = edit_url, token)
#' }
#' @export
GMD <- function(doc, token, output_name = NULL){

  #Check if doc is a url
  is_url = grepl("docs.google.com", doc)

  #If the document id is supplied as a url strip away the stuff around the true ID
  api_url <-  paste0(drive_url, ifelse(is_url, .get_id(doc), doc))

  req <- .get_docs(url = api_url, token)

  text_url <- req$exportLinks$`text/plain`

  if (length(text_url) == 0) stop("The id you provided is not for a Google Text Document. Nothing to return.\n")

  #check if the user chose a filename or not. If they didn't default to the google docs name.
  filename = ifelse(is.null(output_name), paste0(req$title,".Rmd"), paste0(output_name, ".Rmd"))

  #a function to return upon calling GMD. you can then use this function to download the doc
  #It can also be fed to other functions to continuously update or render in markdown.
  get_doc <- function(printLoc = FALSE, filename = NULL, token = NULL, text_url = NULL){

    if(printLoc){
      return(filename)
    } else {
      text <- .get_docs(url = text_url, token)
      #remove the smart quotes so R doesnt freak out.
      text_clean_1 <- gsub("“|”", "\"", text)
      text_clean_2 <- gsub("‘|’", "'", text_clean_1)

      write(text_clean_2, file = filename)
      cat("Saving ", filename)
    }  }
  formals(get_doc) <- list(printLoc = FALSE, filename = filename, token = token, text_url = text_url)
  return(get_doc)
}
