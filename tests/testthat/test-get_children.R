test_that("get children works", {
  expect_identical(
    get_children(z, 1),
    c(2L, 3L)
  )
})
