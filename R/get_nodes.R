#' Extract nodes from a tree
#'
#' @param x The tree to extract nodes from.
#' @param node_indices The index of nodes to extract from the tree.
#'
#' @return A list of nodes.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   add_node(parent = 2L) |>
#'   get_nodes(c(1, 2))
#'
#' @include classes.R
#' @rdname get_nodes
#' @export get_nodes
get_nodes <- S7::new_generic("get_node", "x")

method(get_nodes, tree) <- function(x, node_indices = NULL) {
  if (!is.null(node_indices)) {
    check_node_index(x, node_indices)
    return(x@nodes[node_indices])
  }

  x@nodes
}

#' Extract nodes values from a tree
#'
#' @param x The tree to extract node values from.
#' @param node_indices The index of nodes to extract from the tree.
#'
#' @return A list of node values.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L, value = list("value one!")) |>
#'   add_node(parent = 2L, value = list("value two!")) |>
#'   get_node_values(c(2, 3))
#'
#' @include classes.R
#' @rdname get_node_values
#' @export get_node_values
get_node_values <- S7::new_generic("get_node_values", "x")

method(get_node_values, tree) <- function(x, node_indices = NULL) {
  nodes <- x@nodes
  if (!is.null(node_indices)) {
    nodes <- nodes[node_indices]
  }
  lapply(nodes, \(x) x@value)
}
