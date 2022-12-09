install.packages('vcfR')
devtools::install_github(repo="knausb/vcfR")
library(vcfR)
data(vcfR_example)
vcf
queryMETA(vcf)
vcf_sample <- read.vcfR("All.raw.snp copy.vcf")
queryMETA(vcf_sample)
vcf@gt[1:6, 1:2]
vcf_sample@gt[1:6, 1:2]
vcf_sample@gt[, 1:2]
vcf_gt <- vcf@gt[1:6, 1:2]
vcf_gt
write.vcf(vcf_sample, nrows = 25, cols = 10, "sample.vcf")
vector1 <- c(1:10)
vcf_sample <- read.vcfR("All.raw.snp copy.vcf", nrows = 25, cols = vector1)
head(vcf_sample)
write.vcf(vcf_sample, "individual1.vcf")
vcf_sample <- read.vcfR("sample.vcf")
sample_input <- system.file("extdata", "sample.fasta", package = "oncoAnalysis")
?system.file
citation("vcfR")
individual1 <- read.vcfR("individual1.vcf")
queryMETA(individual1)
getFIX(individual1)
individual_gt <- individual1@gt
load("./individual1.vcf")
individual_meta <- queryMETA(individual1)
individual_fix <- getFIX(individual1)
individual_gt <- individual1@gt
individual_info <- list(individual_meta, individual_fix, individual_gt)
individual_info[1]
individual1_nometa <- cbind(individual_fix, individual_gt)
individual1_nometa
patterns <- c("1/1", "0/0")
filtered <- subset(individual1_nometa, grepl(paste(patterns, collapse="|"), individual1_nometa[,c(10)]))
write.table(individual_meta, file = "individual1.txt", sep = "\t",
            row.names = TRUE, col.names = NA)
individual_meta <- individual1@meta
individual_fix <- individual1@fix
individual_gt <- individual1@gt
filtered
write.table(individual_meta, file = "sample1.vcf", sep = "\t", row.names=FALSE, col.names=FALSE)
write.table(filtered, file = "sample1.vcf", sep = "\t", row.names=FALSE, col.names=TRUE, append = T)
result <- write.table(individual_meta, file = "individual1.txt", sep = "\t", row.names=FALSE, col.names=FALSE)
library(vcfR)
sample1 <- read.vcfR("sample1.vcf", skip = 1)
chrom <- create.chromR(vcf=sample1)
results <- plot(chrom)
?read.vcfR
my_plot <- recordPlot(plot(chrom)) 
plot.new()
results <- my_plot

class(chrom)
class(individual1) != "vcfR"
vector2 <- c(1:9, 11)
individual2 <- read.vcfR("All.raw.snp copy.vcf", nrows = 25, cols = vector2)
individual2@gt
write.vcf(individual2, "individual2.vcf")
vector3 <- c(1:9, 12)
individual3 <- read.vcfR("All.raw.snp copy.vcf", nrows = 25, cols = vector3)
individual3@gt
write.vcf(individual3, "individual3.vcf")
roxygen2::roxygenise()
?document()
document()


