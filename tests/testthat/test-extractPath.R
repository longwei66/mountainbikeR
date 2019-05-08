context("extractPath")

test_that("extractPath handles null values", {
    expect_error(extractPath(polyline = NULL), "polyline cannot be NULL or empty string",fixed = TRUE)
})


polyline_test_file <- system.file("extdata", "polyline_test.Rda", package = "mountainbikeR")
load(polyline_test_file)
polyline_test_path_file <- system.file("extdata", "polyline_test_path.Rda", package = "mountainbikeR")
load(polyline_test_path_file)


test_that("extractPath handles example", {
    expect_equal(extractPath(polyline = polyline_test,
                         id = 1234,
                         date_time = "2001-01-01"), polyline_test_path)
})
