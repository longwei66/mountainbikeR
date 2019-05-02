#' getActivities
#'
#' Get all activities from strava api
#'
#' @param token the strava identification token
#'
#' @return the activities database as json
#' @import httr
#' @import jsonlite
#' @export
#'
#' @examples
getActivities <- function(token = NULL, max.activities = 200){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}

    ## call API to get all activities
    strava.activities <- httr::GET("https://www.strava.com/",
                                   path = "api/v3/athlete/activities",
                                   query = list(access_token = myToken, per_page = max.activities)
    )

    api.code <- httr::status_code(strava.activities)

    ## case of normal call
    if(api.code == 200){
        strava.activities <- httr::content(strava.activities, "text")
        strava.activities.json <- jsonlite::fromJSON(strava.activities)
        return(strava.activities.json)
    } else {
        message(paste0("something is wrong in the api code: ",
                    httr::http_status(strava.activities)$message))
        strava.activities <- httr::content(strava.activities, "text")
        strava.activities.json <- jsonlite::fromJSON(strava.activities)
    }

}
