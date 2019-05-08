context("listActivities")

test_that("listActivities handle null values", {
    expect_error(listActivities(token = NULL), "token cannot be NULL",fixed = TRUE)
})

test_that("listActivities returns error is more than 200 activities per page", {
    expect_error(listActivities(token = "zob", activities_per_page = 250), "activities_per_page cannot be larger than 200",fixed = TRUE)
})
