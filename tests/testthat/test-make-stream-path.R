context("makeStreamPath")

test_that("makeStreamPath handle null values", {
    expect_error(makeStreamPath(activity.id = NULL, stream.type = "yy"), "activity.id cannot be NULL", fixed = TRUE)
    expect_error(makeStreamPath(activity.id = "xx", stream.type = NULL), "stream.type cannot be NULL", fixed = TRUE)
})
