#' get_starred_segments
#'
#' List of the authenticated athlete's starred segments. Private segments are
#' filtered out unless requested by a token with read_all scope.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getLoggedInAthleteStarredSegments}
#'
#' @param page Integer, Page number
#' @param per_page integer, Number of items per page. Defaults to 30.
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_starred_segments as list with leaderboard
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_starred_segments(

#' )
#' }
get_starred_segments <- function(
    mbr_object = NULL
    , page = NULL
    , per_page = NULL
){
    mrb_object$get_starred_segments(
        page = page
        , per_page = per_page
    )
    invisible()
}




def_get_starred_segments <- function(
    page = NULL
    , per_page = NULL
){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }

    ## Call strave API - getActivityById
    my_starred_segments <- httr::GET(
        url = "https://www.strava.com/"
        , path = "api/v3/segments/starred"
        , query = list(
            access_token = private$.token$credentials$access_token
            , page = page
            , per_page = per_page
        )
    )


    api.code <- httr::status_code(my_starred_segments)

    ## case of normal call
    if(api.code == 200){
        my_starred_segments <- httr::content(my_starred_segments, "text")
        ## convert json to list
        my_starred_segments <- jsonlite::fromJSON(my_starred_segments)
        message("... Success in getting starred segments")
        return(my_starred_segments)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_starred_segments)$message))
        my_starred_segments <- httr::content(my_starred_segments, "text")
        my_starred_segments <- jsonlite::fromJSON(my_starred_segments)
        return(my_starred_segments)
    }
}
