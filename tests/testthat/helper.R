z <- tree() |>
  add_node(name = "root") |>
  add_node(list(), parent = 1L) |>
  add_node(list(), parent = 1L) |>
  add_node(list(), parent = 2L) |>
  add_node(list(), parent = 4L)

x <- data.frame(x = 1:16, y = 1:4, z = 1:2)
