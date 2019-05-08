context("connect2strava")

test_that("connect2strava handle null values", {
    expect_error(connect2strava(strava_key = NULL, strava_secret = "test"),
                 "strava_key cannot be NULL",fixed = TRUE)
    expect_error(connect2strava(strava_key = "test", strava_secret = NULL),
                 "strava_secret cannot be NULL", fixed = TRUE)
})
