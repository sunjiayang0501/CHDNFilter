library("vcfR")

test_that("hetFilter works", {
  individual1 <- system.file("extdata", "individual1.vcf", package = "CHDNFilter")

  # Read using read.vcfR() or readVCF
  sample_1 <- vcfR::read.vcfR(individual1)
  sample_2 <- readVCF(individual1)

  # Filter out heterozygous mutations.
  hetFilterResults_1 <- hetFilter(sample_1)
  hetFilterResults_2 <- hetFilter(sample_2)

  # Check expected type
  expect_true(is.data.frame(hetFilterResults_1))
  expect_true(is.data.frame(hetFilterResults_2))
  expect_equal(nrow(hetFilterResults_1), 0)
  expect_equal(nrow(hetFilterResults_2), 0)

})
