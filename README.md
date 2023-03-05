
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dendro

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/dendro)](https://CRAN.R-project.org/package=dendro)
[![Codecov test
coverage](https://codecov.io/gh/mikemahoney218/dendro/branch/main/graph/badge.svg)](https://app.codecov.io/gh/mikemahoney218/dendro?branch=main)
[![R-CMD-check](https://github.com/mikemahoney218/dendro/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mikemahoney218/dendro/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

dendro is an experimental package I wrote to play around with tree
structures and the new (as of this writing)
[S7](https://github.com/RConsortium/OOP-WG/) class system. It’s not
intended for serious workloads, but rather as a way for me to kick the
wheels on S7 and toy with recursive operations.

## Installation

You can install the development version of dendro like so:

``` r
# install.packages("remotes")
remotes::install_github("RConsortium/OOP-WG")
remotes::install_github("mikemahoney218/dendro")
```

## Example

The core of the dendro package lives in two S7 classes, `node()` and
`tree()`. The node class has four slots: the index value of the node
within the tree, the index of the node’s parent, and the index of any
children the node has, as well as a list slot for any attributes you
want to attach to the node:

``` r
library(dendro)
#> 
#> Attaching package: 'dendro'
#> The following object is masked from 'package:base':
#> 
#>     @

node(
  index = 1L,
  value = list(), 
  parent = 0L,
  children = 2L
)
#> <dendro::node>
#>  @ index   : int 1
#>  @ value   : list()
#>  @ parent  : int 0
#>  @ children: int 2
```

Nodes are almost entirely unvalidated – there’s no requirement a parent
knows about all its children, that a node’s parent exists, that the
node’s index is unique, or that its index corresponds to its location in
a tree. Node-creating code is responsible for those validations.

The tree class is slightly more interesting. Its constructor function
takes a list of nodes:

``` r
tree(list(node(1L)))
#> <dendro::tree>
#>  @ size        : int 1
#>  @ node_indices: int 1
#>  @ next_idx    : int 2
#>  @ root        : int 1
#>  @ nodes       :List of 1
#>  .. $ : <dendro::node>
#>  ..  ..@ index   : int 1
#>  ..  ..@ value   : list()
#>  ..  ..@ parent  : int(0) 
#>  ..  ..@ children: int(0)
```

The tree class also doesn’t do a ton of validation; it only checks to
make sure that every node (save for one, the root node) has a parent.
However, this class also comes with a few useful dynamic slots: `size`,
the number of nodes in the tree; `node_indices`, a vector of all `index`
values in the nodes list; `next_idx`, a safe position for the next node
to be inserted at, and `root`, the index of the root node in the nodes
list.

There’s also a handful of methods defined for tree classes. For
instance, `add_node()` will automatically add a node at the next
available index, for programmatic tree construction:

``` r
example_tree <- tree() |>
  add_node(name = "root") |>
  add_node(list(), parent = 1L) |>
  add_node(list(), parent = 1L) |>
  add_node(list(), parent = 2L) |>
  add_node(list(), parent = 4L)

example_tree
#> <dendro::tree>
#>  @ size        : int 5
#>  @ node_indices: Named int [1:5] 1 2 3 4 5
#>  .. - attr(*, "names")= chr [1:5] "root" "" "" "" ...
#>  @ next_idx    : int 6
#>  @ root        : Named int 1
#>  .. - attr(*, "names")= chr "root"
#>  @ nodes       :List of 5
#>  .. $ root: <dendro::node>
#>  ..  ..@ index   : int 1
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int NA
#>  ..  ..@ children: int [1:2] 2 3
#>  .. $     : <dendro::node>
#>  ..  ..@ index   : int 2
#>  ..  ..@ value   : list()
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: int 4
#>  .. $     : <dendro::node>
#>  ..  ..@ index   : int 3
#>  ..  ..@ value   : list()
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: int(0) 
#>  .. $     : <dendro::node>
#>  ..  ..@ index   : int 4
#>  ..  ..@ value   : list()
#>  ..  ..@ parent  : int 2
#>  ..  ..@ children: int 5
#>  .. $     : <dendro::node>
#>  ..  ..@ index   : int 5
#>  ..  ..@ value   : list()
#>  ..  ..@ parent  : int 4
#>  ..  ..@ children: int(0)
```

Note that `add_node()` is relatively slow, as the tree is re-validated
after each call to `add_node()`. To make an entirely new tree from
scratch, it’s usually faster to call `tree()` with a list of nodes
instead.

You can call `drop_node()` to drop nodes from the tree. Note that all
descendants of the node will be dropped as well, as dendro doesn’t allow
multiple roots in a tree:

``` r
example_tree |> 
  drop_node(1)
#> <dendro::tree>
#>  @ size        : int 0
#>  @ node_indices: NULL
#>  @ next_idx    : int 1
#>  @ root        : int NA
#>  @ nodes       : Named list()
```

``` r
# Get the depth of a node in the tree
example_tree |> 
  node_depth(5)
#> [1] 4

# Get the distance between two nodes in the tree
example_tree |> 
  distance_to_target(1, 5)
#> [1] 3

# Get the indices of the children for a node
example_tree |> 
  get_children(1)
#> [1] 2 3

# Get the indices of _all_ descendants for a node
example_tree |> 
  get_all_descendants(1)
#> [1] 1 2 3 4 5

# Get node objects from a tree
example_tree |> 
  get_nodes(1)
#> $root
#> <dendro::node>
#>  @ index   : int 1
#>  @ value   :'data.frame':    0 obs. of  0 variables
#>  @ parent  : int NA
#>  @ children: int [1:2] 2 3

# Get the value slot of a node object from a tree
example_tree |> 
  get_node_values(1)
#> $root
#> data frame with 0 columns and 0 rows
```

There’s also a function, `as_tree`, for converting data frames to tree
formats:

``` r
data.frame(x = letters[1:4], y = letters[25:26]) |> 
  as_tree(c("x", "y"), root_name = "root")
#> <dendro::tree>
#>  @ size        : int 9
#>  @ node_indices: Named int [1:9] 1 2 3 4 5 6 7 8 9
#>  .. - attr(*, "names")= chr [1:9] "root" "a" "y" "b" ...
#>  @ next_idx    : int 10
#>  @ root        : Named int 1
#>  .. - attr(*, "names")= chr "root"
#>  @ nodes       :List of 9
#>  .. $ root: <dendro::node>
#>  ..  ..@ index   : int 1
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int NA
#>  ..  ..@ children: Named int [1:4] 2 4 6 8
#>  .. .. .. - attr(*, "names")= chr [1:4] "a" "b" "c" "d"
#>  .. $ a   : <dendro::node>
#>  ..  ..@ index   : int 2
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int 3
#>  .. .. .. - attr(*, "names")= chr "y"
#>  .. $ y   : <dendro::node>
#>  ..  ..@ index   : int 3
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 2
#>  ..  ..@ children: int(0) 
#>  .. $ b   : <dendro::node>
#>  ..  ..@ index   : int 4
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int 5
#>  .. .. .. - attr(*, "names")= chr "z"
#>  .. $ z   : <dendro::node>
#>  ..  ..@ index   : int 5
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 4
#>  ..  ..@ children: int(0) 
#>  .. $ c   : <dendro::node>
#>  ..  ..@ index   : int 6
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int 7
#>  .. .. .. - attr(*, "names")= chr "y"
#>  .. $ y   : <dendro::node>
#>  ..  ..@ index   : int 7
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 6
#>  ..  ..@ children: int(0) 
#>  .. $ d   : <dendro::node>
#>  ..  ..@ index   : int 8
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int 9
#>  .. .. .. - attr(*, "names")= chr "z"
#>  .. $ z   : <dendro::node>
#>  ..  ..@ index   : int 9
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 8
#>  ..  ..@ children: int(0)

data.frame(x = letters[1:4], y = letters[25:26]) |> 
  as_tree(c("y", "x"), root_name = "root")
#> <dendro::tree>
#>  @ size        : int 7
#>  @ node_indices: Named int [1:7] 1 2 3 4 5 6 7
#>  .. - attr(*, "names")= chr [1:7] "root" "y" "a" "c" ...
#>  @ next_idx    : int 8
#>  @ root        : Named int 1
#>  .. - attr(*, "names")= chr "root"
#>  @ nodes       :List of 7
#>  .. $ root: <dendro::node>
#>  ..  ..@ index   : int 1
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int NA
#>  ..  ..@ children: Named int [1:2] 2 5
#>  .. .. .. - attr(*, "names")= chr [1:2] "y" "z"
#>  .. $ y   : <dendro::node>
#>  ..  ..@ index   : int 2
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int [1:2] 3 4
#>  .. .. .. - attr(*, "names")= chr [1:2] "a" "c"
#>  .. $ a   : <dendro::node>
#>  ..  ..@ index   : int 3
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 2
#>  ..  ..@ children: int(0) 
#>  .. $ c   : <dendro::node>
#>  ..  ..@ index   : int 4
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 2
#>  ..  ..@ children: int(0) 
#>  .. $ z   : <dendro::node>
#>  ..  ..@ index   : int 5
#>  ..  ..@ value   :'data.frame':  0 obs. of  0 variables
#>  ..  ..@ parent  : int 1
#>  ..  ..@ children: Named int [1:2] 6 7
#>  .. .. .. - attr(*, "names")= chr [1:2] "b" "d"
#>  .. $ b   : <dendro::node>
#>  ..  ..@ index   : int 6
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 5
#>  ..  ..@ children: int(0) 
#>  .. $ d   : <dendro::node>
#>  ..  ..@ index   : int 7
#>  ..  ..@ value   :'data.frame':  1 obs. of  0 variables
#>  ..  ..@ parent  : int 5
#>  ..  ..@ children: int(0)
```
