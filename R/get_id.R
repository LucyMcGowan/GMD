#' Get the ids of Google Drive documents
#'
#' @param token your google authentication token
#'
#' @return tibble containing id, title, and date created of documents in google drive
#' @export
#'
#' @examples
get_id <- function(token){
  req <- .api_fetch(token)
  req_tbl <- tibble::tibble(
    id             = purrr::map_chr(req$items, "id") ,
    title          = purrr::map_chr(req$items, "title"),
    dateCreated    = as.Date(purrr::map_chr(req$items, "createdDate"))
  )
  req_tbl <- req_tbl[order(req_tbl$dateCreated, decreasing = TRUE),]
  return(req_tbl)
}
