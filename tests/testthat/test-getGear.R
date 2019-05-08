context("getGear")

test_that("getGear handle null values", {
    expect_error(getGear(token = NULL, gear_id = "id"), "token cannot be NULL",fixed = TRUE)
    expect_error(getGear(token = "xx", gear_id = NULL), "gear_id cannot be NULL",fixed = TRUE)
})
