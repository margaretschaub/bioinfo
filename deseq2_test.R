BiocManager::install("DESeq2")
BiocManager::install("airway")
BiocManager::install("Glimma")
library(pheatmap)
library(DESeq2)
library(tidyverse)
library(airway)
library(dplyr)
library('Glimma')


patients_ov_matrix <- colnames(ov_matrix)
print(patients_ov_matrix)

rownames(clinical_age_design) <- clinical_age_design$bcr_patient_barcode
print(rownames(clinical_age_design))

all(colnames(ov_matrix) %in% rownames(clinical_age_design))

all(colnames(ov_matrix) == rownames(clinical_age_design))

# if order doesn't match 

barcode_order <- colnames(ov_matrix)

ordered_clin_data <- clinical_age_design[match(barcode_order, clinical_age_design$bcr_patient_barcode),]

all(colnames(ov_matrix) == rownames(ordered_clin_data))

# creating deseq object

dds <- DESeqDataSetFromMatrix(countData= ov_matrix,
                       colData = ordered_clin_data,
                       design = ~ meno_status)

dds

keep <- rowSums(counts(dds)) >= 10
dds<- dds[keep,]

dds

dds$meno_status<- relevel(dds$meno_status, ref= 'PREMENO')

dds$meno_status

dds <- DESeq(dds)

res <- results(dds)

res

# do I need to identify genes with large Cook's distances, 
# explore the counts of these genes using plotCounts() to assess their influence on the model? 

summary(res)

res0.01 <- results(dds, alpha = 0.01)

summary(res0.01)
print(res0.01)

print(length(rownames(res0.01)))

# Match gene_id to gene name
gene_metadata <- as.data.frame(rowData(tcga_ov_data))
print(head(res0.01))

gene_codes <- rownames(res0.01)
gene_names <- gene_metadata$gene_name[match(gene_codes, gene_metadata$gene_id)]
res$symbol <- gene_names

rownames(res0.01) <- gene_names
summary(res0.01)      

resultsNames(dds)

# MA Plot

plotMA(res0.01)

# Find genes of interest

significant_genes <- subset(res0.01, padj < 0.01)
print(rownames(significant_genes))

fold_change_threshold <- 1.5  # Adjust as needed
large_fold_change_genes <- subset(res, abs(log2FoldChange) > fold_change_threshold)
print(rownames(large_fold_change_genes))
important_genes <- subset(res, padj < 0.01 & abs(log2FoldChange) > fold_change_threshold)
print(rownames(important_genes))
print(important_genes)

# Create interactive report with Glimma

status <- as.numeric(res0.01$padj < .01)
anno <- data.frame(GeneID=rownames(res0.01))
tmp <- '/Users/margaretschaub/Desktop'
glMDPlot(res0.01, status=status, counts=counts(dds,normalized=TRUE),
         groups=dds$meno_status, transform=FALSE,
         samples=colnames(dds), anno=anno,
         path=tmp, folder="glimma", launch=FALSE)

browseURL(file.path(tmp,"glimma","MD-Plot.html"))

# Get data for specific genes of interest identified from plots
row_index <- which(rownames(res0.01) == 'IGKC')
result_for_gene <- res0.01[row_index, ]
print(result_for_gene)


# Alternate glimma with gene ID and symbol
status <- as.numeric(res$padj < .01)
anno <- data.frame(GeneID=rownames(res), symbol=res$symbol)
glMDPlot(res, status=status, counts=counts(dds,normalized=TRUE),
         groups=dds$meno_status, transform=FALSE,
         samples=colnames(dds), anno=anno,
         path=tmp, folder="glimma", launch=FALSE)

browseURL(file.path(tmp,"glimma","MD-Plot.html"))

plotMA(important_genes)
glimmaMA(important_genes)
