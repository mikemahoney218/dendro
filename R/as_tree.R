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

  iter <- 0
  for (col_name in id_columns) {
    iter <- iter + 1
    if (iter == 1) {
      x <- split(x, x[[col_name]])
    } else {
      x <- lapply(x, \(y) split(y, y[[col_name]]))
    }
  }

  n_cols <- length(id_columns)
  add_items <- function(lst, name, parent, depth = 1) {
    if (depth == n_cols) {
      col_names <- names(template)
      if (drop_id_columns) col_names <- setdiff(col_names, id_columns)

      output <<- add_node(
        output,
        lst[col_names],
        name,
        parent
      )
    } else {
      output <<- add_node(output, template, name, parent)
      mapply(
        add_items,
        lst = lst,
        name = names(lst),
        MoreArgs = list(parent = output@size, depth = depth + 1),
        SIMPLIFY = FALSE
      )
    }
  }

  mapply(
    add_items,
    lst = x,
    name = names(x),
    MoreArgs = list(parent = output@size),
    SIMPLIFY = FALSE
  )

  output

}
