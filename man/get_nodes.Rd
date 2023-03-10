% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_nodes.R
\name{get_nodes}
\alias{get_nodes}
\title{Extract nodes from a tree}
\usage{
get_nodes(x, ...)
}
\arguments{
\item{x}{The tree to extract nodes from.}

\item{node_indices}{The index of nodes to extract from the tree.}
}
\value{
A list of nodes.
}
\description{
Extract nodes from a tree
}
\examples{
tree() |>
  add_node() |>
  add_node(parent = 1L) |>
  add_node(parent = 2L) |>
  get_nodes(c(1, 2))

}
