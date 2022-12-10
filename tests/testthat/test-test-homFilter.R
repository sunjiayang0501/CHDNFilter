library("vcfR")

test_that("homoFilter works", {
  individual1 <- system.file("extdata", "individual1.vcf", package = "CHDNFilter")

  # Read using read.vcfR() or readVCF
  sample_1 <- vcfR::read.vcfR(individual1)
  sample_2 <- readVCF(individual1)

  # Filter out heterozygous mutations.
  homFilterResults_1 <- homoFilter(sample_1)
  homFilterResults_2 <- homoFilter(sample_2)

  # Check expected type
  expect_true(is.data.frame(homFilterResults_1))
  expect_true(is.data.frame(homFilterResults_2))
  expect_equal(nrow(homFilterResults_1), 250)
  expect_equal(nrow(homFilterResults_2), 250)

})
