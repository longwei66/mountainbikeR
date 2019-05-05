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
getActivityDetails <- function(activity.id){
    ## Message to inform where we are
    message(paste0("_____ Getting ...", activity.id))
    ## Call strave API - getActivityById
    myActivity <- httr::GET("https://www.strava.com/", path = paste0("api/v3/activities/", activity.id),
                      query = list(access_token = myToken, per_page = 200))
    myActivity <- content(myActivity, "text")

    ## convert json to list
    myActivity <- jsonlite::fromJSON(myActivity)
    return(myActivity)
}
