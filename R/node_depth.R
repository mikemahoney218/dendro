node_depth <- S7::new_generic("node_depth", "x")

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

distance_to_target <- S7::new_generic("distance_to_target", "x")

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
