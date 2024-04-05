query_TCGA_recurr <- GDCquery(project = 'TCGA-OV',
                       data.category = 'Transcriptome Profiling',
                       access = 'open',
                       experimental.strategy = 'RNA-Seq',
                       sample.type = c('Recurrent Tumor','Primary Tumor'))


tcga_all_ov_data <- GDCprepare(query_TCGA_recurr, summarizedExperiment = TRUE)
ov_matrix_all <- assay(tcga_all_ov_data, 'unstranded')

print(colnames(ov_matrix_all))

all_data <- getResults(query_TCGA_recurr)
print(all_data$cases)

samplesTP <- TCGAquery_SampleTypes(
  barcode = c(all_data$cases), typesample = "TP")

print(samplesTP)

samplesTR <- TCGAquery_SampleTypes(
  barcode = c(all_data$cases), typesample = "TR")

print(samplesTR)

test_variants <- function(bar_list) {
  barcodes <- c(bar_list)
  barcode_prefix <- substr(barcodes, 1, 12)
  is_unique <- length(unique(barcode_prefix)) == length(barcode_prefix)
  if (is_unique) {
    print("All barcodes are unique based on the first 12 characters.")
  } else {
    duplicated_indices <- which(duplicated(barcode_prefix))
    duplicate_barcodes <- barcodes[duplicated_indices]
    print(duplicate_barcodes)
  }
}

test_variants(samplesTR)
test_variants(samplesTP)

samples_tp_df <- as.data.frame(samplesTP)
print(samplesTP)

#There is a technical variant. Why does samplesTP have technical variant? 

indices_to_remove <- grep("^TCGA-23-1023", colnames(ov_matrix_all))
ov_matrix_filtered <- ov_matrix_all[, -indices_to_remove]

filtered_list <- colnames(ov_matrix_filtered) 
test_variants(filtered_list)

clinical_type <- data.frame(sample_name = colnames(ov_matrix_filtered))
clinical_type$sample_type <- "primary"
recurrent_samples <- c(samplesTR)
clinical_type$sample_type[clinical_type$sample_name %in% recurrent_samples] <- "recurrent"

recurrent_indices <- which(clinical_type$sample_type == "recurrent")
print(recurrent_indices)

rownames(clinical_type) <- clinical_type$sample_name

all(colnames(ov_matrix_filtered) %in% rownames(clinical_type))
all(colnames(ov_matrix_filtered) == rownames(clinical_type))

dds_type <- DESeqDataSetFromMatrix(countData= ov_matrix_filtered,
                              colData = clinical_type,
                              design = ~ sample_type)

keep_type <- rowSums(counts(dds_type)) >= 10
dds_type <- dds_type[keep_type,]

dds_type$sample_type<- relevel(dds_type$sample_type, ref= 'primary')
dds_type <- DESeq(dds_type)

res_type <- results(dds_type)
res_type0.01 <- results(dds_type, alpha = 0.01)
summary(res_type0.01)

gene_codes_type <- rownames(res_type0.01)
gene_names_type <- gene_metadata$gene_name[match(gene_codes_type, gene_metadata$gene_id)]
res_type0.01$symbol <- gene_names_type
print(res_type0.01)

plotMA(res_type0.01)

res_type_df <- as.data.frame(res_type0.01)

EnhancedVolcano(res_type_df,
                lab = res_type_df$symbol,
                x = 'log2FoldChange',
                y = 'padj',
                title = 'Primary versus Recurrent Disease',
                pointSize = 1.0,
                labSize = 3.0,
                drawConnectors = TRUE,
                widthConnectors = 0.75)
