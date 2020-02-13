test_that("Calculations are right", {
  expect_equal(champion_tree(1, 1, 4)$points, 3)
  expect_true(is.na(champion_tree(1, 1, NA)$points))
  expect_error(champion_tree("a", 1, 1))
})
