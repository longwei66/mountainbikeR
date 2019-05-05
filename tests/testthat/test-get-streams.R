context("getStreams")

test_that("getStreams handle null values", {
    expect_error(getStreams(token = NULL), "token cannot be NULL",fixed = TRUE)
    expect_error(getStreams(token = "zob", activity_id = NULL), "activity_id cannot be NULL",fixed = TRUE)
})
test_that("getStreams handle non char for stream_keys", {
    expect_error(getStreams(token = "zob",
                             activity_id = 1234,
                            stream_keys = c(2,3,4)),
                 "stream_keys must be a vector of character",fixed = TRUE)
})



