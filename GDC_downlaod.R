library(TCGAbiolinks)
library(tidyverse)
library(maftools)
library(pheatmap)
library(SummarizedExperiment)

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

query_TCGA_test <- GDCquery(project = 'TCGA-OV',
                            data.category = 'Transcriptome Profiling',
                            access = 'open',
                            experimental.strategy = 'RNA-Seq',
                            barcode= c('TCGA-24-1104', 
                                       'TCGA-25-1320', 
                                       'TCGA-24-1850'))

output_query_test <- getResults(query_TCGA_test)
GDCdownload(query_TCGA_test)

tcga_ov_data_short <- GDCprepare(query_TCGA_test, summarizedExperiment = TRUE)
ov_matrix_short <- assay(tcga_ov_data_short, 'unstranded')

clinical_a <- GDCquery_clinic(project = "TCGA-OV", type = "clinical")

clin.query <- GDCquery(project = "TCGA-OV", data.category = "Clinical",
                       data.format = 'BCR XML',
        barcode= c('TCGA-24-1104', 
                  'TCGA-25-1320', 
                  'TCGA-24-1850'))

clin_output <- getResults(clin.query)


GDCdownload(clin.query)

clinical <- GDCprepare_clinic(clin.query,"patient")


library(dplyr)


clinical_x <- mutate(
  clinical, new_age = ifelse(age_at_initial_pathologic_diagnosis<50, 0, 1))

class(clinical_x)
head(clinical_x)
