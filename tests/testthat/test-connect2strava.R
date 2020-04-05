context("initi")

test_that("connect2strava handle null values", {
    expect_error(
        my_mbr <- mountainbiker_initializer$new(
            my_app_name = NULL #Sys.getenv("STRAVA_APP_NAME")
            , my_client_id = Sys.getenv("STRAVA_CLIENT_ID_")
            , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
            , my_app_scope = "read,read_all,activity:read_all"
            , cache = FALSE

        )
        , "my_app_name cannot be NULL"
        , fixed = TRUE
        )
    expect_error(
        my_mbr <- mountainbiker_initializer$new(
            my_app_name = NULL #Sys.getenv("STRAVA_APP_NAME")
            , my_client_id = Sys.getenv("STRAVA_CLIENT_ID_")
            , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
            , my_app_scope = "read,read_all,activity:read_all"
            , cache = FALSE

        )
        , "my_app_name cannot be NULL"
        , fixed = TRUE
    )
    expect_error(
        my_mbr <- mountainbiker_initializer$new(
            my_app_name = Sys.getenv("STRAVA_APP_NAME")
            , my_client_id = NULL #Sys.getenv("STRAVA_CLIENT_ID_")
            , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
            , my_app_scope = "read,read_all,activity:read_all"
            , cache = FALSE

        )
        , "my_client_id cannot be NULL"
        , fixed = TRUE
    )
    expect_error(
        my_mbr <- mountainbiker_initializer$new(
            my_app_name = Sys.getenv("STRAVA_APP_NAME")
            , my_client_id = Sys.getenv("STRAVA_CLIENT_ID_")
            , my_client_secret = NULL #Sys.getenv("STRAVA_CLIENT_SECRET")
            , my_app_scope = "read,read_all,activity:read_all"
            , cache = FALSE

        )
        , "my_client_secret cannot be NULL"
        , fixed = TRUE
    )
})


# my_mbr <- mountainbiker_initializer$new(
#     my_app_name = Sys.getenv("STRAVA_APP_NAME")
#     , my_client_id = Sys.getenv("STRAVA_CLIENT_ID_")
#     , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
#     , my_app_scope = "read,read_all,activity:read_all"
#     , cache = FALSE
#
# )

