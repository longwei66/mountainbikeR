#' get_segment_effort_streams
#'
#' Returns a set of streams for a segment effort completed by the
#' authenticated athlete. Requires read_all scope.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Streams-getSegmentEffortStreams}
#' @param effort_id The identifier of the segment effort.
#' @param streams_types vector of esired stream types. May take the
#' following values:
#' "time", "latlng", "distance", "altitude", "velocity_smooth",
#' "heartrate", "cadence", "watts", "temp", "moving", "grade_smooth"
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_segment_effort_streams as list with streams details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_segment_effort_streams(
#'      effort_id = 12345
#'      , streams_types = c("heartrate","distance")
#' )
#' }
get_segment_effort_streams <- function(
    mbr_object = NULL
    , effort_id = NULL
    , streams_types = NULL
){
    mrb_object$get_segment_effort_streams(
        effort_id = effort_id
        , streams_types = streams_types
    )
    invisible()
}




def_get_segment_effort_streams <- function(
    effort_id = NULL
    , streams_types = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(effort_id)){
        stop("effort_id cannot be NULL")
    }
    if(is.null(streams_types)){
        stop("streams_types cannot be NULL")
    }
    ## Call strave API - getSegmentById
    my_segment_effort_streams <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segment_efforts/"
                                , effort_id
                                , "/streams"),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , keys = paste0(streams_types, collapse = ",")
                          , key_by_type = TRUE
                          )
                      )


    api.code <- httr::status_code(my_segment_effort_streams)

    ## case of normal call
    if(api.code == 200){
        my_segment_effort_streams <- httr::content(my_segment_effort_streams, "text")
        ## convert json to list
        my_segment_effort_streams <- jsonlite::fromJSON(my_segment_effort_streams)
        message(paste0("... Success in getting streams of segment : ", effort_id))
        return(my_segment_effort_streams)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment_effort_streams)$message))
        my_segment_effort_streams <- httr::content(my_segment_effort_streams, "text")
        my_segment_effort_streams <- jsonlite::fromJSON(my_segment_effort_streams)
        return(my_segment_effort_streams)
    }


}
