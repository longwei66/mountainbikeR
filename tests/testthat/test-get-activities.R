context("getActivities")

test_that("getActivities handle null values", {
    expect_error(getActivities(token = NULL), "token cannot be NULL",fixed = TRUE)
})

test_that("getActivities returns error is more than 200 activities per page", {
    expect_error(getActivities(token = "zob", activities.per.page = 250), "activities.per.page cannot be larger than 200",fixed = TRUE)
})
