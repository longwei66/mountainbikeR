#' R6 Class for a strava application with authorization
#'
#' @description
#' This strava class is designed to interract with strava API using
#' a set of methods.
#' A mountainbikeR object must be initialized using the new method then
#' all other method will be availabe
#'
#' @details
#' TBD
#' @importFrom R6 R6Class
#' @export

mountainbiker_initializer <- R6::R6Class(
    "strava_authentication_setup",

    #inherits=
    private = list(
        .client_id = NULL
        , .client_secret = NULL
        , .url_request = "https://www.strava.com/oauth/authorize?"
        , .url_authorize = "https://www.strava.com/oauth/authorize"
        , .url_access = "https://www.strava.com/oauth/token"




    ),
    active = list(
        #' @field token Shows generated token.
        token = function(){
            environment(def_token) <- environment()
            def_token()
        }
    ),
    public = list(

        ## =====================================================================
        ##      mountainbikeR strava API methods by group :
        ##
        ##      0.  Authentication
        ##      1.  Activities
        ##      2.  Athletes
        ##      3.  Clubs
        ##      4.  Gears
        ##      5.  Routes
        ##      6.  RunningRaces
        ##      7.  SegmentEfforts
        ##      8.  Segments
        ##      9.  Streams
        ##      10. Uploads
        ## =====================================================================



        ## =====================================================================
        ##      0. Authentication
        ## =====================================================================

        #' @description
        #' Create a new moutainbiker object.
        #'
        #' @param my_app_name chr string, the name of the app defined in strava
        #' @param my_client_id chr string, the ID of the app like 27881
        #' @param my_client_secret chr string, the secret as defined in strava
        #' @param my_app_scope chr string for requested scopes, as a comma delimited
        #' @param cache a logical TRUE to keep cached token, false for not.
        #' string, e.g. "activity:read_all,activity:write"
        #'
        #' @return A new `mountainbikeR object` object.
        #'
        #' @examples
        #' \dontrun{
        #' my_mb <- mountainbiker_initializer$new(
        #'     my_app_name = "mycool_app"
        #'     , my_client_id = 77777
        #'     , my_client_secret = "a super secret string"
        #'     , my_app_scope = "read,read_all,activity:read_all" #"public"
        #'     , cache = FALSE
        #'     )
        #' }
        initialize = function(
            my_app_name = NULL
            , my_client_id = NULL
            , my_client_secret = NULL
            , my_app_scope = "read,read_all,activity:read_all" #"public"
            , cache = FALSE
            ){

            environment(def_initialize) <- environment()
            def_initialize(
                my_app_name
                , my_client_id
                , my_client_secret
                , my_app_scope
                , cache
                )

        },


        ## =====================================================================
        ##      1. Activities
        ## =====================================================================

        #' @description
        #' List all activities from strava api. Returns the activities of an athlete
        #' for a specific identifier. Requires activity:read.
        #' Only Me activities will be filtered out unless requested by a token
        #' with activity:read_all.
        #'
        #' @param activities_per_page max number of item to return (must be 200 max)
        #' @param page_number the specific page number to extract
        #' @param after_date return activities after date as YYYY-MM-DD
        #' @param before_date return activities before date as YYYY-MM-DD
        get_activities = function(
            activities_per_page = 200
            , page_number = 1
            , after_date = NULL
            , before_date = NULL
        ){
            environment(def_get_activities) <- environment()
            def_get_activities(
                activities_per_page = activities_per_page
                , page_number = page_number
                , after_date = after_date
                , before_date = before_date
            )
        },


        #' @description
        #' Returns the given activity that is owned by the authenticated athlete.
        #' https://developers.strava.com/playground/#/Activities/getActivityById
        #'
        #' @param activity_id the strava id of the activity
        #' @param include_all_efforts boolean
        get_activity = function(
            activity_id = NULL
            , include_all_efforts = FALSE
        ){
            environment(def_get_activity) <- environment()
            def_get_activity(
                activity_id = activity_id
                , include_all_efforts = include_all_efforts
            )
        },

        #' @description
        #' Returns the zones of a given activity.
        #' https://developers.strava.com/docs/reference/#api-Activities-getZonesByActivityId
        #'
        #' @param activity_id the strava id of the activity
        #' @param include_all_efforts boolean
        get_activity_zones = function(
            activity_id = NULL
        ){
            environment(def_get_activity_zones) <- environment()
            def_get_activity_zones(
                activity_id = activity_id
            )
        },



        ## =====================================================================
        ##      2. Athletes
        ## =====================================================================


        #' @description
        #' Get informations about the athlete
        get_athlete = function(){
            environment(def_get_athlete) <- environment()
            def_get_athlete()
        },

        #' @description
        #' Get informations about the athlete stats
        #' @param athlete_id The identifier of the athlete. Must match the
        #' authenticated athlete.
        get_athlete_stats = function(
            athlete_id = NULL
        ){
            environment(def_get_athlete_stats) <- environment()
            def_get_athlete_stats(
                athlete_id = athlete_id
            )
        },

        #' @description
        #' Get informations about the athlete heart rate zone
        get_athlete_zones = function(){
            environment(def_get_athlete_zones) <- environment()
            def_get_athlete_zones()
        },


        ## =====================================================================
        ##      3. Clubs
        ## =====================================================================




        ## =====================================================================
        ##      4. Gears
        ## =====================================================================

        #' @description
        #' Get athlete gear description from gear id
        #' @param gear_id the id of the gear to get
        get_gear = function(
            gear_id = NULL
        ){

            environment(def_get_gear) <- environment()
            def_get_gear(gear_id = gear_id)
        },

        ## =====================================================================
        ##      5. Routes
        ## =====================================================================

        ## =====================================================================
        ##      6.  RunningRaces
        ## =====================================================================

        ## =====================================================================
        ##      7.  SegmentEfforts
        ## =====================================================================

        ## =====================================================================
        ##      8.  Segments
        ## =====================================================================

        #' @description
        #' Explore segments returns the top 10 segments matching a specified
        #'  query based on a bounding box.
        #' @param southwest_lat southwest corner latitutde
        #' @param southwest_long southwest corner longitude
        #' @param northeast_lat northeast corner latitude
        #' @param northeast_long northeast corner longitude
        #' @param activity_type Desired activity type. May take one of the
        #' following values: running, riding
        #' @param min_climbing_cat int the minimum climbing category
        #' @param max_climbing_cat int the maximum climbing category
        explore_segments = function(
            southwest_lat = NULL
            , southwest_long = NULL
            , northeast_lat = NULL
            , northeast_long = NULL
            , activity_type = NULL
            , min_climbing_cat = NULL
            , max_climbing_cat = NULL
        ){

            environment(def_explore_segments) <- environment()
            def_explore_segments(
                southwest_lat = southwest_lat
                , southwest_long = southwest_long
                , northeast_lat = northeast_lat
                , northeast_long = northeast_long
                , activity_type = activity_type
                , min_climbing_cat = min_climbing_cat
                , max_climbing_cat = max_climbing_cat
                )
        }

        ## =====================================================================
        ##      9.  Streams
        ## =====================================================================

        ## =====================================================================
        ##      10. Uploads
        ## =====================================================================


    ),
    lock_objects = FALSE
)

