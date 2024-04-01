query_TCGA_type <- GDCquery(project = 'TCGA-OV',
                       data.category = 'Transcriptome Profiling',
                       access = 'open',
                       experimental.strategy = 'RNA-Seq')
GDCdownload(query_TCGA_type)

tcga_all_ov_data <- GDCprepare(query_TCGA_type, summarizedExperiment = TRUE)
ov_matrix_all <- assay(tcga_all_ov_data, 'unstranded')
colnames(ov_matrix) <- substr(colnames(ov_matrix), 1, 12)