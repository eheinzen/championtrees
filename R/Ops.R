
#' Compare champion tree objects
#'
#' @param e1,e2 champion_tree objects, or numbers to compare them to.
#' @export
Ops.champion_tree <- function(e1, e2)
{
  if(!(.Generic %in% c("<", ">", "<=", ">=", "==", "!=")))
    stop("'", .Generic, "' is not meaningful for 'champion_tree' objects")

  if(inherits(e1, "champion_tree")) e1 <- get_points(e1)
  if(inherits(e2, "champion_tree")) e2 <- get_points(e2)
  get(.Generic, mode = "function")(e1, e2)
}
