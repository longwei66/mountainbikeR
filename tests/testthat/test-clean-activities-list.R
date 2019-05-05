context("cleanActivitiesList")

test_that("cleanActivitiesList handle null values", {
    expect_error(cleanActivitiesList(activities = NULL), "activities cannot be NULL",fixed = TRUE)
})


my_activities_test_file <- system.file("extdata", "my_activities_test.Rda", package = "mountainbikeR")
load(my_activities_test_file)
my_activities_test_clean_file <- system.file("extdata", "my_activities_test_clean.Rda", package = "mountainbikeR")
load(my_activities_test_clean_file)


test_that("cleanActivitiesList handle example", {
    expect_equal(cleanActivitiesList(my_activities_test), my_activities_test_clean)
})
