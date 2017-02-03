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
get_id <- function(edit_url) {
  url <- strsplit(gsub("//", "/", edit_url), "/")
  if (length(url[[1]]) < 6)
    stop("This url doesn't look like it comes from editing a Google Document")
  if (url[[1]][2] == "docs.google.com" & url[[1]][6] == "edit") {
    id <- url[[1]][5]
    return(id)
  } else
    stop("This url doesn't look like it comes from editing a Google Document")
}
