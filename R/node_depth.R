#' Calculate depth of a node in the tree
#'
#' @param x The tree to calculate node depth in.
#' @param node_index The index of the node to calculate depth for
#'
#' @return The depth of the node as a numeric scalar.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   add_node(parent = 2L) |>
#'   node_depth(3)
#'
#' @include classes.R
#' @rdname node_depth
#' @export node_depth
node_depth <- S7::new_generic("node_depth", "x")

#' @export node_depth
method(node_depth, tree) <- function(x, node_index) {
  check_node_index(x, node_index)

  get_depth <- function(x, idx, val = 1) {
    if (is.na(x@nodes[[idx]]@parent)) {
      val
    } else {
      get_depth(x, x@nodes[[idx]]@parent, val + 1)
    }
  }

  get_depth(x, node_index)

}

#' Calculate distance between two nodes in a tree.
#'
#' @param x The tree to calculate distances within.
#' @param from The index to calculate distance "from".
#' @param to The index to calculate distance "to".
#'
#' @return Distance between nodes as a numeric scalar. If the nodes are not
#' nested, returns NA. If `to` is above `from` in the tree, distance will be
#' negative.
#'
#' @examples
#' tree() |>
#'   add_node() |>
#'   add_node(parent = 1L) |>
#'   add_node(parent = 2L) |>
#'   distance_to_target(1, 3)
#'
#' @include classes.R
#' @rdname distance_to_target
#' @export distance_to_target
distance_to_target <- S7::new_generic("distance_to_target", "x")

#' @export distance_to_target
method(distance_to_target, tree) <- function(x, from, to) {
  check_node_index(x, from)
  check_node_index(x, to)

  if (from == to) return(0)

  distance_between <- function(x, from, to, dist = 0) {
    if (from == to) {
      dist
    } else {
      lapply(
        get_nodes(x, from)[[1]]@children,
        distance_between,
        x = x,
        to = to,
        dist = dist + 1
      )
    }
  }

  distances <- unlist(distance_between(x, from, to))
  if (!is.null(distances)) return(distances)

  distances <- unlist(distance_between(x, to, from))
  if (!is.null(distances)) return(-distances)

  rlang::warn(
    glue::glue(
      "Nodes {from} and {to} don't appear to be nested in the tree. Returning NA."
    )
  )
  NA_integer_
}
