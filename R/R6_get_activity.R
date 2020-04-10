#' get_activity
#'
#' Returns the given activity that is owned by the authenticated athlete.
#' https://developers.strava.com/playground/#/Activities/getActivityById
#'
#' @param mbr_object a mountainbiker object
#' @param activity_id the strava id of the activity
#' @param include_all_efforts boolean
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return myActivity as list with activity details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_activity(
#'      activity_id = 12345,
#'      include_all_efforts = TRUE
#' )
#' }
get_activity <- function(
    mbr_object = NULL
    , activity_id = NULL
    , include_all_efforts = FALSE
){
    mrb_object$get_activity(
        activity_id = activity_id
        , include_all_efforts = include_all_efforts
    )
    invisible()
}




def_get_activity <- function(
    activity_id = NULL
    , include_all_efforts = FALSE
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(activity_id)){
        stop("activity_id cannot be NULL")
        }
    if(!is.logical(include_all_efforts)){
        stop("include_all_efforts must be TRUE or FALSE")
        }

    ## Call strave API - getActivityById
    myActivity <- httr::GET("https://www.strava.com/",
                            path = paste0("api/v3/activities/", activity_id),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , include_all_efforts = include_all_efforts
                          )
                      )


    api.code <- httr::status_code(myActivity)

    ## case of normal call
    if(api.code == 200){
        myActivity <- httr::content(myActivity, "text")
        ## convert json to list
        myActivity <- jsonlite::fromJSON(myActivity)
        message(paste0("... Success in getting activity", activity_id))
        return(myActivity)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(myActivity)$message))
        myActivity <- httr::content(myActivity, "text")
        myActivity <- jsonlite::fromJSON(myActivity)
        return(myActivity)
    }


}
