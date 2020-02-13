
if(RUN_TESTS)
{
  data("champions")
  test_that("crown() throws the right errors", {
    expect_error(crown(status ~ circumference + height + spread + species(scientific_name), data = champions), "one-sided")
    expect_error(crown( ~ circumference + height + spread + scientific_name, data = champions), "three terms")
    expect_error(crown( ~ circumference + height, data = champions), "three terms")
  })
}
