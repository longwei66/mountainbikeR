#' get_segment_efforts
#'
#' Returns a set of the authenticated athlete's segment efforts for a
#' given segment.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-SegmentEfforts-getEffortsBySegmentId}
#' @seealso \url{https://developers.strava.com/playground/#/SegmentEfforts/getEffortsBySegmentId}
#' @param segment_id The identifier of the segment.
#' @param page Page number
#' @param per_page Number of items per page. Defaults to 30.
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_streams as list with streams details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_segment_efforts(
#'      segment_id = 12345
#'      , page = 1
#'      , per_page = 15
#' )
#' }
get_segment_efforts <- function(
    mbr_object = NULL
    , segment_id = NULL
    , page = NULL
    , per_page = NULL
){
    mrb_object$get_segment_efforts(
        segment_id = segment_id
        , page = page
        , per_page = per_page
    )
    invisible()
}




def_get_segment_efforts <- function(
    segment_id = NULL
    , page = NULL
    , per_page = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(segment_id)){
        stop("segment_id cannot be NULL")
    }

    ## Call strave API - getEffortsBySegmentId
    my_segment_efforts <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segments/"
                                , segment_id
                                , "/all_efforts"),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , page = page
                          , per_page = per_page
                          )
                      )


    api.code <- httr::status_code(my_segment_efforts)

    ## case of normal call
    if(api.code == 200){
        my_segment_efforts <- httr::content(my_segment_efforts, "text")
        ## convert json to list
        my_segment_efforts <- jsonlite::fromJSON(my_segment_efforts)
        message(paste0("... Success in getting efforts of segment : ", segment_id))
        return(my_segment_efforts)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment_efforts)$message))
        my_segment_efforts <- httr::content(my_segment_efforts, "text")
        my_segment_efforts <- jsonlite::fromJSON(my_segment_efforts)
        return(my_segment_efforts)
    }


}
