BiocManager::install("DESeq2")
BiocManager::install("airway")
library(DESeq2)
library(tidyverse)
library(airway)

counts_data <- read.csv('ov.csv')
head(counts_data)

colData <- read.csv('new_col.csv')


ovary <- colnames(ov_matrix)
print(ovary)
row <- rownames(colData)
print(row)

rownames(colData) <- colData$bcr_patient_barcode

all(colnames(ov_matrix) %in% rownames(colData))

all(colnames(ov_matrix) == rownames(colData))

# if order doesn't match 

barcode_order_matches <- identical(colnames(ov_matrix), barcode_column)

barcode_order <- colnames(ov_matrix)
ov_matrix <- ov_matrix[, match(barcode_order, barcode_column)]
barcode_order_matches <- identical(colnames(ov_matrix), barcode_column)

# creating deseq object
dds <- DESeqDataSetFromMatrix(countData= ov_matrix,
                       colData = colData,
                       design = ~ new_age)
# right now, only 3 samples to keep download size low. 
# design factor does not have multiple variables with current samples

keep <- rowSums(counts(dds)) >= 10
dds<- dds[Keep,]

# should reference level be younger or older than 50 years? 
dds$new_age <- relevel(dds$new_age, ref= '0')

# will not currently run due to lack of data, samples do not have diff design factor
dds <- DESeq(dds)
res <- results(dds)

# are there any tech replicates that need to be collapsed? 


