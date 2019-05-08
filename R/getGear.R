#' getGear
#'
#' Get all gear detail from strava api from gears id
#'
#' @param token the strava identification token
#' @param gear.id the id of the gear
#'
#' @return the gear data as json
#' @import httr
#' @import jsonlite
#' @import data.table
#' @import dplyr
#' @export
#'
#' @examples
#' \dontrun{
#' getGear(token = myToken, gear.id = myGearId)
#' }
getGear <- function(token = NULL, gear.id = NULL){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}
    if(is.null(gear.id)){ stop("gear.id cannot be NULL")}


    ## call API to get all activities
    gear <- httr::GET("https://www.strava.com/",
                                   path = paste0("api/v3/gear/",gear.id),
                                   query = list(access_token = myToken, per_page = 200)
    )
    gear <- httr::content(gear, "text")

    gear.data <- as.data.table(jsonlite::fromJSON(gear)) %>% rename(gear_name = name, gear_id = id)

    return(gear.data)
}
