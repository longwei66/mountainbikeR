#' getStream
#'
#' get steam from one specific activity
#'
#' @param path2stream API path call
#' @param hold.time holding time between retry
#'
#' @return
#' @export
#'
#' @examples
getStream <- function(path2stream, hold.time = 1.8){
    message(paste0("_____ Getting ...", path2stream))
    myStreams <- GET("https://www.strava.com/", path = path2stream,
                     query = list(access_token = myToken, per_page = 200))
    myStreams <- content(myStreams, "text")
    myStreams <- fromJSON(myStreams)

    myList <- myStreams$data
    message("_____ Waiting 1.5 second to cope with 600 calls per 15 min API restriction")
    Sys.sleep(hold.time)

    return(setNames(myList, myStreams$type))
}
