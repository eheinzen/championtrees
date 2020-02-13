
#' Helper functions for crown
#'
#' @param points The number of points for each tree
#' @param species The species of each tree
#' @details Note that the vectors should be sorted by species and descending points
#' @name crown_helpers
NULL

#' @rdname crown_helpers
#' @export
crown_helper <- function(points, species)
{
  out <- tapply(points, species, FUN = function(x) {
    mx <- x[1]
    limit <- mx - max(3, 0.03 * mx)
    cochamps <- sum(x >= limit)
    ifelse(x == mx & cochamps == 1, "Champion", ifelse(x >= limit, "Co-Champion", "Loser"))
  })
  unlist(out, use.names = FALSE)
}

#' @rdname crown_helpers
#' @export
crown_helper_faster <- function(points, species)
{
  out <- tapply(points, species, FUN = function(x) {
    mx <- x[1]
    limit <- mx - max(3, 0.03 * mx)
    cochamps <- sum(x >= limit)
    out <- rep("Loser", times = length(x))
    out[x >= limit] <- if(cochamps == 1) "Champion" else "Co-Champion"
    out
  })
  unlist(out, use.names = FALSE)
}

#' @rdname crown_helpers
#' @export
crown_helper_cpp <- function(points, species)
{
  out <- crownCpp(points, c(which(!duplicated(species)) - 1L, length(species)))
  c("Loser", "Co-Champion", "Champion")[out + 1]
}

