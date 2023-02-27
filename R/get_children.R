#' Get the children slot from a single node in a tree
#'
#' @param x The tree to extract the node from.
#' @param node_index The node index to extract children from.
#'
#' @return The children of node `node_index`, as an integer vector.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   add_node(parent = 2L) |>
#'   get_children(1L)
#'
#' @include classes.R
#' @rdname get_children
#' @export get_children
get_children <- S7::new_generic("get_children", "x")

#' @export get_children
method(get_children, tree) <- function(x, node_index) {
  check_node_index(x, node_index)

  get_nodes(x, node_index)[[1]]@children

}

#' Get all descendants from a single node in a tree
#'
#' @param x The tree to extract the node from.
#' @param node_index The node index to extract children from.
#'
#' @return The children of node `node_index`, as an integer vector.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   add_node(parent = 2L) |>
#'   get_all_descendants(1L)
#'
#' @include classes.R
#' @rdname get_all_descendants
#' @export get_all_descendants
get_all_descendants <- S7::new_generic("get_all_descendants", "x")

#' @export get_all_descendants
method(get_all_descendants, tree) <- function(x, node_index) {
  check_node_index(x, node_index)
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

  as.vector(pull_children(x, node_index))

}
