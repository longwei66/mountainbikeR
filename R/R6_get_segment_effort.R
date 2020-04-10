#' get_segment_effort
#'
#' Returns a segment effort from an activity that is owned by the
#' authenticated athlete.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-SegmentEfforts-getSegmentEffortById}
#' @seealso \url{https://developers.strava.com/playground/#/SegmentEfforts/getSegmentEffortById}
#' @param effort_id the id of the specific effort to collect
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_effort containing effort details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_segment_effort(
#'      effort_id = 12345
#' )
#' }
get_segment_effort <- function(
    mbr_object = NULL
    , effort_id = NULL
){
    mrb_object$get_segment_effort(
        effort_id = effort_id
    )
    invisible()
}




def_get_segment_effort <- function(
    effort_id = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(effort_id)){
        stop("effort_id cannot be NULL")
    }

    ## Call strave API - getEffortsBySegmentId
    my_segment_effort <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segment_efforts/"
                                , effort_id
                                ),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          )
                      )


    api.code <- httr::status_code(my_segment_effort)

    ## case of normal call
    if(api.code == 200){
        my_segment_effort <- httr::content(my_segment_effort, "text")
        ## convert json to list
        my_segment_effort <- jsonlite::fromJSON(my_segment_effort)
        message(paste0("... Success in getting effort : ", effort_id))
        return(my_segment_effort)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment_effort)$message))
        my_segment_effort <- httr::content(my_segment_effort, "text")
        my_segment_effort <- jsonlite::fromJSON(my_segment_effort)
        return(my_segment_effort)
    }


}
