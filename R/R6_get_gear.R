#' getGear
#'
#' Get all gear detail from strava api from gears id
#'
#' @param mbr_object a mountainbiker object
#' @param gear_id the id of the gear like b34565 for a bike
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
#' get_gear(
#'   mbr_object = myObject
#'   , gear_id = myGearId
#'   )
#' }
get_gear <- function(
    mbr_object
    , gear_id
    ){
    mbr_object$get_gear(gear_id)
    invisible()
}


#' def_get_gear
#' @param gear_id the id of the gear in strava
def_get_gear <- function(
    gear_id
    ){

    ## test input
    if(is.null(private$.token)){ stop("token cannot be NULL")}
    if(is.null(gear_id)){ stop("gear_id cannot be NULL")}

    message(gear_id)


    ## call API to get all activities
    gear <- httr::GET(
        url = "https://www.strava.com/"
        , path = paste0("api/v3/gear/",gear_id)
        , query = list(
            access_token = private$.token$credentials$access_token
            , per_page = 200
            )
    )


    api_code <- httr::status_code(gear)

    ## case of normal call
    if(api_code == 200){
        ## Get message content
        gear <- httr::content(gear, "text")

        ## clean answer
        gear_data <- jsonlite::fromJSON(gear) %>%
            data.table::as.data.table() %>%
            dplyr::rename(
                gear_name = .data$name
                , gear_id = .data$id
            )
        return(gear_data)
    } else {
        ## Generate API error message
        message(
            paste0(
                "something is wrong in the api code: "
                , httr::http_status(gear)$message)
            )
        gear <- httr::content(gear, "text")
        gear_json <- jsonlite::fromJSON(gear)
        return(gear_json)
    }
}
