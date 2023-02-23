get_children <- S7::new_generic("get_children", "x")

method(get_children, tree) <- function(x, node_index) {
  check_node_index(node_index)

  get_nodes(x, node_index)[[1]]@children

}

get_all_children <- S7::new_generic("get_all_children", "x")

method(get_all_children, tree) <- function(x, node_index) {
  check_node_index(node_index)
  if (is.character(node_index)) {
    node_index <- setNames(
      get_nodes(x, node_index)[[1]]@index,
      node_index
    )
  }

  pull_children <- function(x, node_index) {
    children <- get_children(x, node_index)
    if (length(children) > 0) {
      c(
        node_index,
        pull_children(x, children)
      )
    } else {
      node_index
    }
  }

  pull_children(x, node_index)

}
