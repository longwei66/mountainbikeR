context("getActivities")

test_that("getActivities handle null values", {
    expect_error(getActivities(token = NULL), "token cannot be NULL",fixed = TRUE)
})
