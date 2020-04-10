#' get_activity_streams
#'
#' Returns the specified segment. read_all scope required in order to
#' retrieve athlete-specific segment information, or to retrieve private
#' segments.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getSegmentById}
#'
#' @param mbr_object a mountainbiker object
#' @param activity_id the strava id of the activity
#' @param streams_types vector of esired stream types. May take the
#' following values:
#' "time", "latlng", "distance", "altitude", "velocity_smooth",
#' "heartrate", "cadence", "watts", "temp", "moving", "grade_smooth"
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
#' my_mbr$get_activity_streams(
#'      activity_id = 12345
#'      , streams_types = c("heartrate","distance")
#' )
#' }
get_activity_streams <- function(
    mbr_object = NULL
    , activity_id = NULL
    , streams_types = NULL
){
    mrb_object$get_activity_streams(
        activity_id = activity_id
        , streams_types = streams_types
    )
    invisible()
}




def_get_activity_streams <- function(
    activity_id = NULL
    , streams_types = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(activity_id)){
        stop("activity_id cannot be NULL")
    }
    if(is.null(streams_types)){
        stop("streams_types cannot be NULL")
    }
    ## Call strave API - getActivityById
    my_activity_streams <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/activities/"
                                , activity_id
                                , "/streams"),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , keys = paste0(streams_types, collapse = ",")
                          , key_by_type = TRUE
                          )
                      )


    api.code <- httr::status_code(my_activity_streams)

    ## case of normal call
    if(api.code == 200){
        my_activity_streams <- httr::content(my_activity_streams, "text")
        ## convert json to list
        my_activity_streams <- jsonlite::fromJSON(my_activity_streams)
        message(paste0("... Success in getting streams of activity : ", activity_id))
        return(my_activity_streams)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_activity_streams)$message))
        my_activity_streams <- httr::content(my_activity_streams, "text")
        my_activity_streams <- jsonlite::fromJSON(my_activity_streams)
        return(my_activity_streams)
    }


}
