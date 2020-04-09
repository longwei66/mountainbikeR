#' get_segment
#'
#' Returns the specified segment. read_all scope required in order to
#' retrieve athlete-specific segment information, or to retrieve private
#' segments.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getSegmentById}
#'
#' @param mbr_object a mountainbiker object
#' @param segment_id the strava id of the segment
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_segment as list with segment details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_segment(
#'      segment_id = 12345
#' )
#' }
get_segment <- function(
    mbr_object = NULL
    , segment_id = NULL
){
    mrb_object$get_segment(
        segment_id = segment_id
    )
    invisible()
}




def_get_segment <- function(
    segment_id = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(segment_id)){
        stop("segment_id cannot be NULL")
    }

    ## Call strave API - getActivityById
    my_segment <- httr::GET("https://www.strava.com/",
                            path = paste0("api/v3/segments/", segment_id),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          )
                      )


    api.code <- httr::status_code(my_segment)

    ## case of normal call
    if(api.code == 200){
        my_segment <- httr::content(my_segment, "text")
        ## convert json to list
        my_segment <- jsonlite::fromJSON(my_segment)
        message(paste0("... Success in getting segment : ", segment_id))
        return(my_segment)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment)$message))
        my_segment <- httr::content(my_segment, "text")
        my_segment <- jsonlite::fromJSON(my_segment)
        return(my_segment)
    }


}
