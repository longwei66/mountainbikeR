#' cleanActivitiesList
#'
#' a function to clean strava actities
#'
#' @param activities json activities returnd by getActivities
#'
#' @return activities of the page
#' @export
#' @import dplyr
#' @import data.table
#'
#'
#' @examples
#' \dontrun{
#' cleanActivities(my_activities)
#' }
cleanActivitiesList <- function(activities = NULL){


    ## test input
    if(is.null(activities)){ stop("activities cannot be NULL")}

    ## clean activities.
    ## ------------------
    ## deal with nested data.frame start_latlng
    start_latlng <- data.table::rbindlist(lapply(activities$start_latlng, as.data.frame.list), fill = TRUE)
    end_latlng <- data.table::rbindlist(lapply(activities$end_latlng, as.data.frame.list), fill = TRUE)
    map <- activities$map$summary_polyline

    ## Remove non necessary features
    activities <- dplyr::select(activities,
                                -start_latlng, -end_latlng, -map, -resource_state, -athlete,
                                -location_city, -location_state, -location_country, -from_accepted_tag)

    ## Convert to data.table
    activities <- data.table::as.data.table(activities)

    ## Some renames
    # activities <- activities %>% rename(workout.type.id = workout_type,
    #                                     moving.time.sec = moving_time,
    #                                     elapsed.time.sec = elapsed_time,
    #                                     total.elevation.gain.m = total_elevation_gain,
    #                                     activity.id = id,
    #                                     external.activity.id = external_id,
    #                                     upload.id = upload_id,
    #                                     start.date = start_date,
    #                                     start.date.local = start_date_local,
    #                                     utc.offset = utc_offset,
    #                                     achievement.count = achievement_count,
    #                                     kudos.count = kudos_count,
    #                                     comment.count = comment_count,
    #                                     athlete.count = athlete_count,
    #                                     photo.count = photo_count,
    #                                     gear.id = gear_id,
    #                                     average.speed.m.per.s = average_speed,
    #                                     max.speed.m.per.s = max_speed,
    #                                     average.temperature = average_temp,
    #                                     average.power.watts = average_watts,
    #                                     average.power.kilojoules = kilojoules,
    #                                     device.watts = device_watts,
    #                                     has.heartrate.data = has_heartrate,
    #                                     average.heartrate = average_heartrate,
    #                                     max.heartrate = max_heartrate,
    #                                     elevation.high.m = elev_high,
    #                                     elevation.low.m = elev_low,
    #                                     personal.records.count = pr_count,
    #                                     total.photo.count = total_photo_count,
    #                                     has.kudoed = has_kudoed,
    #                                     suffer.score = suffer_score,
    #                                     average.cadence = average_cadence
    # )


    ## Add back the data only for activit with start lat long
    activities[ !is.na(start_latitude) & !is.na(start_longitude), ':=' (
        start.latitude = unlist(start_latlng[ , 1]),
        start.longitude = unlist(start_latlng[ , 2]),
        end.latitude = unlist(end_latlng[ , 1]),
        end.longitude = unlist(end_latlng[ , 2])
    )]
    ## remove duplicate
    activities <- dplyr::select(activities, -start_latitude, -start_longitude)


    ## Add workout types
    activities[ , workout_type_id := workout_type]
    activities <- dplyr::select(activities, -workout_type)

    activities <- merge(x = activities, y = mountainbikeR::workout_types,
                           by.x = "workout_type_id", by.y = "workout_type_id", all.x = TRUE)


    ## Add gear name
    #activities[ , gear.name := unlist(lapply(activities$gear.id, getGearName, myGearList))]

    ## Convert Dates
    activities[ , start_date := strptime(x = start_date, format = "%Y-%m-%dT%H:%M:%SZ")]
    activities[ , start_date_local := strptime(x = start_date_local, format = "%Y-%m-%dT%H:%M:%SZ")]

    ## Add Map
    activities[ , map := map]

    return(activities)

}
