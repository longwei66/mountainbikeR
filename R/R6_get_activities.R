#' get_activities
#'
#' List all activities from strava api. Returns the activities of an athlete
#' for a specific identifier. Requires activity:read.
#' Only Me activities will be filtered out unless requested by a token
#' with activity:read_all.
#'
#' @param mbr_object a mountainbikeR object
#' @param activities_per_page max number of item to return (must be 200 max)
#' @param page_number the specific page number to extract
#' @param after_date return activities after date as YYYY-MM-DD
#' @param before_date return activities before date as YYYY-MM-DD
#'
#' @return the activities database as json
#' @importFrom  httr GET status_code content
#' @importFrom  jsonlite fromJSON
#' @import dplyr
#' @include clean-activities-list.R
#' @export
#' @source
#' \url{https://developers.strava.com/docs/reference/#api-Activities-getLoggedInAthleteActivities}
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR objecti previously created
#' my_mbr$get_activities(
#'   activities_per_page = 200
#'   , page_number = 2
#'  , after_date = "2018-02-20"
#'  , before_date = "2018-03-01"
#'   )
#' }
get_activities <- function(
    mbr_object = NULL
    , activities_per_page = 200
    , page_number = 1
    , after_date = NULL
    , before_date = NULL
){
    mrb_object$get_activities(
        activities_per_page = activities_per_page
        , page_number = page_number
        , after_date = after_date
        , before_date = before_date
    )
    invisible()
}


#' def_get_activities
#' @param activities_per_page max number of item to return (must be 200 max)
#' @param page_number the specific page number to extract
#' @param after_date return activities after date as YYYY-MM-DD
#' @param before_date return activities before date as YYYY-MM-DD
def_get_activities <- function(
    activities_per_page = 200
    , page_number = 1
    , after_date = NULL
    , before_date = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(activities_per_page > 200){
        stop("activities_per_page cannot be larger than 200")
    }

    ## convert dates if not null
    if(!is.null(after_date)){
        after_date = as.numeric(as.POSIXct(after_date, format = "%Y-%m-%d"))
    }
    if(!is.null(before_date)){
        before_date = as.numeric(as.POSIXct(before_date, format = "%Y-%m-%d"))
    }

    ## call API to get all activities
    strava_activities <- httr::GET(
        "https://www.strava.com/",
        path = "api/v3/athlete/activities",
        query = list(access_token = private$.token$credentials$access_token,
                     per_page = activities_per_page,
                     page = page_number,
                     before = before_date,
                     after = after_date)
    )

    api_code <- httr::status_code(strava_activities)

    ## case of normal call
    if(api_code == 200){
        strava_activities <- httr::content(strava_activities, "text")
        strava_activities <- jsonlite::fromJSON(strava_activities)


        strava_activities <- clean_activities_list(strava_activities)

        return(strava_activities)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(strava_activities)$message))
        strava_activities <- httr::content(strava_activities, "text")
        strava_activities_json <- jsonlite::fromJSON(strava_activities)
        return(strava_activities_json)
    }

}
