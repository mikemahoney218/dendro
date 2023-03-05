#' Drop a node (and all its descendants) from a tree
#'
#' @param x The tree to drop nodes from.
#' @param node_index The node to drop.
#'
#' @return x, without the specified node and descendants.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   drop_node(2)
#'
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   drop_node(1)
#'
#' @include classes.R
#' @rdname drop_node
#' @export drop_node
drop_node <- S7::new_generic("drop_node", "x")

method(drop_node, tree) <- function(x, node_index) {

  check_node_index(x, node_index)

  to_drop <- get_all_descendants(x, node_index)

  parent <- x@nodes[[node_index]]@parent
  if (!is.na(parent)) {
    x@nodes[[parent]]@children <- setdiff(
      x@nodes[[parent]]@children,
      to_drop
    )
  }

  x@nodes[to_drop] <- NULL

  x
}
