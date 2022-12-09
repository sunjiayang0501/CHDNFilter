#' Plot the VCF file.
#'
#' A function that plots VCF file on 4 different aspects: read depth, mapping quality, 
#' quality, SNP densities
#'
#' @param filename The file name of the VCF file wish to be plotted (has to be a vcfR object, 
#' can be obtained as result of readVCF).
#'
#' @return VCF file plot on 4 different aspects: read depth, mapping quality, 
#' quality, SNP densities
#'
#' @examples
#' # Example 1:
#' # Import data in VCF(variant call format) file
#' # Note: to read VCF files, it requires installation of vcfR package
#' library("vcfR")
#' individual1 <- system.file("extdata", "individual1.vcf", package = "HeHoFilter")
#'
#' # plot using vcfPlotter()
#' my_plots <- vcfPlotter("individual1.vcf")
#'
#'@references
#' "Knaus BJ, Grünwald NJ (2016). “VcfR: an R package to manipulate and visualize VCF format data.”
#' \href{https://cran.r-project.org/web/packages/vcfR/index.html}{Link}
#'
#' vicky, et al.
#' "Finding the class of a variable in R” stackoverflow, May 22, 2016
#' \href{https://stackoverflow.com/questions/37378978/finding-the-class-of-a-variable-in-r}{Link}
#'
#' "Save Plot in Data Object in Base R (Example)” statisticsglobe
#' \href{https://statisticsglobe.com/save-plot-in-data-object-in-base-r}{Link}
#' 
#' @export
#' @importFrom vcfR create.chromR
vcfPlotter <- function(filename) {
  # Check if the input file is a vcfR object
  if (class(filename) != "vcfR") {
    stop("The input file is not a vcfR object. ")
  }
  
  # Create chromR object with create.chromR from package vcfR
  chrom <- create.chromR(vcf=filename)
  
  # Plot the chromR object just created
  my_plot <- recordPlot(plot(chrom)) 
  
  return(my_plot)
}
