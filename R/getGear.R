#' getGear
#'
#' Get all gear detail from strava api from gears id
#'
#' @param token the strava identification token
#' @param gear_id the id of the gear
#'
#' @return the gear data as json
#' @importFrom httr GET content
#' @importFrom  jsonlite fromJSON
#' @importFrom  data.table as.data.table
#' @importFrom dplyr rename
#' @export
#'
#' @examples
#' \dontrun{
#' getGear(token = myToken, gear_id = myGearId)
#' }
getGear <- function(token = NULL, gear_id = NULL){

    ## test input
    if(is.null(token)){ stop("token cannot be NULL")}
    if(is.null(gear_id)){ stop("gear_id cannot be NULL")}


    ## call API to get all activities
    gear <- httr::GET("https://www.strava.com/",
                                   path = paste0("api/v3/gear/",gear_id),
                                   query = list(access_token = token,
                                                per_page = 200)
    )
    gear <- httr::content(gear, "text")

    gear_data <- data.table::as.data.table(jsonlite::fromJSON(gear)) %>%
        dplyr::rename(gear_name = .data$name, gear_id = .data$id)

    return(gear_data)
}
