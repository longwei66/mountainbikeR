#' R6 Class for a strava application with authorization
#'
#' @description
#' This strava class is designed to interract with strava API using
#' a set of methods.
#' A mountainbikeR object must be initialized using the new method then
#' all other method will be availabe
#'
#' @seealso \url{https://developers.strava.com/playground}
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
        #'
        #' Requested scopes, as a comma delimited string, e.g.
        #' "activity:read_all,activity:write". Applications should request only the
        #' scopes required for the application to function normally. The scope
        #' activity:read is required for activity webhooks.
        #'
        #' \itemize{
        #'    \item read: read public segments, public routes, public profile data,
        #'    public posts, public events, club feeds, and leaderboards
        #'    \item read_all:read private routes, private segments, and private events
        #'    for the' user
        #'    \item profile:read_all: read all profile information even if the user has
        #'    set their profile visibility to Followers or Only You
        #'    \item profile:write: update the user's weight and Functional Threshold
        #'    Power (FTP), and access to star or unstar segments on their behalf
        #'    \item activity:read: read the user's activity data for activities that are
        #'     visible to Everyone and Followers, excluding privacy zone data
        #'     \item activity:read_all: the same access as activity:read, plus privacy
        #'     zone data and access to read the user's activities with visibility set to
        #'     Only You
        #'     \item activity:write: access to create manual activities and uploads, and
        #'     access to edit any activities that are visible to the app, based on
        #'     activity read access level
        #' }
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

        #' @description
        #' Returns a set of the authenticated athlete's segment efforts for a
        #' given segment.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-SegmentEfforts-getEffortsBySegmentId}
        #' @seealso \url{https://developers.strava.com/playground/#/SegmentEfforts/getEffortsBySegmentId}
        #' @param segment_id The identifier of the segment.
        #' @param page Page number
        #' @param per_page Number of items per page. Defaults to 30.
        get_segment_efforts = function(
            segment_id = NULL
            , page = NULL
            , per_page = NULL
        ){
            environment(def_get_segment_efforts) <- environment()
            def_get_segment_efforts(
                segment_id = segment_id
                , page = page
                , per_page = per_page
            )
        },

        #' @description
        #' Returns a segment effort from an activity that is owned by the
        #' authenticated athlete.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-SegmentEfforts-getSegmentEffortById}
        #' @seealso \url{https://developers.strava.com/playground/#/SegmentEfforts/getSegmentEffortById}
        #' @param effort_id the id of the specific effort to collect
        get_segment_effort = function(
            effort_id = NULL
        ){
            environment(def_get_segment_effort) <- environment()
            def_get_segment_effort(
                effort_id = effort_id
            )
        },


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
        },


        #' @description
        #' Returns the specified segment leaderboard.
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
        get_segment_leaderboard = function(
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

            environment(def_get_segment_leaderboard) <- environment()
            def_get_segment_leaderboard(
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
        },


        #' @description
        #' List of the authenticated athlete's starred segments. Private
        #' segments are filtered out unless requested by a token with
        #' read_all scope.
        #' @param page Integer, Page number
        #' @param per_page integer, Number of items per page. Defaults to 30.
        get_starred_segments = function(
            page = NULL
            , per_page = NULL
        ){

            environment(def_get_starred_segments) <- environment()
            def_get_starred_segments(
                page = page
                , per_page = per_page

            )
        },

        #' @description
        #' Returns the specified segment. read_all scope required in order to
        #' retrieve athlete-specific segment information, or to retrieve private
        #' segments.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-Segments-getSegmentById}
        #' @param segment_id the strava id of the segment
        get_segment = function(
            segment_id = NULL
        ){
            environment(def_get_segment) <- environment()
            def_get_segment(
                segment_id = segment_id
            )
        },

        ## =====================================================================
        ##      9.  Streams
        ## =====================================================================

        #' @description
        #' Returns the given activity's streams. Requires activity:read scope.
        #' Requires activity:read_all scope for Only Me activities.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-Streams-getActivityStreams}
        #' @param activity_id the strava id of the segment
        #' @param streams_types vector of esired stream types. May take the
        #' following values:
        #' "time", "latlng", "distance", "altitude", "velocity_smooth",
        #' "heartrate", "cadence", "watts", "temp", "moving", "grade_smooth"
        get_activity_streams = function(
            activity_id = NULL
            , streams_types = NULL
        ){
            environment(def_get_activity_streams) <- environment()
            def_get_activity_streams(
                activity_id = activity_id
                , streams_types = streams_types
            )
        },

        #' @description
        #' Returns a set of streams for a segment effort completed by the
        #' authenticated athlete. Requires read_all scope.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-Streams-getSegmentEffortStreams}
        #' @param effort_id The identifier of the segment effort.
        #' @param streams_types vector of esired stream types. May take the
        #' following values:
        #' "time", "latlng", "distance", "altitude", "velocity_smooth",
        #' "heartrate", "cadence", "watts", "temp", "moving", "grade_smooth"
        get_segment_effort_streams = function(
            effort_id = NULL
            , streams_types = NULL
        ){
            environment(def_get_segment_effort_streams) <- environment()
            def_get_segment_effort_streams(
                effort_id = effort_id
                , streams_types = streams_types
            )
        },

        #' @description
        #' Returns the given segment's streams. Requires read_all scope for
        #' private segments.
        #' @seealso \url{https://developers.strava.com/docs/reference/#api-Streams-getSegmentStreams}
        #' @param segment_id the strava id of the segment
        #' @param streams_types vector of esired stream types. May take the
        #' following values:
        #' "latlng", "distance", "altitude"
        get_segment_streams = function(
            segment_id = NULL
            , streams_types = NULL
        ){
            environment(def_get_segment_streams) <- environment()
            def_get_segment_streams(
                segment_id = segment_id
                , streams_types = streams_types
            )
        }


        ## =====================================================================
        ##      10. Uploads
        ## =====================================================================


    ),
    lock_objects = FALSE
)

