#' getActivity
#'
#' Returns the given activity that is owned by the authenticated athlete.
#' https://developers.strava.com/playground/#/Activities/getActivityById
#'
#' @param activity.id
#'
#' @return myActivity as list with activity details
#' @export
#'
#' @examples
getActivity <- function( token = NULL,
                         activity_id = NULL,
                         include_all_efforts = FALSE){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}
    if(is.null(activity_id)){ stop("activity_id cannot be NULL")}
    if(!is.logical(include_all_efforts)){ stop("include_all_efforts must be TRUE or FALSE")}

    ## Call strave API - getActivityById
    myActivity <- httr::GET("https://www.strava.com/",
                            path = paste0("api/v3/activities/", activity_id),
                      query = list(access_token = token,
                                   include_all_efforts = include_all_efforts)
                      )


    api.code <- httr::status_code(myActivity)

    ## case of normal call
    if(api.code == 200){
        myActivity <- httr::content(myActivity, "text")
        ## convert json to list
        myActivity <- jsonlite::fromJSON(myActivity)
        return(myActivity)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(myActivity)$message))
        myActivity <- httr::content(myActivity, "text")
        myActivity <- jsonlite::fromJSON(myActivity)
        return(myActivity)
    }


}
