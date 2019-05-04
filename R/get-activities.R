#' getActivities
#'
#' Get all activities from strava api
#'
#' @param token the strava identification token
#' @param activities.per.page max number of item to return (must be 200 max)
#' @param after.date return activities after date as YYYY-MM-DD
#' @param before.date return activities before date as YYYY-MM-DD
#'
#' @return the activities database as json
#' @import httr
#' @import jsonlite
#' @import data.table
#' @export
#'
#' @examples
getActivities <- function(token = NULL,
                          activities.per.page = 200,
                          page.number = 1,
                          after.date = NULL,
                          before.date = NULL){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}
    if(activities.per.page > 200){ stop("activities.per.page cannot be larger than 200")}

    ## convert dates if not null
    if(!is.null(after.date)){
        after.date = as.numeric(as.POSIXct(after.date, format = "%Y-%m-%d"))
    }
    if(!is.null(before.date)){
        before.date = as.numeric(as.POSIXct(before.date, format = "%Y-%m-%d"))
    }

    ## call API to get all activities
    strava.activities <- httr::GET("https://www.strava.com/",
                                   path = "api/v3/athlete/activities",
                                   query = list(access_token = myToken,
                                                per_page = activities.per.page,
                                                page = page.number,
                                                before = before.date,
                                                after = after.date)
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
