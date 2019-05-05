context("getActivity")

test_that("getActivity handle null values", {
    expect_error(getActivity(token = NULL), "token cannot be NULL",fixed = TRUE)
    expect_error(getActivity(token = "zob", activity_id = NULL), "activity_id cannot be NULL",fixed = TRUE)
})
test_that("getActivity handle non logical for inlcude_all_efforts", {
    expect_error(getActivity(token = "zob",
                             activity_id = 1234,
                             include_all_efforts = 2),
                 "include_all_efforts must be TRUE or FALSE",fixed = TRUE)
})



