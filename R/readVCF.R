#' Import the VCF file and divides it into three sections for convenience in analysis.
#'
#' A function that reads in VCF file and divides it into three sections for convenience in analysis.
#' "Meta information" section, "Fixed information" section, and "Genotype information" section.
#'
#' @param filename The file name of the VCF file wish to be read.
#'
#' @return VCF file that is divided into three sections. "The meta region", "The fix region",
#' and "The gt region". Each section can be analyzed separately.
#'
#' @examples
#' # Example 1:
#' # Import data in VCF(variant call format) file
#' # Note: to read VCF files, it requires installation of vcfR package
#' library("vcfR")
#' individual1 <- system.file("extdata", "individual1.vcf", package = "CHDNFilter")
#'
#' # Read using readVCF()
#'
#' sample1 <- readVCF(individual1)
#'
#' # Example 2:
#' # Import data in VCF(variant call format) file
#' # Note: to read VCF files, it requires installation of vcfR package
#' library("vcfR")
#' individual2 <- system.file("extdata", "individual2.vcf", package = "CHDNFilter")
#'
#' # Read using readVCF()
#'
#' sample2 <- readVCF(individual2)
#'
#' # Example 3:
#' # Import data in VCF(variant call format) file
#' # Note: to read VCF files, it requires installation of vcfR package
#' library("vcfR")
#' individual3 <- system.file("extdata", "individual3.vcf", package = "CHDNFilter")
#'
#' # Read using readVCF()
#'
#' sample3 <- readVCF(individual3)
#'
#'
#'@references
# 'Knaus BJ, Grünwald NJ (2016). “VcfR: an R package to manipulate and visualize VCF format data.”
#' \href{https://cran.r-project.org/web/packages/vcfR/index.html}{Link}
#'
#' @export
#' @importFrom vcfR read.vcfR
#'
readVCF <- function(filename) {
  # Read the VCF file using read.vcfR from package vcfR
  vcffile <- vcfR::read.vcfR(file = filename)

  # Store the variant calls in sections
  # The meta region
  individual_meta <- vcffile@meta
  # The fix region
  individual_fix <- vcffile@fix
  # The gt region
  individual_gt <- vcffile@gt

  individual_info <- list(individual_meta, individual_fix, individual_gt)

  return(individual_info)
}

# [END]
