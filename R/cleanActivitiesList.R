#' cleanActivitiesList
#'
#' a function to clean strava actities
#'
#' @param activities json activities returnd by getActivities
#'
#' @return activities of the page
#' @export
#' @importFrom dplyr select %>%
#' @importFrom data.table rbindlist as.data.table
#' @importFrom rlang .data
#' @importFrom anytime anytime
#'
#'
#' @examples
#' \dontrun{
#' cleanActivities(my_activities)
#' }
cleanActivitiesList <- function(activities = NULL){

    ## test input
    if(is.null(activities)){ stop("activities cannot be NULL")}

    ## Dealing with no visible global function definition for ‘:=’
    # https://cran.r-project.org/web/packages/data.table/vignettes/datatable-importing.html
    `:=` = function(...) NULL


    ## clean activities.
    ## ------------------
    ## deal with nested data.frame start_latlng
    start_latlng <- data.table::rbindlist(lapply(activities$start_latlng, as.data.frame.list), fill = TRUE)
    end_latlng <- data.table::rbindlist(lapply(activities$end_latlng, as.data.frame.list), fill = TRUE)
    map <- activities$map$summary_polyline

    ## Remove non necessary features
    activities <- activities %>% select(
                                -.data$start_latlng, -.data$end_latlng,
                                -.data$map, -.data$resource_state, -.data$athlete,
                                -.data$location_city, -.data$location_state,
                                -.data$location_country, -.data$from_accepted_tag)

    ## Convert to data.table
    activities <- data.table::as.data.table(activities)


    ## Add back the data only for activit with start lat long
    #  first deal with “undefined global functions or variables”
    #  https://cran.r-project.org/web/packages/data.table/vignettes/datatable-importing.html
    start_latitude = start_longitude  = NULL

    activities[ !is.na(start_latitude) & !is.na(start_longitude), ':=' (
        start.latitude = unlist(start_latlng[ , 1]),
        start.longitude = unlist(start_latlng[ , 2]),
        end.latitude = unlist(end_latlng[ , 1]),
        end.longitude = unlist(end_latlng[ , 2])
    )]
    ## remove duplicate
    activities <- activities %>% dplyr::select(-.data$start_latitude,
                                               -.data$start_longitude)


    ## Add workout types
    workout_type = workout_type_id = NULL

    activities[ , workout_type_id := workout_type]
    activities <- activities %>% dplyr::select(-.data$workout_type)

    activities <- merge(
        x = activities, y = mountainbikeR::workout_types,
        by.x = "workout_type_id", by.y = "workout_type_id", all.x = TRUE)


    ## Add gear name
    #activities[ , gear.name := unlist(lapply(activities$gear.id, getGearName, myGearList))]

    ## Convert Dates
    start_date = start_date_local = NULL
    activities[ , start_date := anytime::anytime(x = start_date)]
    activities[ , start_date_local := anytime::anytime(x = start_date_local)]

    ## Add Map
    activities[ , map := map]

    return(activities)

}
