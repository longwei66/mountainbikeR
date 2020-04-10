#' get_athlete_zones
#'
#' Returns the activity zones of an athlete. Only includes data from activities
#'  set to Everyone visibilty.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Athletes-getLoggedInAthleteZones}
#'
#' @param mbr_object a mountainbiker object
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return as list with athelete zones
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object defined beforehead
#'
#' my_mbr$get_athlete_zones()
#' }
get_athlete_zones <- function(
    mbr_object = NULL
){
    mrb_object$get_athlete_zones()
    invisible()
}



#' def_get_athlete_zones
def_get_athlete_zones <- function(){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }

    ## Call strave API - getActivityById
    my_zones <- httr::GET(
        "https://www.strava.com/"
        , path = "api/v3/athlete/zones"
        , query = list(
            access_token = private$.token$credentials$access_token
            )
        )


    api.code <- httr::status_code(my_zones)

    ## case of normal call
    if(api.code == 200){
        my_zones <- httr::content(my_zones, "text")
        ## convert json to list
        my_zones <- jsonlite::fromJSON(my_zones)
        message("... Success in getting athlete zones")
        return(my_zones)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_zones)$message))
        my_zones <- httr::content(my_zones, "text")
        my_zones <- jsonlite::fromJSON(my_zones)
        return(my_zones)
    }
}
