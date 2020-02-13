
if(RUN_TESTS)
{
  ct1 <- champion_tree(20, 40, 25)
  ct2 <- champion_tree(20, 30, 20)
  test_that("Ops works with two trees", {
    expect_true(ct1 >= ct2)
    expect_true(ct1 > ct2)
    expect_false(ct1 == ct2)
    expect_error(ct1 + ct2)
  })
  test_that("Ops works with one tree and a number", {
    expect_true(ct1 >= 60)
    expect_true(ct1 > 60)
    expect_true(ct1 == 66)
    expect_error(ct1 + 66)
  })
}
