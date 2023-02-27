get_nodes <- S7::new_generic("get_node", "x")

method(get_nodes, tree) <- function(x, node_indices = NULL) {
  if (!is.null(node_indices)) {
    check_node_index(x, node_indices)
    return(x@nodes[node_indices])
  }

  x@nodes
}

get_node_values <- S7::new_generic("get_node_values", "x")

method(get_node_values, tree) <- function(x, node_indices = NULL) {
  nodes <- x@nodes
  if (!is.null(node_indices)) {
    nodes <- nodes[node_indices]
  }
  lapply(nodes, \(x) x@value)
}
