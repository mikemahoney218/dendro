get_nodes <- S7::new_generic("get_node", "x")

method(get_nodes, tree) <- function(x, node_indices = NULL) {
  if (is.null(node_indices)) node_indices <- seq.int(x@size)
  check_node_index(x, node_indices)

  x@nodes[node_indices]
}

get_node_values <- S7::new_generic("get_node_values", "x")

method(get_node_values, tree) <- function(x, node_indices = NULL) {
  if (is.null(node_indices)) node_indices <- seq.int(x@size)
  lapply(x@nodes[node_indices], \(x) x@value)
}
