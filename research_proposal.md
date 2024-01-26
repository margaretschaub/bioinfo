# Introduction

Cancer genomics has entered a new era with the proliferation of vast amounts of open-source data, providing an unprecedented breadth of information. These datasets, ranging from gene expression profiles to proteomic signatures, hold immense potential for advancing our understanding of the molecular underpinnings of cancer and pinpointing novel research targets. 

The challenge, however, lies in harmonizing these diverse datasets to extract meaningful insights. The heterogeneity across datasets, stemming from variations in experimental platforms, data formats and modalities, and even biological contexts, poses a significant obstacle. As we delve into the depths of open-source repositories such as TCGA and others, the realization dawns that while each dataset is a valuable piece of the puzzle, the ability to integrate cross dataset surveys cohesively is key. 

Bridging the gaps between disparate datasets is not merely a technical hurdle but a fundamental necessity to harness the true power of open-source data for advancing cancer research. In this research endeavor, I aim to explore the breadth of open-source data in cancer genomics and address the inherent challenges associated with their integration. 

# Problem Statement

Despite the vast amount of open-source data available in cancer genomics, the integration of diverse datasets with cross dataset surverys remains a critical challenge. The heterogeneous nature of these datasets, stemming from variations in experimental platforms, data formats, and biological contexts, impedes the seamless synthesis of information. This fragmentation hinders comprehensive analyses that could unveil novel insights into the molecular mechanisms underlying cancer progression. Consequently, there is an urgent need for a approaches that integrat this diverse open-source data, enabling researchers to extract meaningful and actionable knowledge from these synthesized cancer genomics sources.

More specifically, the following research questions need to be addressed:
1. What open-source cancer genomics datasets are publicly available across various species, and what are the major barriers to their integration?
1. What challenges exist for cross dataset surveys and leveraging multiple dataset and modality of data?
1. How can these barriers be addressed to effectivley query accross multiple heterogenous data sources? 

# Objectives

1. Develop a generic and widely applicable tool for surveying open-source gene expression and proteomic data, allowing for exploration of expressions across diverse tissues and diseases in both human and animal models. 

1. The focus will be on creating a vignette that demonstrates how to answer a hypothetical question, specifically centered around gene X in the context of disease Y, across human and animal models. This vignette will be manifested as a body of code, serving as a programmatic output of the research. 

1. By deliberately keeping the scientific hypothesis less critical, the emphasis will shift towards the broader survey of open-source datasets, tooling, and the identification of limitations and challenges associated with cross-dataset work. The ultimate goal is to contribute a versatile and valuable resource to the field of bioinformatics, with the potential for widespread utility beyond any specific organizational context.

1. The creation of a deliverable to showcase my bioinformatics knowledge and skills. By utilizing Quarto as an open-source technical publishing system, I can demonstrate effective communication of project details, methods, and results through the website.

# Preliminary Literature Review

## Overall Findings from Literature Review on Omics Data Analysis:

The literature review converges on key insights into differential analysis pipelines and the challenges inherent in cross-data set surveys. In the realm of differential analysis, a well-defined pipeline involves crucial steps, starting with data collection, followed by pre-processing techniques such as quality control, normalization, and filtering. Statistical analysis identifies differentially expressed genes. Multiple test correction is applied to manage the false discovery rate, and interpretation involves comprehensive analyses, such as functional enrichment, providing insights into affected biological processes. Challenges in cross-data set surveys revolve around missing data, dimensionality, the absence of unified public infrastructure, and heterogeneous datasets.

I would seperate the challenges of cross dataset survey work into 2 broad categories:
1. Infrastructure Challenges
2. Statistical Challenges

**Infrastructure challenges** pertain to the overall organization, storage, and accessibility of omics data across various databases. These challenges often involve discrepancies in data formats, variable names, and annotations, hindering seamless integration. Examples include:

- Inconsistent Variable Names: Databases may use different nomenclatures for variables, making it challenging to harmonize data for integration.
- Incomplete Metadata: Insufficient metadata descriptions in public repositories can limit the understanding of data sources, collection methods, and other crucial details.
- Data Format Variability: Omics data may be stored in diverse formats, requiring conversion and standardization efforts for uniform analysis.
- Lack of Unified Standards: Absence of consistent standards and protocols across databases hampers efficient data integration and collaborative research efforts.

The doctoral dissertation by Fakhry (2019) delves into strategies employed by bioinformatics specialists to integrate disparate bioinformatics datasets. The study, conducted in a research institution in Lebanon, involved interviews with six bioinformatics specialists and a review of 27 organizational documents. Thematic analysis revealed key themes related to integrating bioinformatics datasets, including a focus on integration, adding metadata to submitted datasets, the establishment of a centralized bioinformatics database, allocation of resources, and utilization of bioinformatics tools.

The dissertation emphasizes the importance of collaboration in bioinformatics, citing challenges such as limited accessibility, data quality issues, and the need to handle heterogeneous data for effective knowledge extraction. Common challenges faced by bioinformatics specialists include poor data quality, issues with sample size, false discoveries, lack of novel algorithms for integration, computational efficiency, data interpretation, and visualization.

Key themes from the interviews include the need for standardizing techniques, adding metadata to ensure data comprehensiveness, and centralizing data to increase efficiency. The dissertation underscores the significance of data homogenization as a major challenge faced by bioinformatics specialists. Moreover, it emphasizes the importance of metadata in enhancing the utility of submitted data and the establishment of a centralized bioinformatics database.

**Statistical challenges**  focus on the complexities arising during the merging and analysis of omics data from different sources. These challenges demand advanced methodologies to account for batch effects, variability, and other statistical nuances. Examples include:

- Batch Effects: Technical variations introduced during data generation, known as batch effects, can confound integrated results. 
- Data Imputation: Addressing missing data involves imputation methods, such as mean imputation or k-nearest neighbor imputation, to estimate values based on available data. Care is taken to avoid introducing bias.
- Dimensionality Reduction: The increase in variables due to multiple platforms or large-scale datasets requires dimensionality reduction techniques, including feature extraction or selection, to enhance the interpretability and efficiency of downstream analyses.
- Scalability Concerns: The sheer size and complexity of multi-omics datasets can pose challenges for traditional machine learning methods, necessitating scalable approaches for efficient analysis.
- Heterogeneous Data Integration: Datasets with varying numbers of variables, mismatched scaling, and different generation platforms require sophisticated statistical models, such as decision trees, regression models, or neural networks, to handle the heterogeneity effectively.

## Integration of Microarray and RNA-seq Data:

While microarray data can be effectively combined through data merging or meta-analysis techniques, RNA-seq data demands nuanced approaches due to its negative binomial distribution. The literature emphasizes the need for specialized methods, acknowledging that the conventional techniques employed for microarray data might not be directly applicable. In particular, p-value combination approaches, like inverse normal and Fisher methods, prove valuable for differential meta-analyses of RNA-seq data. Challenges related to data variability and distribution patterns necessitate additional considerations, such as filtering weakly expressed genes and post hoc identification of genes exhibiting conflicting expression patterns across studies. As the field evolves, addressing these challenges will be pivotal for harnessing the full potential of RNA-seq data in omics research.

Based on the key findings from the literature review, it is evident that combining data from heterogeneous sources through methods such as meta-analysis (MA) and data merging (DM) holds promise for enhancing statistical power and gaining deeper insights. The study by Lagani et al. (2016) compared these approaches, highlighting their suitability in addressing systematic variations when studies share a common experimental design. Both MA and DM outperformed naive solutions that ignore biases and isolated analyses of individual datasets. In MA, statistical methods are applied separately to each dataset, and the results are subsequently combined for creating summary statistics. On the other hand, DM merges samples from different studies into a unique dataset for subsequent analyses. While MA inherently addresses batch effects, DM requires Batch-Effect Removal (BER) algorithms. 

The study by Taminau et al. (2014) also compares two alternative approaches, meta-analysis (MA) and data merging (DM), for integrative gene expression analysis, specifically in identifying cancer-related biomarkers. Focusing on six independent lung cancer studies, the authors aim to determine whether merging independent datasets designed to study the same biological problem yields lower false discovery rates compared to a more conservative meta-analysis. Integrative analysis, involving multiple independent studies, aims to extract more general and reliable conclusions. Issues for integrative analysis, particularly related to data retrieval and preprocessing, are highlighted, with the merging approach requiring additional steps to address batch effects resulting from diverse experimental plans, platforms, and methodologies.

The authors explore both approaches in the context of identifying lung cancer-related differentially expressed genes (DEGs) or biomarkers. Using resampling as an extra validation step, they ensure the robustness of the DEG lists. Notably, the study compares different platforms and batch effect removal methods. The surprising finding is that, despite clear batch effects when merging datasets, these did not hinder the identification of DEGs. Merging approaches identified significantly more DEGs than meta-analysis, and all DEGs identified through meta-analysis were also found in the merging approach. The study emphasizes the need for a resampling or bootstrapping framework to avoid false positives and ensure robust gene lists in both approaches. Despite batch effects in merging, they did not impede DEG identification, suggesting the application's dependency on the specific task. The identified DEGs have potential implications for understanding lung cancer mechanisms and could be validated for clinical applications.

The study by Rau et al. (2014) introduces a differential meta-analysis approach for RNA-seq data from multiple related studies, comparing it with a negative binomial generalized linear model (GLM) incorporating a fixed study effect. The authors adapt p-value combination techniques used in microarray meta-analyses for the differential analysis of RNA-seq data. This adaptation is demonstrated on simulated and real data from human melanoma cell lines. The GLM with a fixed study effect performs well under low inter-study variation and a small number of studies but is surpassed by meta-analysis methods when inter-study variability increases or with a larger number of studies.

The study provides valuable insights into handling biological and technical variability within studies and additional study-specific effects in the context of RNA-seq data. The methods discussed are applicable to situations where all experimental conditions are present in every study, with varying biological replicates. The p-value combination techniques, implemented in the metaRNASeq R package, offer a practical tool for differential meta-analyses.

The study addresses challenges unique to RNA-seq data, such as the discrete and highly heterogeneous nature of the data. To overcome this, the authors propose filtering weakly expressed genes and identify post-hoc removal of genes exhibiting conflicting differential expression. Additionally, the paper emphasizes the importance of addressing differences in experimental objectives, designs, and populations of interest, as well as technical variations in sequencing technology, library preparation, and laboratory-specific effects when applying p-value combination techniques.

Notably, the research highlights the performance gains of meta-analysis techniques over the GLM with increasing inter-study variability. The methods presented are primarily designed for two-group comparisons but can be extended to multi-group comparisons. The paper concludes by acknowledging the potential extension of these techniques to other high-throughput sequencing data types, such as CHIP-seq and methyl-seq, while acknowledging the challenge of jointly analyzing heterogeneous data, such as microarray and RNA-seq, which remains an open research question for the future.

The article by Keel and Lindholm-Perry (2022) explores recent developments and future directions in the meta-analysis of differential gene expression in livestock RNA-Seq studies. The focus is on addressing challenges arising from inter-study variability due to technical and biological differences, contributing to issues of reproducibility. The key steps and considerations in the RNA-Seq meta-analysis workflow are discussed.

1. Identifying Data Sets and Data Acquisition:
Incompleteness of metadata descriptions in publicly available omics repositories is highlighted as a major issue. Metadata includes information such as data sources, collection dates, and methods used.
2. Data Preprocessing:
Standardization of data preprocessing is emphasized to minimize technical heterogeneity. Starting from raw data and using a unified pipeline for quality control, read mapping, and quantification is recommended.
Challenges in handling data generated using different RNA library preparation protocols are addressed. The study discusses how a combination of reference transcriptome filtering and ratio-based correction can achieve equivalent expression levels between different library preparation methods.
3. Choosing a Meta-Analysis Procedure:
For RNA-Seq data, commonly used meta-analysis procedures include p-value combination and generalized linear models (GLM) with a fixed study effect.
The article suggests that the p-value combination approach is likely the best choice for most meta-analyses, but it acknowledges the need for additional data filtering to address issues like the non-uniform distribution of p-values for RNA-Seq data.
4. Interpreting Meta-Analysis Results:
The handling of fold changes in meta-analysis results is discussed. It's noted that genes may exhibit conflicting expression patterns among studies, and post hoc removal of genes with differing expression patterns is suggested. However, genes with both concordant and discordant expression patterns across studies may be of interest.
The robustness of differentially expressed genes (DEGs) in p-value combination is highlighted, and jackknife sensitivity analysis is recommended for measuring the replication validity of DEGs.
5. Downstream Analysis:
Gene set enrichment analysis (GSEA) is identified as a popular downstream analysis, with various methodologies discussed, such as over-representation analysis (ORA), functional class scoring (FCS), and topology-based (TB) methods. Challenges and opportunities in applying current downstream analyses designed for single studies to meta-analysis results are acknowledged. The need for future algorithm development to integrate meta-analysis results for a more comprehensive understanding of molecular mechanisms is emphasized.

## Current Challenges in Multi-Omics Data Analysis:
1. Missing Data: Addressed through listwise deletion or imputation methods. Imputation can involve regression models replacing missing values with mean or median.
2. Dimensionality: Challenges arise from large data gathered from a small sample. Dimensionality reduction through feature extraction or selection is necessary.
3. No Unified Infrastructure: Lack of a unified public infrastructure for hosting multi-omics data, along with inconsistent standards and protocols.
4. Heterogeneous Data: Varied numbers of variables, mismatched scaling, and different formats/platforms. Approaches include decision trees, regression models, and networks like HeteroMed, PARADIGM, or SNF.

## Strategies for Transcriptomics Meta-Analysis:
1. Data Extraction & Preprocessing: Quality control, normalization, and filtering. Standardization and normalization techniques are crucial for consistency and comparability across studies.
2. Dealing with missing data and batch effects is essential for robust meta-analysis results.
3. Statistical Analysis: Selection of appropriate statistical methods, including fixed-effects and random-effects models.
4. Combining effect sizes and assessing heterogeneity through statistical measures. Multiple Test Correction: Applied to control the false discovery rate.
5. Interpreting Results:
6. Biological interpretation involves identifying consistent gene expression patterns, differentially expressed genes, and enriched pathways.
7. Validation through independent datasets or experimental validation is recommended.
8. Addressing potential biases and limitations, such as publication bias or selective reporting.


# Methodology

1. Data Selection - Identify data platforms, identify data sets related to Cancer x, take multiple data sets that have RNA data (tbd if RNA microarray, RNA seq bulk or single cell or both) 

2. Data Extraction - Identify infrastructure differences between platforms, write code to download data into a database. Make sure to download data that has not yet been normalized. There will be a table for each platform.

3. Data Preprocessing - Clean each table, standardize variable names, identify missing values, normalize data, standardize identifiers and annotations. 

4. Statistical Analysis: Selection of appropriate statistical methods. For microarray data, I believe a data merging approach would be appropriate to identify the greatest number of differentially expressed RNA and then incorporate a resampling/bootstrapping element (Taminau et al., 2014). For RNAseq data, I would employ the DESeq2 or metaRNAseq package to accomplish p value combination to account for negative binomial distribution (Rau et al., 2014). I am unsure of how to approach single versus bulk RNA seq data integration. 

5. Effect size? and Multiple test correction 

6. Biological interpretation involves identifying consistent gene expression patterns, differentially expressed genes, and enriched pathways.

The thought is to have several storage containers (database tables) specified to hold data from let's say source a, b, and c. There will be specific programs that can be run on tables a, b, and c individually to preprocess depending on the needs of the source and ultimately create a unified dataset. Basically find what makes each source incompatible and fix it. 

Once the dataset is unified, if microarray data: statistical code related to data merging can be run on the entire data set. I would need code to resample the data as shown in Taminau et al., 2014.

If the data is RNAseq data, the diff exp analysis will be run seperately for each sample. I am envisioning there will be a column in the table that is a foreign key pointing to which sample it belongs to. This way this sample identifier can be used as a variable to perform seperate analysis. 

Eventually, it would be great to have some form of changeable variable, like: 
 - cancer type
 - metric (RNA, DNA, microRNA, bulk RNA seq, scRNA seq, etc.)

A future goal could be an API that will pull from each data source?? 

# References

https://medium.com/porism/whats-needed-to-discover-link-and-combine-open-datasets-a11890c4b0a0

https://www.altexsoft.com/blog/omics-data-analysis/

https://www.elucidata.io/blog/geo-datasets-for-transcriptomics-meta-analysis-in-research

https://pluto.bio/blog/differential-expression-analysis-techniques-and-benefits

Lagani, V., Karozou, A.D., Gomez-Cabrero, D. et al. A comparative evaluation of data-merging and meta-analysis methods for reconstructing gene-gene interactions. BMC Bioinformatics 17 (Suppl 5), S194 (2016). https://doi.org/10.1186/s12859-016-1038-1

Taminau, J., Lazar, C., Meganck, S., & Nowé, A. (2014). Comparison of merging and meta-analysis as alternative approaches for integrative gene expression analysis. International Scholarly Research Notices, 2014.

Rau, A., Marot, G. & Jaffrézic, F. Differential meta-analysis of RNA-seq data from multiple studies. BMC Bioinformatics 15, 91 (2014). https://doi.org/10.1186/1471-2105-15-91

Fakhry, C. (2019). Exploring Strategies to Integrate Disparate Bioinformatics Datasets (Doctoral dissertation, Walden University).

Keel, B. N., & Lindholm-Perry, A. K. (2022). Recent developments and future directions in meta-analysis of differential gene expression in livestock RNA-Seq. Frontiers in Genetics, 13, 983043.




