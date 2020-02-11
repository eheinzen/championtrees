#' Create a champion tree object
#' 
#' Create a champion tree object
#' @param circumference The circumference of the tree, in inches
#' @param height The height of the tree, in feet
#' @param spread The spread of the tree's crown, in feet
#' @param common The tree's common name
#' @param scientific The tree's scientific name
#' @return An object of class "championtree"
#' @examples
#'  champion_tree(1020, 274, 107)
#' @export
champion_tree <- function(circumference, height, spread, common="unknown", scientific="unknown")
{
  structure(list(circumference = circumference, height = height, spread = spread,
                 common = common, scientific = scientific,
                 points = circumference + height + spread/4), class = "champion_tree")
}

#' @export
print.champion_tree <- function(x, ...)
{
  cat("Common: ", x$common,
      "\nScientific: ", x$scientific, "\nPoints: ",
      x$points, sep = "")
  invisible(x)
}
