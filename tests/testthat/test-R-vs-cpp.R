
if(RUN_TESTS)
{
  set.seed(20200213)
  test <- data.frame(
    x = rpois(1e6, 400),
    s = sample(paste0("species", 1:100), 1e6, replace = TRUE)
  )
  test <- test[order(test$s, -test$x), ]

  test_that("Rcpp implementation is right", {
    expect_equal(crown_helper(test$x, test$s), crown_helper_cpp(test$x, test$s))
    expect_equal(crown_helper_faster(test$x, test$s), crown_helper_cpp(test$x, test$s))
  })

  # microbenchmark::microbenchmark(
  #   crown_helper(test$x, test$s),
  #   crown_helper_faster(test$x, test$s),
  #   crown_helper_cpp(test$x, test$s)
  # )
}

