test_that("dropping nodes works", {
  expect_identical(
    (z |> drop_node(4))@size,
    3L
  )
})
