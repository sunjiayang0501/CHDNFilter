#' Filter out homozygous mutations in VCF file
#'
#' A function that takes VCF file GT field as input, filters out all homozygous
#' mutations, outputs the homozygous mutations.
#'
#' @param individual_gt A table containing individual's genotype information
#'
#' @return Returns a table containing all homozygous mutations in this individual's
#' genotype information are the same.
#'
#' @examples
#' # Example 1:
#' # Using indivisual1 dataset available with package
#' \dontrun{
#' # Filter out homozygous mutations.
#' homFilterResults1 <- homoFilter(sample1)
#' }
#'
#' # Example 2:
#' # Using indivisual2 dataset available with package
#' \dontrun{
#' # Filter out homozygous mutations.
#' homFilterResults2 <- homoFilter(sample2)
#' }
#'
#' # Example 3:
#' # Using indivisual3 dataset available with package
#' \dontrun{
#' # Filter out homozygous mutations.
#' homFilterResults3 <- homoFilter(sample3)
#' }
#'
#' @references
#' 'The Variant Call Format (VCF) Version 4.2 Specification'
#' \href{https://samtools.github.io/hts-specs/VCFv4.2.pdf}{Link}
#'
#' 'Knaus BJ, Grünwald NJ (2016). “VcfR: an R package to manipulate and visualize VCF format data.”
#' \href{https://cran.r-project.org/web/packages/vcfR/index.html}{Link}
#'
#' user438383, et al.
#' "How is the GT field in a VCF file defined?" stackexchange, Sep 14, 2020
#' \href{https://bioinformatics.stackexchange.com/questions/14356/how-is-the-gt-field-in-a-vcf-file-defined}{Link}
#'
#' "How to Select DataFrame Columns by Index in R?" GeeksforGeeks, 28 Nov, 2021
#' \href{https://www.geeksforgeeks.org/how-to-select-dataframe-columns-by-index-in-r/}{Link}
#'
#' "Difference between Grep() vs Grepl() in R" GeeksforGeeks, 04 Jan, 2022
#' \href{https://www.geeksforgeeks.org/difference-between-grep-vs-grepl-in-r/}{Link}
#'
#' Eric C., et al.
#' "Using regexp to select rows in R dataframe" stackoverflow, Mar 1, 2012
#' \href{https://stackoverflow.com/questions/9520840/using-regexp-to-select-rows-in-r-dataframe}{Link}
#'
#' user971102, et al.
#' "grep using a character vector with multiple patterns" stackoverflow, Sep 29, 2011
#' \href{https://stackoverflow.com/questions/7597559/grep-using-a-character-vector-with-multiple-patterns}{Link}
#'
#' @export
#' @importFrom vcfR read.vcfR
#'
homoFilter <- function(individual_info) {
  # Check if input is valid
  # Check if individual_info contains all required sections
  if (length(individual_info) != 3) {
    stop("The file does not contain all required sections or have redundant parts
         , please use file with 3 sections, meta, fix, and gt, and in this order.")
  }

  # bind the data frames of fix information region and genotype information
  individual_nometa <- merge(individual_info[2], individual_info[3])

  # select rows in a dataframe where the gt is "1/1" (this stands for
  # homozygous mutation)
  patterns <- c("1/1")
  filtered <- subset(individual_nometa, grepl(paste(patterns, collapse="|"), individual_nometa[,c(10)]))

  return(filtered)
}

# [END]
