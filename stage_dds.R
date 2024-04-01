print(clinical_stage_design)

cut_clinical <- subset(clinical_stage_design, stage_status != "OTHER")

cut_ov <- ov_matrix
rownames(cut_clinical) <- cut_clinical$bcr_patient_barcode

valid_columns <- intersect(colnames(cut_ov), rownames(cut_clinical))
print(valid_columns)

cut_ov <- cut_ov[, valid_columns]


all(colnames(cut_ov) %in% rownames(cut_clinical))
all(colnames(cut_ov) == rownames(cut_clinical))

barcode_order_stage <- colnames(cut_ov)

ordered_clin_data_stage <- cut_clinical[match(barcode_order_stage, cut_clinical$bcr_patient_barcode),]
all(colnames(cut_ov) == rownames(ordered_clin_data_stage ))

dds_stage <- DESeqDataSetFromMatrix(countData= cut_ov,
                              colData = ordered_clin_data_stage,
                              design = ~ stage_status)

keep_stage <- rowSums(counts(dds_stage)) >= 10
dds_stage<- dds_stage[keep_stage,]

dds_stage$stage_status<- relevel(dds_stage$stage_status, ref= 'LATE')

dds_stage <- DESeq(dds_stage)

res_stage0.01 <- results(dds_stage, alpha = 0.01)
res_stage0.01
summary(res_stage0.01)

gene_codes_stage <- rownames(res_stage0.01)
gene_names_stage <- gene_metadata$gene_name[match(gene_codes_stage, gene_metadata$gene_id)]
res_stage0.01$symbol <- gene_names_stage
print(res_stage0.01)


plotMA(res_stage0.01)

res_stage_df <- as.data.frame(res_stage0.01)

EnhancedVolcano(res_stage_df,
                lab = res_stage_df$symbol,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'Early versus Late stage',
                pointSize = 1.0,
                labSize = 3.0,
                drawConnectors = TRUE,
                widthConnectors = 0.75)

res_stage_df$diffexpressed <- "NO"
res_stage_df$diffexpressed[res_stage_df$log2FoldChange>0.1 & res_stage_df$padj<0.01] <- "UP"
res_stage_df$diffexpressed[res_stage_df$log2FoldChange<0.1 & res_stage_df$padj<0.01] <- "DOWN"

# Filter down-expressed genes with padj < 10e-6 and log2FoldChange > |1|
down_genes_stage <- res_stage_df$symbol[res_stage_df$diffexpressed == "DOWN" & 
                              res_stage_df$padj <10e-6 & 
                              abs(res_stage_df$log2FoldChange) > 1]
print(down_genes_stage)
# Filter up-expressed genes
up_genes_stage<- res_stage_df$symbol[res_stage_df$diffexpressed == "UP" & 
                                  res_stage_df$padj < 10e-6 & 
                                  res_stage_df$log2FoldChange > 1]
print(up_genes_stage)


