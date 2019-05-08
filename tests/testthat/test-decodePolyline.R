context("decodePolyline")

test_that("decodePolyline handles null or empty values", {
    expect_error(decodePolyline(polyline = NULL), "polyline cannot be NULL or empty string",fixed = TRUE)
    expect_error(decodePolyline(polyline = ""), "polyline cannot be NULL or empty string",fixed = TRUE)
})
test_that("decodePolyline handles non string values", {
    expect_error(decodePolyline(polyline = 123), "polyline must be a character string",fixed = TRUE)
})

v <- c("123","134", "890")
test_that("decodePolyline handles non unique string", {
        expect_error(decodePolyline(polyline = v), "polyline must be of length 1",fixed = TRUE)
})


polyline_test_file <- system.file("extdata", "polyline_test.Rda", package = "mountainbikeR")
load(polyline_test_file)
polyline_test_decoded_file <- system.file("extdata", "polyline_test_decoded.Rda", package = "mountainbikeR")
load(polyline_test_decoded_file)


test_that("decodePolyline handles example", {
    expect_equal(decodePolyline(polyline = polyline_test), polyline_test_decoded)
})
