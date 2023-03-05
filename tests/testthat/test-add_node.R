test_that("adding nodes works", {
  expect_snapshot(add_node(tree(), value = list()))

  expect_snapshot(
    add_node(add_node(tree(), value = list()), parent = 1L, value = list())
  )

  expect_snapshot(
    add_node(
      add_node(tree(), value = list()),
      parent = 1L, value = list(), name = "second_node"
    )
  )
})
