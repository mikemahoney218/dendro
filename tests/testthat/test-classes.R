test_that("nodes are stable", {
  expect_no_error(node(1L))
  expect_no_error(node(1L, list()))
  expect_no_error(node(1L, parent = 2L, children = c(1L)))
})

test_that("trees are stable", {
  expect_no_error(tree())
  expect_no_error(tree(list(node(1L))))
})
