test_that("as_tree works", {
  expect_snapshot(as_tree(x, c("x", "y", "z")))
  expect_snapshot(as_tree(x, c("z", "y", "x")))
})
