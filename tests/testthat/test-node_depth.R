test_that("node depth", {
  expect_identical(
    node_depth(z, 1),
    1
  )

  expect_identical(
    node_depth(z, 5),
    4
  )
})
