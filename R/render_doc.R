#' Render Google Document as html or pdf
#'
#' @param doc_fun function to pull Google document obtained from `GMD()`
#' @param output_format "html_document" or "pdf_document"
#'
#' @return rendered pdf or html document
#'
#' @examples
#' \dontrun{
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' my_doc <- GMD(doc = edit_url, token)
#' render_doc(doc_fun = my_doc, output_format = "html_document")
#'}
#' @export
render_doc<- function(doc_fun, output_format = "html_document") {
  filename <- doc_fun(printLoc = TRUE)
  if (output_format == 'pdf_document') {
    rmarkdown::render(filename, "pdf_document")
  }
  if (output_format == 'html_document') {
    rmarkdown::render(filename, "html_document")
  }
  if (!(output_format %in% c('pdf_document','html_document'))) stop('Incorrect document type, you silly billy. Please use "pdf_document" or "html_document"')
}

