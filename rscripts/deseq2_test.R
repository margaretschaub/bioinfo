BiocManager::install("DESeq2")
BiocManager::install("airway")
BiocManager::install("plotly")
BiocManager::install('EnhancedVolcano')
library(pheatmap)
library(DESeq2)
library(tidyverse)
library(airway)
library(dplyr)
library(ggplot2)
library(plotly)
library(Glimma)
library(ggrepel)
library(EnhancedVolcano)

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

# Match gene_id to gene name
gene_metadata <- as.data.frame(rowData(tcga_ov_data))
print(head(res0.01))
gene_codes <- rownames(res0.01)
gene_names <- gene_metadata$gene_name[match(gene_codes, gene_metadata$gene_id)]
res0.01$symbol <- gene_names

res0.01
summary(res0.01)      

resultsNames(dds)

# Get data for specific genes of interest identified from plots
row_index <- which(res0.01$symbol == 'CPLX1')
result_for_gene <- res0.01[row_index, ]
print(result_for_gene)

plotMA(res0.01)

#Method to remove noise
resLFC <-lfcShrink(dds,coef="meno_status_MENO_vs_PREMENO",type="apeglm")
plotMA(resLFC)

#Volcano Plot

res_df <- as.data.frame(res0.01)
res_df$diffexpressed <- "NO"
res_df$diffexpressed[res_df$log2FoldChange>0.1 & res_df$padj<0.01] <- "UP"
res_df$diffexpressed[res_df$log2FoldChange<0.1 & res_df$padj<0.01] <- "DOWN"
res_df$delabel <- NA

ggplot(data=res_df,aes(x=log2FoldChange, y=-log10(padj), col=diffexpressed, label=delabel))+
  geom_point()+
  theme_minimal()+
  scale_color_manual(values=c('blue','black','red'))+
  theme(text=element_text(size = 20))

print(head(res_df))
EnhancedVolcano(res_df,
                lab = res_df$symbol,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'Older versus Younger than age 51',
                pointSize = 1.0,
                labSize = 3.0,
                drawConnectors = TRUE,
                widthConnectors = 0.75)

# Gene lists

# Filter down-expressed genes with padj < 10e-6 and log2FoldChange > |1|
down_genes <- res_df$symbol[res_df$diffexpressed == "DOWN" & 
                                     res_df$padj <10e-6 & 
                                     abs(res_df$log2FoldChange) > 1]
print(down_genes)
# Filter up-expressed genes with padj < 10e-6 and log2FoldChange between 2 and 2.5
up_genes_2_2.5 <- res_df$symbol[res_df$diffexpressed == "UP" & 
                                  res_df$padj < 10e-6 & 
                                  res_df$log2FoldChange > 1 &
                                  res_df$log2FoldChange <= 2.5]
print(up_genes_2_2.5)
# Filter up-expressed genes with padj < 10e-6 and log2FoldChange between 2.5 and 4
up_genes_2.5_4 <- res_df$symbol[res_df$diffexpressed == "UP" & 
                                  res_df$padj < 10e-6 & 
                                  res_df$log2FoldChange > 2.5 &
                                  res_df$log2FoldChange <= 4]
print(up_genes_2.5_4)
# Filter up-expressed genes with padj < 10e-6 and log2FoldChange greater than 4
up_genes_gt_4 <- res_df$symbol[res_df$diffexpressed == "UP" & 
                                 res_df$padj < 10e-6 & 
                                 res_df$log2FoldChange > 4]
print(up_genes_gt_4)

# Could also add baseMean as another layer

print(down_genes)
