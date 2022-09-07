## Load the library edgeR
library(edgeR)

#Read the file with read counts

counts <- read.csv("18.5-25_normalized.csv", header = TRUE, row.names = 1, sep = ',')

# Convert Null values to 0
counts[is.na(counts)] <- 0

# Give condition to each column (samples) in the counts
group <- factor (c(1,1,1,1,2,2,2,2,3,3,3,3))
y <- DGEList(counts=counts,group=group)

## normalize using TMM
y <- calcNormFactors(y)

## obtain normalized data on the log2-scale
logCPMs <- cpm(y, log = TRUE, prior.count = 1)

#Write normalised result to a file
write.table(logCPMs,file= "18.5-25_CPM.txt", sep="\t", row.names = T,col.names = T,quote = F)


