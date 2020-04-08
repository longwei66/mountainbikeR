#' get_segment_leaderboard
#'
#' Returns the specified segment leaderboard.
#' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getLeaderboardBySegmentId}
#'
#' @param segment_id int The identifier of the segment leaderboard.
#' @param gender string, Filter by gender. May take one of the following
#' values: M, F
#' @param age_group string summit Feature. Filter by age group. May
#' take one of the following values: 0_19, 20_24, 25_34, 35_44, 45_54,
#' 55_64, 65_69, 70_74, 75_plus
#' @param  weight_class string, filter by weight class. May take one of
#' the following values: 0_124, 125_149, 150_164, 165_179, 180_199,
#' 200_224, 225_249, 250_plus, 0_54, 55_64, 65_74, 75_84, 85_94, 95_104,
#' 105_114, 115_plus
#' @param following Boolean Filter by friends of the authenticated
#' athlete.
#' @param club_id Long,Filter by club id
#' @param date_range string, Filter by date range, will be in the
#' athlete's timezone May take one of the following values:
#' this_year, this_month, this_week, today
#' @param context_entries Integer, ??? not documented
#' @param page Integer, Page number
#' @param per_page integer, Number of items per page. Defaults to 30.
#' @importFrom httr GET status_code content http_status
#' @importFrom jsonlite fromJSON
#'
#' @return my_segment_leaderboard as list with leaderboard
#' @export
#'
#' @examples
#' \dontrun{
#' # my_mbr is a mountainbikeR object
#'
#' my_mbr$get_segment_leaderboard(

#' )
#' }
get_segment_leaderboard <- function(
    mbr_object = NULL
    , segment_id = NULL
    , gender = NULL
    , age_group = NULL
    , weight_class = NULL
    , following = NULL
    , club_id = NULL
    , date_range = NULL
    , context_entries = NULL
    , page = NULL
    , per_page = NULL
){
    mrb_object$get_segment_leaderboard(
        segment_id = segment_id
        , gender = gender
        , age_group = age_group
        , weight_class = weight_class
        , following = following
        , club_id = club_id
        , date_range = date_range
        , context_entries = context_entries
        , page = page
        , per_page = per_page
    )
    invisible()
}




def_get_segment_leaderboard <- function(
    segment_id = NULL
    , gender = NULL
    , age_group = NULL
    , weight_class = NULL
    , following = NULL
    , club_id = NULL
    , date_range = NULL
    , context_entries = NULL
    , page = NULL
    , per_page = NULL
    ){

    ## test input
    if(is.null(private$.token)){
        stop("token cannot be NULL")
    }
    if(is.null(segment_id)){
        stop("Error : segment_id must be specified")
    }

    ## Call strave API - getActivityById
    my_segment_leaderboard <- httr::GET("https://www.strava.com/",
                            path = paste0(
                                "api/v3/segments/"
                                , segment_id
                                , "/leaderboard"
                                ),
                      query = list(
                          access_token = private$.token$credentials$access_token
                          , gender = gender
                          , age_group = age_group
                          , weight_class = weight_class
                          , following = following
                          , club_id = club_id
                          , date_range = date_range
                          , context_entries = context_entries
                          , page = page
                          , per_page = per_page
                          )
                      )


    api.code <- httr::status_code(my_segment_leaderboard)

    ## case of normal call
    if(api.code == 200){
        my_segment_leaderboard <- httr::content(my_segment_leaderboard, "text")
        ## convert json to list
        my_segment_leaderboard <- jsonlite::fromJSON(my_segment_leaderboard)
        message(paste0("... Success in getting leaderboard of segment :", segment_id))
        return(my_segment_leaderboard)
    } else {
        message(paste0("something is wrong in the api code: ",
                       httr::http_status(my_segment_leaderboard)$message))
        my_segment_leaderboard <- httr::content(my_segment_leaderboard, "text")
        my_segment_leaderboard <- jsonlite::fromJSON(my_segment_leaderboard)
        return(my_segment_leaderboard)
    }


}
