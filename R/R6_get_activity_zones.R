#' get_activity
#'
#' Returns the zones of a given activity.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Activities-getZonesByActivityId}
#'
#' @param mbr_object a mountainbiker object
#' @param activity_id the strava id of the activity
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_activity_zones as list with activity details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr as mountainbikeR object
#'
#' my_mbr$get_activty_zone(
#'      activity_id = 12345
#' )
#' }
get_activity_zones <- function(
    mbr_object = NULL
    , activity_id = NULL
){
    mrb_object$get_activity_zones(
        activity_id = activity_id
    )
    invisible()
}




def_get_activity_zones <- function(
    activity_id = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(activity_id)){
        stop("activity_id cannot be NULL")
        }

    ## Call strave API - getActivityById
    my_activity_zones <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/activities/"
                                , activity_id
                                , "/zones"
                                ),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          )
                      )


    api.code <- httr::status_code(my_activity_zones)

    ## case of normal call
    if(api.code == 200){
        my_activity_zones <- httr::content(my_activity_zones, "text")
        ## convert json to list
        my_activity_zones <- jsonlite::fromJSON(my_activity_zones)
        message(paste0("... Success in getting activity", activity_id))
        return(my_activity_zones)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_activity_zones)$message))
        my_activity_zones <- httr::content(my_activity_zones, "text")
        my_activity_zones <- jsonlite::fromJSON(my_activity_zones)
        return(my_activity_zones)
    }


}
