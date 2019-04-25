context("makeStreamPath")

test_that("makeStreamPath handle null values", {
    expect_error(makeStreamPath(activity.id = NULL, stream.type = NULL), fixed = TRUE)
    expect_error(makeStreamPath(activity.id = NULL), fixed = TRUE)
    expect_error(makeStreamPath(stream.type = NULL), fixed = TRUE)
})
