#' get_athlete_stats
#'
#' Returns the activity stats of an athlete. Only includes data from activities
#'  set to Everyone visibilty.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Athletes-getStats}
#'
#' @param mbr_object a mountainbiker object
#' @param athlete_id the strava id of the athelete (must be the one logged)
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return as list with athelete stats
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object defined beforehead
#'
#' my_mbr$get_athlete_stats(
#'      athelete_id = 12345
#' )
#' }
get_athlete_stats <- function(
    mbr_object = NULL
    , athlete_id = NULL
){
    mrb_object$get_athlete_stats(
        athlete_id = athlete_id
    )
    invisible()
}



#' def_get_athlete_stats
#' @param athlete_id the strava id of the athelete (must be the one logged)
def_get_athlete_stats <- function(
    athlete_id = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(athlete_id)){
        stop("athlete_id cannot be NULL")
        }

    ## Call strave API - getActivityById
    my_stats <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/athletes/"
                                , athlete_id
                                , "/stats"
                                ),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          )
                      )


    api.code <- httr::status_code(my_stats)

    ## case of normal call
    if(api.code == 200){
        my_stats <- httr::content(my_stats, "text")
        ## convert json to list
        my_stats <- jsonlite::fromJSON(my_stats)
        message(paste0("... Success in getting athlete stats for id: ", athlete_id))
        return(my_stats)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_stats)$message))
        my_stats <- httr::content(my_stats, "text")
        my_stats <- jsonlite::fromJSON(my_stats)
        return(my_stats)
    }
}
