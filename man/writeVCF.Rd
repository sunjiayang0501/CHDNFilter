% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/writeVCF.R
\name{writeVCF}
\alias{writeVCF}
\title{Write manipulated variant calls into a new text file, still in VCF format.}
\usage{
writeVCF(individual_meta, filtered, file_name)
}
\arguments{
\item{individual_meta}{the meta region of the VCF wish to be written in the new file.}

\item{filtered}{Manipulated fix region together with gt region.}

\item{file_name}{The file name of the VCF file wish to be written.}
}
\value{
VCF file (text file) with three sections. "The meta region", "The fix region",
and "The gt region". Each section can be analyzed separately.
}
\description{
A function that writes manipulated variant calls into a new text file with designated name.
}
\examples{
# Example 1:
# Write in new text file using writeVCF()
writeVCF(sample1[1], homFilterResults1, "individual1_homo.vcf")

}
\references{
Nono_sad, et al.
\href{https://stackoverflow.com/questions/61172304/r-write-table-append-dataframe-to-existing-file}{Link}
}
