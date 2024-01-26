# The integration of single-cell sequencing, TCGA, and GEO data analysis revealed that PRRT3-AS1 is a biomarker and therapeutic target of SKCM
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9539251/

Zhang W, Xie X, Huang Z, Zhong X, Liu Y, Cheong KL, Zhou J, Tang S. The integration of single-cell sequencing, TCGA, and GEO data analysis revealed that PRRT3-AS1 is a biomarker and therapeutic target of SKCM. Front Immunol. 2022 Sep 23;13:919145. doi: 10.3389/fimmu.2022.919145. PMID: 36211371; PMCID: PMC9539251.

- This study explored prognostic lncRNAs in SKCM based on scRNA-seq and bulk RNA sequencing data. —> **I don’t see how they combined single and bulk??? 
- Skin cutaneous melanoma (SKCM) 

- The TCGA cohort and melanoma samples in the GEO database (GSE72056, GSE19234, GSE15605, GSE7553, and GSE81383) were included in this study. 
- Based on the GEO dataset and TCGA cohort including scRNA- seq data combined with Lasso regression analysis 

- ScRNA-seq enables genome-wide gene expression analysis with single-cell resolution, providing unprecedented capabilities in the identification of cellular heterogeneity, the transition of cellular states, and intercellular communications in complex tissue. 


- A total of 472 SKCM patients in the TCGA database and numerous melanoma samples in the GEO database were included in this study. 
- Raw data of selected GEO databases (http://www.ncbi.nih.gov/geo) were downloaded as MINiML files. The extracted data were normalized by log2 transformation by the normalize quantiles function of the preprocessCore package in R software. 
- Probes were converted to gene symbols according to the annotation information of the normalized data in correspond platforms. 
- Marker genes were filtered from GSE72056, and ensemble lncRNAs were annotated. Selected lncRNAs were verified through TCGA and GEO dataset analysis. 
- RNA-sequencing expression (level 3) profiles and corresponding clinical information were downloaded from the TCGA dataset(https:// portal.gdc.com). 
- Raw data of selected GEO databases (http:// www.ncbi.nih.gov/geo) were downloaded as MINiML files. The extracted data were normalized by log2 transformation by the normalize quantiles function of the preprocessCore package in R software. 
- Probes were converted to gene symbols according to the annotation information of the normalized data in correspond platforms. 
- Key functions of the selected lncRNAs were validated through a series of assays against cell model in vitro. 
- All the R packages in the study were implemented by R software version 4.0.3. Original data including metadata of datasets involved, main R code and survival analysis results were collated as supplementary document 

- A total of 4645 single-cell RNA-seq data points from 19 patients were included in the study. Marker lncRNAs were filtered by the criteria of log2|FC| > 0.5, FDR < 0.001, and RNA expressed percent > 60% based on Tumor Immune Single- cell Hub (http://tisch.comp-genomics.org) (13, 14). Tumor Immune Single-cell Hub is a scRNA-seq database focusing on tumor microenvironment (TME) and provides detailed cell-type annotation at single-cell level, enabling exploration of TME among different cancer types. 
- The least absolute shrinkage and selection operator (LASSO) regression algorithm was used for feature selection to construct a marker model which 10-fold cross-validation was used, and the R package ‘glmnet’ was used for the analysis 

- construction of a prognostic model using machine learning (ML) techniques
## In summary, the researchers utilize machine learning techniques, specifically the LASSO regression algorithm, for feature selection and model construction to predict the overall survival of skin cutaneous melanoma (SKCM) patients. The model is validated using clinical data, and its performance is assessed through various survival analysis metrics.

# Steps of interest to me: converting probes to gene symbols

common approaches for combining single-cell and bulk RNA-seq data:
- Integration Algorithms: Integration algorithms, such as canonical correlation analysis (CCA) or mutual nearest neighbors (MNN), are commonly employed to harmonize single-cell and bulk RNA-seq datasets. These algorithms aim to align the biological signals across different data types.
- Dimensionality Reduction:Techniques like principal component analysis (PCA) or t-distributed stochastic neighbor embedding (t-SNE) can be used to reduce the dimensionality of both single-cell and bulk datasets. This reduction facilitates the comparison and integration of data from different sources.
- Cell-Type Identification: Single-cell RNA-seq datasets often provide detailed cell-type information. Researchers can use this information to identify corresponding cell types in the bulk RNA-seq data, allowing for a more precise comparison.
- Batch Effect Correction: Batch effects can arise from the processing of data at different times or in different laboratories. Applying batch effect correction methods, such as ComBat, can help make datasets more comparable.
- Common Gene Set Analysis:Focusing on a common set of genes that are measured in both single-cell and bulk RNA-seq can simplify the integration. This often involves selecting a set of housekeeping genes or genes of interest that are present in both datasets.
