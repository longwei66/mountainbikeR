#' explore_segments
#'
#' Returns the given activity that is owned by the authenticated athlete.
#' https://developers.strava.com/playground/#/Activities/getActivityById
#'
#' @param mbr_object a mountainbiker object
#' @param southwest_lat southwest corner latitutde
#' @param southwest_long southwest corner longitude
#' @param northeast_lat northeast corner latitude
#' @param northeast_long northeast corner longitude
#' @param activity_type Desired activity type. May take one of the
#' following values: running, riding
#' @param min_climbing_cat int the minimum climbing category
#' @param max_climbing_cat int the maximum climbing category
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_segments as list with activity details
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$explore_segments(
#'      activity_id = 12345,
#'      include_all_efforts = TRUE
#' )
#' }
explore_segments <- function(
    mbr_object = NULL
    , southwest_lat = NULL
    , southwest_long = NULL
    , northeast_lat = NULL
    , northeast_long = NULL
    , activity_type = NULL
    , min_climbing_cat = NULL
    , max_climbing_cat = NULL
){
    mrb_object$explore_segments(
        southwest_lat = southwest_lat
        , southwest_long = southwest_long
        , northeast_lat = northeast_lat
        , northeast_long = northeast_long
        , activity_type = activity_type
        , min_climbing_cat = min_climbing_cat
        , max_climbing_cat = max_climbing_cat
    )
    invisible()
}




def_explore_segments <- function(
    southwest_lat = NULL
    , southwest_long = NULL
    , northeast_lat = NULL
    , northeast_long = NULL
    , activity_type = NULL
    , min_climbing_cat = NULL
    , max_climbing_cat = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(southwest_lat) |
       is.null(southwest_long) |
       is.null(northeast_lat) |
       is.null(northeast_long)){
        stop("All 4 elements of bounding box must be specified")
    }

    # defin bounding box
    my_bounds <- paste0(
        southwest_lat, ", "
        , southwest_long, ", "
        , northeast_lat, ", "
        , northeast_long
    )

    ## Call strave API - getActivityById
    my_segments <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segments/explore"
                                ),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , bounds = my_bounds
                          )
                      )


    api.code <- httr::status_code(my_segments)

    ## case of normal call
    if(api.code == 200){
        my_segments <- httr::content(my_segments, "text")
        ## convert json to list
        my_segments <- jsonlite::fromJSON(my_segments)
        message(paste0("... Success in getting top 10 segments in bounding:", my_bounds))
        return(my_segments)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segments)$message))
        my_segments <- httr::content(my_segments, "text")
        my_segments <- jsonlite::fromJSON(my_segments)
        return(my_segments)
    }


}
