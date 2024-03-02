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
         barcode= c('TCGA-24-1104-01A-01R-1565-13', 
                    'TCGA-25-1320-01A-01R-1565-13', 
                    'TCGA-24-1850-01A-01R-1567-13'))

output_query <- getResults(query_TCGA)

GDCdownload(query_TCGA)

tcga_ov_data <- GDCprepare(query_TCGA, summarizedExperiment = TRUE)
ov_matrix <- assay(tcga_ov_data, 'unstranded')


# clinical_a <- GDCquery_clinic(project = "TCGA-OV", type = "clinical")

clin.query <- GDCquery(project = "TCGA-OV", data.category = "Clinical",
                       data.format = 'BCR XML',
        barcode= c('TCGA-24-1104', 
                  'TCGA-25-1320', 
                  'TCGA-24-1850'))

GDCdownload(clin.query)

clinical <- GDCprepare_clinic(clin.query,"patient")

clinical_new_col <- mutate(
  clinical, new_age = ifelse(age_at_initial_pathologic_diagnosis<50, 0, 1))

head(clinical_new_col)
