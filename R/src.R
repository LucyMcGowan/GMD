drive_url <- "https://www.googleapis.com/drive/v2/files/"

.get_docs <- function(url = drive_url, token = token) {
  req <- httr::GET(url,token)
  if (req$status_code >= 400) {
    stop(
      sprintf(
        "Google API returned an error: HTTP status code %s, %s",
        req$status_code,
        req$headers$statusmessage
      )
    )
  }
  httr::stop_for_status(req)
  reqlist <- httr::content(req, "parsed")
  if (length(reqlist) == 0) stop("Zero records match your filter. Nothing to return.\n")

  return(reqlist)
}

