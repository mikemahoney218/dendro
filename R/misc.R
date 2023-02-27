check_node_index <- function(x, node_index) {
  if (is.numeric(node_index) && any(!(node_index %in% x@node_indices))) {
    rlang::abort(
      glue::glue(
        "Node not found in tree."
      ),
      call = rlang::caller_env()
    )
  }

  if (!is.numeric(node_index) && any(!(node_index %in% names(x@node_indices)))) {
    rlang::abort(
      glue::glue(
        "Node not found in tree."
      ),
      call = rlang::caller_env()
    )
  }
}
