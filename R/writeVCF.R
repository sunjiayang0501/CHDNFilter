#' Write manipulated variant calls into a new text file, still in VCF format. 
#'
#' A function that writes manipulated variant calls into a new text file with designated name. 
#'
#' @param individual_meta the meta region of the VCF wish to be written in the new file. 
#' 
#' @param filtered Manipulated fix region together with gt region. 
#' 
#' @param fil_ename The file name of the VCF file wish to be written.
#'
#' @return VCF file (text file) with three sections. "The meta region", "The fix region", 
#' and "The gt region". Each section can be analyzed separately. 
#'
#' @examples
#' # Example 1:
#' # Write in new text file using writeVCF()
#'  
#' writeVCF(individual_meta, filtered, file_name)
#'
#'@references
#' Nono_sad, et al.
#  "R write.table append dataframe to existing file”, stackoverflow, Apr 12, 2020
#' \href{https://stackoverflow.com/questions/61172304/r-write-table-append-dataframe-to-existing-file}{Link}
#'
#' @export
writeVCF <- function(individual_meta, filtered, file_name) {
  # Check if file_name is a string that can be used for name of the result file
  if (typeof(file_name) != "character") {
    stop("The file_nmae is invalid, please use character type.")
  }
  
  write.table(individual_meta, file = file_name, sep = "\t", row.names=FALSE, col.names=FALSE)
  write.table(filtered, file = file_name, sep = "\t", row.names=FALSE, col.names=TRUE, append = T)
}

