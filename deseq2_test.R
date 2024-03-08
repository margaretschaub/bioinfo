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

barcode_order <- colnames(ov_matrix)

new_colData <- colData[match(barcode_order, colData$bcr_patient_barcode),]

all(colnames(ov_matrix) == rownames(new_colData))

# creating deseq object
new_colData$new_age <- factor(new_colData$new_age)
dds <- DESeqDataSetFromMatrix(countData= ov_matrix,
                       colData = new_colData,
                       design = ~ new_age)

dds

keep <- rowSums(counts(dds)) >= 10
dds<- dds[keep,]

dds

# should reference level be younger or older than 50 years? 
dds$new_age <- relevel(dds$new_age, ref= '0')

dds$new_age

plotMDS(dds)

dds <- DESeq(dds)

res <- results(dds)

res

summary(res)

res0.01 <- results(dds, alpha = 0.01)

summary(res0.01)
