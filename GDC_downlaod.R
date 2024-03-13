library(TCGAbiolinks)
library(tidyverse)
library(maftools)
library(pheatmap)
library(SummarizedExperiment)
library(dplyr)

gdcprojects <- getGDCprojects()

# Choose project
getProjectSummary('TCGA-OV')

# Choose parameters
query_TCGA <- GDCquery(project = 'TCGA-OV',
         data.category = 'Transcriptome Profiling',
         access = 'open',
         experimental.strategy = 'RNA-Seq',
         sample.type = 'Primary Tumor')

rna_tumor_output <- getResults(query_TCGA)
GDCdownload(query_TCGA)

#testing for technical variants
test_technical_variants <- function(df, columnn_name) {
  cases <- df$columnn_name
  is_unique <- length(cases) == length(unique(cases))
  print(is_unique) 
}

test_technical_variants(rna_tumor_output, cases)

# Shorten barcode containing sample & portion to match participant barcode
extract_first_12 <- function(x) {
  substr(x, 1, 12)
}

# Create a list of patient barcodes
cases <- rna_tumor_output$cases
cases_list <- as.list(cases)
patient_list <- lapply(cases_list, extract_first_12)

# Create summarized experiment and count matrix of RNA seq counts
tcga_ov_data <- GDCprepare(query_TCGA, summarizedExperiment = TRUE)
ov_matrix <- assay(tcga_ov_data, 'unstranded')
colnames(ov_matrix) <- substr(colnames(ov_matrix), 1, 12)

# Query clinical data for barcodes that match RNA seq data
clin.query <- GDCquery(project = "TCGA-OV", data.category = "Clinical",
                       data.format = 'BCR XML',
        barcode= c(patient_list))

GDCdownload(clin.query)

clinical_data <- GDCprepare_clinic(clin.query,"patient")

# Add a column to be used as a design factor - age at initial pathologic diagnosis
# Should I factor in age at which sample has been collected? Age at diagnosis =/ age at collection
clinical_age_design <- mutate(
  clinical_data, meno_status = ifelse(age_at_initial_pathologic_diagnosis<51, 'PREMENO', 'MENO'))

# Counts for meno group
meno_counts <- table(clinical_w_design_factor$meno_status)
print(meno_counts)

# Counts for stage groups before assigning category
stage_counts <- table(clinical_w_design_factor$stage_event_clinical_stage)
print(stage_counts)

# Add column to use stage as a design factor - early versus late
#need to exclude rows for which stage event is not recorded (right now as Other), also not inlcuding stage III to keep group counts closer together
clinical_stage_design <- mutate(
  clinical_data,
  stage_status = ifelse(
    stage_event_clinical_stage %in% c("Stage IA", "Stage IB", "Stage IC", "Stage IIA", "Stage IIB", "Stage IIC"),
    "EARLY",
    ifelse(
      stage_event_clinical_stage == "Stage IV",
      "LATE",
      "OTHER"
    )
  )
)

# Counts for stage after assigned meaning
stage_counts_2 <- table(clinical_stage_design$stage_status)
print(stage_counts_2)

# This doesn't read as a program, have to run each line of code one by one. Should I change this? 

