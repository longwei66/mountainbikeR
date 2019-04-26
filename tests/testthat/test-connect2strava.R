context("connect2strava")

test_that("connect2strava handle null values", {
    expect_error(connect2strava(strava.key = NULL, strava.secret = "test"), "strava.key cannot be NULL",fixed = TRUE)
    expect_error(connect2strava(strava.key = "test", strava.secret = NULL), "strava.secret cannot be NULL", fixed = TRUE)
})
