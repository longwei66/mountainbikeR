context("getGear")

test_that("getGear handle null values", {
    expect_error(getGear(token = NULL, gear.id = "id"), "token cannot be NULL",fixed = TRUE)
    expect_error(getGear(token = "xx", gear.id = NULL), "gear.id cannot be NULL",fixed = TRUE)
})
