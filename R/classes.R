#' Node objects for collecting within trees
#'
#' These objects aren't particularly useful on their own, and are usually
#' called via [add_node()] to automatically assign a unique index.
#'
#' @param index The index of the node in the list of nodes stored in the tree
#' object. Calculated automatically when using [add_node()].
#' @param value Any data or other attributes associated with the node.
#' @param parent Integer: the index of the node's parent. Only one root node is
#' allowed per tree.
#' @param children Integer: the index of any children of the node. Leaf nodes
#' should have a value of `NA_integer_`.
#'
#' @return An object of class `"dendro::node", "S7_object"`
#'
#' @examples
#' node(0L)
#'
#' node(0L, list(a = 2))
#'
#' @export node
node <- S7::new_class(
  "node",
  properties = list(
    index = S7::class_integer,
    value = S7::class_list,
    parent = S7::class_integer,
    children = S7::class_integer
  ),
  validator = function(self) {
    if (length(self@index) != 1) {
      "@index must be length 1"
    }
  },
  package = "dendro"
)

#' Tree objects
#'
#' This is the primary class implemented in this package.
#'
#' @param nodes A list of nodes, as created via [node()], which form a tree.
#'
#' @return An object of class `"dendro::tree", "S7_object"`
#'
#' @examples
#' tree()
#' tree(list(node(1L)))
#'
#' @export tree
tree <- S7::new_class(
  "tree",
  properties = list(
    size = S7::new_property(
      S7::class_integer,
      getter = function(self) {
        self@nodes |>
          length()
      }
    ),
    next_idx = S7::new_property(
      S7::class_integer,
      getter = function(self) {
        if (self@size == 0) return(1L)
        get_nodes(self) |>
          vapply(
            \(x) x@index,
            integer(1)
          ) |>
          max() + 1L
      }
    ),
    root = S7::new_property(
      S7::class_integer,
      getter = function(self) {
        if (self@size == 0) return(NA_integer_)
        if (self@size == 1) return(self@nodes[[1]]@index)

        get_nodes(self) |>
          vapply(
            \(x) x@parent,
            integer(1)
          ) |>
          is.na() |>
          which()

      }
    ),
    nodes = S7::class_list
  ),
  validator = function(self) {
    if (length(self@root) == 0) {
      "@root is of length 0; did you forget to start by adding the parent node?"
    } else if (length(self@root) != 1) {
      "@root is longer than 1; did you accidentally add unconnected nodes?"
    }
  },
  package = "dendro"
)
