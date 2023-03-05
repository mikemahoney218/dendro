test_that("multiplication works", {
  expect_snapshot(get_nodes(z, 1))
  expect_snapshot(get_nodes(z, "root"))
  expect_snapshot(get_nodes(z))
})
