
#' Crown champions
#'
#' A simplified (ignores year submitted) tree crowning algorithm.
#'
#' @param formula A one-sided formula with three terms: circumference, height, and spread (in
#'   that order). Optionally, species can be denoted with the special function \code{special()}.
#' @param data A data.frame containing variables from \code{formula}.
#' @param subset An optional vector of subsetting.
#' @param na.action What to do with NAs.
#' @param ... Other arguments (not in use at this time)
#'
#' @return An object of class \code{"championtree_crowned"}
#' @examples
#'   data(champions)
#'   crown(~ circumference + height + spread + species(circumference), data = champions)
#' @export
crown <- function(formula, data, subset, na.action, ...)
{
  Call <- match.call()

  idx <- match(c("formula", "data", "subset", "na.action"), names(Call), nomatch = 0L)
  if(idx[1] == 0) stop("A formula argument is required.")

  temp.call <- Call[c(1L, idx)]
  temp.call[[1]] <- quote(stats::model.frame)

  specials <- "species"
  temp.call$formula <- if(missing(data))
  {
    stats::terms(formula, specials)
  } else stats::terms(formula, specials, data = data)

  childenv <- new.env(parent = environment(temp.call$formula))
  childenv$species <- function(x) x
  environment(temp.call$formula) <- childenv

  mf <- eval(temp.call, parent.frame())
  if(nrow(mf) == 0) stop("No (non-missing) observations")

  Terms <- stats::terms(mf)
  naaction <- stats::na.action(mf)

  sp.col <- attr(Terms, "specials")$species
  if(is.null(sp.col))
  {
    species <- rep("Unknown", nrow(mf))
  } else
  {
    species <- mf[[sp.col]]
    mf[[sp.col]] <- NULL
  }
  if(attr(Terms, "response") != 0) stop("'formula' should be one-sided")
  if(ncol(mf) != 3) stop("'formula' should have three terms (plus an optional species() term)")
  mf2 <- data.frame(points = round(mf[[1]] + mf[[2]] + 0.25 * mf[[3]]), species = species, idx = seq_len(nrow(mf)), stringsAsFactors = FALSE)

  mf2 <- mf2[order(mf2$species, - mf2$points), ]
  status <- crown_helper_cpp(mf2$points, mf2$species)[order(mf2$idx)]

  structure(list(
    call = Call,
    fitted = status,
    terms = Terms,
    na.action = naaction
  ), class = "championtree_crowned")
}

# #' @export
print.championtree_crowned <- function(x, ...)
{
  cat("An object of class 'championtree_crowned'\n")
  invisible(x)
}
