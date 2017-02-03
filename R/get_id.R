#' Get the ids of Google Drive documents
#'
#' @param edit_url the url you see when editing your Google Document
#'
#' @return your document id, to be input in `GMD()`
#'
#'
#' @examples
#' edit_url <- "https://docs.google.com/document/d/1RTCQ67mpZTKe9ddllVNCBom5uC2KMFjktKHb1mjWKOM/edit"
#' id <- get_id(edit_url)
#'
#' @export
get_id <- function(edit_url){
  strsplit(gsub("//", "/", edit_url), "/")[[1]][5]
}
