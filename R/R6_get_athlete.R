#' get_athlete
#'
#' Returns the logged athlete
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Athletes-getLoggedInAthlete}
#'
#' @param mbr_object a mountainbiker object
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return a list with athlete details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is an existing mountainbikeR object
#'
#' my_mbr$get_athlete(
#' )
#' }
get_athlete <- function(
    mbr_object = NULL
){
    mrb_object$get_athlete()
    invisible()
}




def_get_athlete <- function(){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }

    ## Call strave API - getActivityById
    my_athlete <- httr::GET("https://www.strava.com/",
                            path = "api/v3/athlete/",
                      query = list(
                          access_token = private$.token$credentials$access_token
                          )
                      )


    api.code <- httr::status_code(my_athlete)

    ## case of normal call
    if(api.code == 200){
        my_athlete <- httr::content(my_athlete, "text")
        ## convert json to list
        my_athlete <- jsonlite::fromJSON(my_athlete)
        message("... Success in getting athlete")
        return(my_athlete)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_athlete)$message))
        my_athlete <- httr::content(my_athlete, "text")
        my_athlete <- jsonlite::fromJSON(my_athlete)
        return(my_athlete)
    }


}
