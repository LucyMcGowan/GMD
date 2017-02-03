#' Render Google Document as html or pdf
#'
#' @param doc function to pull Google document obtained from `GMD()`
#' @param output_format "html_document" or "pdf_document"
#'
#' @return
#'
#' @examples
#'
#' @export
render_doc<- function(doc, output_format = "html_document") {
  filename <- doc(printLoc = TRUE)
  if (output_format == 'pdf_document') {
    rmarkdown::render(filename, "pdf_document")
  }
  if (output_format == 'html_document') {
    rmarkdown::render(filename, "html_document")
  }
  if (!(output_format %in% c('pdf_document','html_document'))) stop('Incorrect document type, you silly billy. Please use "pdf_document" or "html_document"')
}

