#' getStreams
#'
#' get streams from one specific activity
#'
#' @param token the strava authorization token
#' @param activity_id integer, The identifier of the activity
#' @param stream_keys a vector of Desired stream types, see stream_types
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @return myStreams a list of streams
#' @export
#' @source
#' \url{https://developers.strava.com/docs/reference/#api-Streams-getActivityStreams}
#'
#' @examples
#' \dontrun{
#' getStreams(
#'    token = myToken,
#'    activity_id = 1234567,
#'    stream_keys = c("time","latlng","altitude"))
#' }
#'
getStreams <- function(token = NULL,
                       activity_id = NULL,
                       stream_keys = NULL){

    ## test input
    if(is.null(token)){
        stop("token cannot be NULL")
    }
    if(is.null(activity_id)){
        stop("activity_id cannot be NULL")
    }
    if(is.null(stream_keys)){
        stop("stream_keys cannot be NULL")
    }
    if(!is.character(stream_keys)){
        stop("stream_keys must be a vector of character")
    }


    ## API path
    my_path = paste0("api/v3/activities/",
                     activity_id,
                     "/streams")

    query_list <- list(
        access_token = token,
        key_by_type = TRUE,
        keys = paste(stream_keys,
                     collapse = ",")
    )


    # for(i in 1:length(stream_keys)){
    #     query_list <- c(query_list, keys = stream_keys[i])
    # }

    message(query_list)

    ## API call
    myStreams <- httr::GET(
        "https://www.strava.com/",
        path = my_path,
        query = query_list
    )

    myStreams <- httr::content(myStreams, "text")
    myStreams <- jsonlite::fromJSON(myStreams)

    return(myStreams)
}
