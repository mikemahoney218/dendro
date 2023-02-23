check_node_index <- function(x, node_index) {
  if (is.numeric(node_index) && max(node_index) > x@size) {
    rlang::abort(
      glue::glue(
        "Node {max(node_index)} requested, but tree only has {x@size} nodes."
      ),
      call = rlang::caller_env()
    )
  }
}
