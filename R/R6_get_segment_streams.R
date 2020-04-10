#' get_segment_streams
#'
#' Returns the specified segment streams but only altitude, latlong and distance
#' read_all scope required in order to retrieve athlete-specific segment
#' information, or to retrieve private segments.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getSegmentById}
#'
#' @param mbr_object a mountainbiker object
#' @param segment_id the strava id of the segment
#' @param streams_types vector of esired stream types. May take the
#' following values:
#' "latlng", "distance", "altitude"
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
#' my_mbr$get_segment_streams(
#'      segment_id = 12345
#'      , streams_types = c("heartrate","distance")
#' )
#' }
get_segment_streams <- function(
    mbr_object = NULL
    , segment_id = NULL
    , streams_types = NULL
){
    mrb_object$get_segment_streams(
        segment_id = segment_id
        , streams_types = streams_types
    )
    invisible()
}




def_get_segment_streams <- function(
    segment_id = NULL
    , streams_types = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(segment_id)){
        stop("segment_id cannot be NULL")
    }
    if(is.null(streams_types)){
        stop("streams_types cannot be NULL")
    }
    ## Call strave API - getSegmentById
    my_segment_streams <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segments/"
                                , segment_id
                                , "/streams"),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , keys = paste0(streams_types, collapse = ",")
                          , key_by_type = TRUE
                          )
                      )


    api.code <- httr::status_code(my_segment_streams)

    ## case of normal call
    if(api.code == 200){
        my_segment_streams <- httr::content(my_segment_streams, "text")
        ## convert json to list
        my_segment_streams <- jsonlite::fromJSON(my_segment_streams)
        message(paste0("... Success in getting streams of segment : ", segment_id))
        return(my_segment_streams)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment_streams)$message))
        my_segment_streams <- httr::content(my_segment_streams, "text")
        my_segment_streams <- jsonlite::fromJSON(my_segment_streams)
        return(my_segment_streams)
    }


}
