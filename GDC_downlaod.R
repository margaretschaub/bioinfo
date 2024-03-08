library(TCGAbiolinks)
library(tidyverse)
library(maftools)
library(pheatmap)
library(SummarizedExperiment)
library(dplyr)

gdcprojects <- getGDCprojects()
getProjectSummary('TCGA-OV')

query_TCGA <- GDCquery(project = 'TCGA-OV',
         data.category = 'Transcriptome Profiling',
         access = 'open',
         experimental.strategy = 'RNA-Seq',
         sample.type = 'Primary Tumor')

output_query <- getResults(query_TCGA)


#testing for technical variants
cases <- output_query$cases
cases_list <- as.list(cases)
is_unique <- length(cases_list) == length(unique(cases_list))
print(is_unique)

extract_first_12 <- function(x) {
  substr(x, 1, 12)
}


modified_list <- lapply(cases_list, extract_first_12)

GDCdownload(query_TCGA)

tcga_ov_data <- GDCprepare(query_TCGA, summarizedExperiment = TRUE)


ov_matrix <- assay(tcga_ov_data, 'unstranded')

colnames(ov_matrix) <- substr(colnames(ov_matrix), 1, 12)

# clinical_a <- GDCquery_clinic(project = "TCGA-OV", type = "clinical")

clin.query <- GDCquery(project = "TCGA-OV", data.category = "Clinical",
                       data.format = 'BCR XML',
        barcode= c(modified_list))

GDCdownload(clin.query)

clinical <- GDCprepare_clinic(clin.query,"patient")

clinical_new_col <- mutate(
  clinical, new_age = ifelse(age_at_initial_pathologic_diagnosis<50, 0, 1))

head(clinical_new_col)

write.csv(clinical_new_col, 
          '/Users/margaretschaub/Bioinformatics Open Source Project/new_col.csv'
          ,row.names = FALSE)
write.csv(ov_matrix, 
          '/Users/margaretschaub/Bioinformatics Open Source Project/ov.csv' 
          ,row.names = FALSE)

