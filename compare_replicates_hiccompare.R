library(Rcpp)
library(HiCcompare)

# Extract the matrices in sparse upper triangular format using straw (for installation see: https://github.com/aidenlab/straw/wiki)
rep1 <- strawr::straw("NONE", "rep1-inter_30.hic", "2L", "2L", "BP", 10000)
rep2 <- strawr::straw("NONE", "rep2-inter_30.hic", "2L", "2L", "BP", 10000)

# Create hic.table object
rep.table <- create.hic.table(rep1, rep2, chr = '3R')

# Normalize the data
hic.table <- hic_loess(rep.table, Plot = TRUE, Plot.smooth = FALSE)

# Check the filtering to determine a reasonable value for filtering parameter
filter_params(hic.table)

# Filter out interactions with A < 15
hic.table <- hic_compare(hic.table, A.min = 15, adjust.dist = TRUE, p.method = 'fdr', Plot = TRUE)

MD.plot2(M = hic.table$adj.M, D = hic.table$D, hic.table$p.value, smooth = FALSE)