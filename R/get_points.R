#' Extract points
#'
#' @param x An object
#' @param ... Other arguments
#' @name get_points
NULL

#' @rdname get_points
#' @export
get_points <- function(x, ...)
{
  UseMethod("get_points")
}
#' @rdname get_points
#' @export
get_points.champion_tree <- function(x, ...)
{
  x$points
}
