#' Add a node to a tree.
#'
#'
#'
#' @include classes.R
#' @rdname add_node
#' @export add_node
add_node <- S7::new_generic("add_node", "x")


#' @export add_node
method(add_node, tree) <- function(x, value = data.frame(), name = NULL, parent = NA_integer_) {
  node_idx <- x@next_idx

  x@nodes[[node_idx]] <- node(
    index = node_idx,
    value = value,
    parent = parent
  )

  if (!is.null(name)) {
    names(node_idx) <- name
    names(x@nodes)[node_idx] <- name
  }

  if (!missing(parent)) {
    x@nodes[[parent]]@children <- c(
      get_nodes(x, parent)[[1]]@children,
      node_idx
    )
  }

  x
}
