#' Convert a data frame to tree format
#'
#' @param x The data frame to convert.
#' @param id_columns The columns to use to split the data frame into a tree,
#' as a character vector. Should be ordered from least specific (upper branches)
#' to most (lowest branches).
#' @param root_name Optionally, the name of the root node.
#' @param drop_id_columns Logical: Should the columns used to split the data
#' frame into nodes be included as values in each node?
#'
#' @examplesIf rlang::is_installed("treemap")
#' data(GNI2014, package = "treemap")
#' as_tree(GNI2014, id_columns = c("continent"), root_name = "world")
#' as_tree(GNI2014, id_columns = c("continent", "country"), root_name = "world")
#'
#' @export
as_tree <- S7::new_generic("as_tree", "x")

method(as_tree, S7::class_data.frame) <- function(
    x,
    id_columns,
    root_name = NULL,
    drop_id_columns = TRUE
) {
  template <- head(x, 0)
  if (drop_id_columns) {
    template <- template[setdiff(names(template), id_columns)]
  }

  output <- tree() |> add_node(name = root_name)

  node_ids <- unique(x[id_columns])
  nodes <- vector("list", length = nrow(node_ids) + 1)
  nodes[[1]] <- node(index = 1L, parent = NA_integer_)
  names(nodes)[[1]] <- root_name

  node_counter <- 2L
  make_nodes <- function(x, id_columns, idx = 1L, parent_id = 1L) {
    unique_vals <- unique(x[[id_columns[[idx]]]])

    if (idx == length(id_columns)) {
      for (lvl in unique_vals) {
        nodes[[node_counter]] <<- node(
          index = node_counter,
          value = if (drop_id_columns) {
            x[x[[id_columns[[idx]]]] == lvl, setdiff(names(x), id_columns)]
          } else {
            x[x[[id_columns[[idx]]]] == lvl, ]
          },
          parent = parent_id
        )
        names(nodes)[[node_counter]] <<- lvl

        nodes[[parent_id]]@children <<- c(
          nodes[[parent_id]]@children,
          node_counter
        )

        node_counter <<- node_counter + 1L
      }
    } else {
      for (lvl in unique_vals) {
        nodes[[node_counter]] <<- node(
          index = node_counter,
          value = template,
          parent = parent_id
        )
        names(nodes)[[node_counter]] <<- lvl

        nodes[[parent_id]]@children <<- c(
          nodes[[parent_id]]@children,
          node_counter
        )

        node_counter <<- node_counter + 1L

        make_nodes(
          x[x[[id_columns[[idx]]]] == lvl, ],
          id_columns,
          idx = idx + 1L,
          parent_id = node_counter - 1L
        )
      }
    }
  }

  make_nodes(x, id_columns)
  tree(nodes)

}
