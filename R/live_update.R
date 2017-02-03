#' Setup a constant live pulling from the google doc specified.
#'
#' @param document The return from running `GMD()`. E.g. `my_doc <- GMD(token, url)`
#' @param refresh_rate How many seconds you want to wait before re-pulling google doc.
#'
#' @return Downloads from google doc and makes into an RMD continuously a `.Rmd`.
#'
#' @examples
#' \dontrun{
#' my_doc <- GMD(token, url)
#' live_update(my_doc)
#' }
#' @export
live_update <- function(document, refresh_rate = 1){

  position <- "." #progress dots
  pb <- txtProgressBar(max = 100)

  while(T){
    document() #download document

    position <- paste0(position, ".") #add another progress dot.

    flush.console()
    cat(say(paste0("Watching for updates.", position), by = "monkey", type = "string"), " \r")

    #If we've been filling bar for a while reset it.
    if(nchar(position) > 10) position = "."
  }

}
