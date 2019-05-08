#' listActivities
#'
#' List all activities from strava api. Returns the activities of an athlete
#' for a specific identifier. Requires activity:read.
#' Only Me activities will be filtered out unless requested by a token
#' with activity:read_all.
#'
#' @param token the strava identification token
#' @param activities_per_page max number of item to return (must be 200 max)
#' @param page_number the specific page number to extract
#' @param after_date return activities after date as YYYY-MM-DD
#' @param before_date return activities before date as YYYY-MM-DD
#'
#' @return the activities database as json
#' @import httr
#' @import jsonlite
#' @import data.table
#' @export
#' @source
#' \url{https://developers.strava.com/docs/reference/#api-Activities-getLoggedInAthleteActivities}
#'
#' @examples
#' \dontrun{
#' getActivities(token = myToken, activities_per_page = 200, page_number = 2)
#' }
listActivities <- function(token = NULL,
                          activities_per_page = 200,
                          page_number = 1,
                          after_date = NULL,
                          before_date = NULL){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}
    if(activities_per_page > 200){ stop("activities_per_page cannot be larger than 200")}

    ## convert dates if not null
    if(!is.null(after_date)){
        after_date = as.numeric(as.POSIXct(after_date, format = "%Y-%m-%d"))
    }
    if(!is.null(before_date)){
        before_date = as.numeric(as.POSIXct(before_date, format = "%Y-%m-%d"))
    }

    ## call API to get all activities
    strava.activities <- httr::GET("https://www.strava.com/",
                                   path = "api/v3/athlete/activities",
                                   query = list(access_token = token,
                                                per_page = activities_per_page,
                                                page = page_number,
                                                before = before_date,
                                                after = after_date)
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
        return(strava.activities.json)
    }

}
