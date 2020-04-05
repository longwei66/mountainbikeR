context("connect2strava")

test_that("connect2strava handle null values", {
    expect_error(connect2strava(strava_key = NULL, strava_secret = "test"),
                 "strava_key cannot be NULL",fixed = TRUE)
    expect_error(connect2strava(strava_key = "test", strava_secret = NULL),
                 "strava_secret cannot be NULL", fixed = TRUE)
})


mountainbikeR::connect2strava(
    my_app_name = Sys.getenv("STRAVA_APP_NAME")
    , my_client_id = Sys.getenv("STRAVA_CLIENT_ID")
    , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
    , cache = FALSE)
