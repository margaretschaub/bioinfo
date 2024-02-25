# Project Log

## 12/01/2023
- Read basics on markdown files: https://www.markdownguide.org/basic-syntax/
- Downloaded jupyter lab and wrote introduction.md
- jupyter lab launched from command line with command: jupyter lab

## 12/15/2023
- Created remote repository bioinfo: https://github.com/margaretschaub/bioinfo
- Linked jupyter lab to github remote repository using personal access token
- Created LICENSE, README.md. .gitignore files
- Fetched and merged remote repository with local jupyter lab Bioinformatics Open Source Project directory - worked around “fatal: refusing to merge unrelated histories” error due to creating a new repository, adding a few commits to it, and then trying to pull from a remote repository that already has some commits of its own. Git throws the error since it has no idea how the two projects are related. The error is resolved with allow-unrelated-histories after a git pull or git merge command. 

### Resources: 
https://www.educative.io/answers/the-fatal-refusing-to-merge-unrelated-histories-git-error
https://www.atlassian.com/git/tutorials/syncing/git-fetch
https://www.educative.io/answers/what-is-the-difference-between-forking-and-cloning-in-git#:~:text=When%20should%20I%20clone%20a,the%20actual%20changes%20and%20push.

## 12/16/2023
- Created log.md
- Wrote initial learning goals - learning_goals.md
- Wrote initial scope and objectives - scope.md
- Resolved issue relating git not recognizing change from Introduction.md to introduction.md: https://github.com/isaacs/github/issues/1520

## 12/26/2023
- Began preliminary research into a biological question
- I have an interest in CAR T immunotherapy. CAR T cells seek out and bind to cancer cells that express the specific antigen targeted by the CAR receptor. CAR is a synthetic receptor that combines the antigen-recognition part of an antibody with signaling components from T cells. Identifying antigens that are specific to cancer cells is crucial for developing targeted therapies. 
- Identifying targets that could be antigens specific to cancer cells may involves analyzing the gene expression profiles of cancer cells compared to normal cells and identifying proteins that are present on the surface of cancer cells but not on normal cells. Whole-genome or whole-exome sequencing can be performed to identify genetic mutations or alterations specific to cancer cells. Mutated genes may produce abnormal proteins that can serve as antigens. There are many additional methods to identify antigens specific to cancer cells. 

### I would still like to analyze differential expression profiles between a diseaed and non diseased patient. However, I would like to choose a disease that has the potential to be treated by CAR T therapy. Once my bioinformatics skills are more developed, I may be able to design a question more related to antigen detection.

- CAR T has yet to be effective in solid tumors. I researched solid tumors that could potentially be treated with CAR T: glioblastoma and breast cancer. This article describes mechanisms for CART-T treatment for glioblastoma failure: "early results in GBM have not shown clinical benefit. Potential reasons for this are the limited number of specific antigens in GBM, their heterogenous expression, and antigen escape" -https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10000604/
- It would be interesting to develop a hetergeneous expression profile for GBM based off this information: "antigens have heterogeneous spatial expression throughout a tumor, but they can also vary across time" however, I do not know if I would have access to necessary data. This data might not be open source, but rather clinical data after patients have been treated with a CAR T therapy.
- This source may help me develop a relevant clinical question: Recent advancement in breast cancer treatment using CAR T cell therapy A review: https://www.sciencedirect.com/science/article/pii/S2667394023000047#:~:text=CARs%20are%20the%20modified%20receptors,triumphs%20in%20treating%20hematologic%20malignancies 
- Graft versust host risk is a significant challenge for allogenic lymphocyte therapy to overcome. This source describes the creation of a Graft versus host probability algorithm: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6893923/
- Role of gut microbiota in adoptive cell therapy - may be able to research effectiveness in therapy with patients that have gut related disease comorbidities: "Collectively, our findings demonstrate an important role played by the gut microbiota in the antitumor effectiveness of ACT and suggest potentially new avenues to improve response to ACT by altering the gut microbiota."- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5916241/

- Identified potential open source data resources: 
    - The Cancer Genome Atlas Program (TCGA)- https://portal.gdc.cancer.gov
    - Genotype-Tissue Expression Program (GTEx)-https://www.gtexportal.org/home/ for nondiseased datasets
    - https://cellxgene.cziscience.com
    - Gene Expression Omnibus
   
- The greatest challenge I am facing thus far is to try to find something unique to research, that is still doable with open source data and my beginner skill level. 

## 12/27/2023
- Read article Three‐microRNA expression signature predicts survival in triple‐negative breast cancer - https://www.spandidos-publications.com/10.3892/ol.2019.11118
- The study analyzed the miRNA expression and clinical data of patients with TNBC downloaded from The Cancer Genome Atlas. The researchers identified miRNA implicated in overall survival that were also differentially expressed between TNBC and nondiseased patients. Researcher used Gene Ontology and Kyoto Encyclopedia of Genes and Genomes for pathway enrichment analyses to reveal pathways for the target genes of these three miRNA. These miRNA could serve as biomarkers for TNBC, as this form on breast cancer is particularly hard to treat due to being negative for estrogen receptor (ER), progesterone receptor (PR) and human epidermal growth factor receptor 2 (HER-2). 
- Questions I would like to research after reading this article: 
    - Why a cut-off criteria of P<0.05 and |log2 fold change|>2 for difference between TNBC and normal tissue?
    - How to normalize data? All of the miRNA expression data were reported as ‘reads-per-million-miRNA -mapped’ and were normalized by log2 transformation.
    - Screening for differentially expressed miRNA- why Log|FC|>1.5 and P<0.05 following false discovery rate adjustment were established as the cut-off criteria? 
    - What is Kaplan-Meier survival analysis? 
    - What is the purpose of log-rank tests based on survival curve?
    - Why use the Cox proportional hazards model using multiple logistic regression with forward stepwise selection of variables to assess prognostic value of miRNAs?
    - the limma package in R was used to analyze differentially expressed miRNAs in the present study. The comparisons between tumor and normal tissues performed in limma were not conducted using a 1:1 ratio of tumor to healthy tissue, as healthy tissue specimens were not obtained from the majority of patients. Therefore, the tumor tissue from each patient was compared with all healthy tissue specimens. This approach eliminates the impacts of individual patient treatment options or other diseases. I want to know how they set up this comparison.
    - To the researcher's knowledge at the time of publishing, the present study was the first to describe an association between miR‐659 and breast cancer. Other studies have focused on the role of miR-659 in muscle development and nervous system and metabolic diseases, such as frontotemporal dementia and diabetes mellitus (46-48). Thus, the mechanism of miR-659-5p in breast cancer requires further investigation. This could be an area for me to focus on. 

## 12/28/2023
- Rather than trying to create a novel research question, I would like to document the choices I make throughout the process of the analysis to demonstrate the start to finish process of a bioinformatic pipeline. 
- Created data_sources.md file and researched potential open-source databases that I could use in my analysis
- I am still unsure of the research target

## 1/11/2024
- Started writing preliminary research proposal
- Collected initial literature to begin reading: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1038-1

https://academic.oup.com/bioinformatics/article/24/9/1154/206630

https://arxiv.org/pdf/1511.08317.pdf

https://frontlinegenomics.com/multi-omics-data-integration-and-bioinformatics/

https://www.sciencedirect.com/science/article/abs/pii/S1476927121000827

https://www.altexsoft.com/blog/omics-data-analysis/

https://www.hindawi.com/journals/isrn/2014/345106/

https://scholarworks.waldenu.edu/cgi/viewcontent.cgi?article=8744&context=dissertations

https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-021-04048-0

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3599117/

https://resources.qiagenbioinformatics.com/manuals/clcgenomicsworkbench/current/index.php?manual=Combine_Reports.html

https://figshare.com/articles/dataset/High-Throughput_Tabular_Data_Processor_Platform_independent_graphical_tool_for_processing_large_data_sets/5880640

# 1/13/2024
- Began reading current literature

- Question: Is the raw microarray data for a given source preprocessed? Does preprocessing technique vary if you are planning to combine with another platform's data? 

- Common reasons for data preprocessing include:
    - Cleaning Data: Identifying and handling missing values. Handling outliers or erroneous data points. Correcting inconsistencies in the data.
    - Normalization or Standardization: Scaling numerical features to a standard range. Ensuring that different features have comparable scales. Normalizing data to reduce the impact of variations in magnitude.
    - Feature Engineering: Creating new features or transforming existing ones to enhance the model's performance. Handling categorical variables through techniques like one-hot encoding.
    - Dealing with Imbalances: Addressing class imbalances in classification problems.
    - Handling Noisy Data: Removing irrelevant or redundant features. Smoothing noisy data through techniques like filtering.
    - Formatting for Analysis: Organizing data in a way that facilitates analysis. Ensuring the data adheres to the assumptions of the chosen analysis methods.

- Even when working with a single dataset, these preprocessing steps help ensure that the data is in a suitable state for analysis and that the results are more accurate and reliable.

# 1/21/2024
- Reading current literature
https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1038-1
https://www.hindawi.com/journals/isrn/2014/345106/
https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-15-91
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9539251/
https://www.frontiersin.org/articles/10.3389/fgene.2022.983043/full
https://scholarworks.waldenu.edu/cgi/viewcontent.cgi?article=8744&context=dissertations
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7003173/
https://www.elucidata.io/blog/geo-datasets-for-transcriptomics-meta-analysis-in-research
https://pluto.bio/blog/differential-expression-analysis-techniques-and-benefits

# 1/26/2024 
- Created literature folder
- This literature folder contains sources I read to form my knowledge base for this project. In each file, I have copied phrases or paragraphs that were of interest to me directly from each source. This way, I could refer back to see exactly how the authors phrased their findings. I tried to include quotations when I directly copy and pasted significant paragraphs, however many of the bullet points contain direct words from the corresponding research article. 
## Disclaimer: These are not my own words or my own summaries. Each file has the link to the attributed source.
- Updated research proposal with literatue findings and rough methodology

# 2/9/2024
- Research and created biomarkers.md
- What is the expression of a particular biomarker - in a healthy cell? across tissue? across population? in different animals? in disease? 
- What do expression profiles look like
- Try to correlate this to protein expression if possible- hypothesis if increased RNA, is there really increased protein? 
- Potentially look at expression in animals like mice as well- is this a viable target to be able to test on animals?

# 2/15/2024
- Looking at cross-species, cross tissue, healthy/vs tumor evaluation of expression (protein and mRNA) 
- Some helpful visuals (some of which use TCGA data) to search for expression profiles across tissue/cancer types:  
    - TNMplot - https://tnmplot.com/analysis/ : shows differential gene expression in tumor versus normal.
    - GTEx portal - https://www.gtexportal.org/home/gene/CD34 : bulk tissue or single tissue gene expression across healthy tissues
    - The Human Protein Atlas - https://www.proteinatlas.org/ENSG00000174059-CD34/tissue : expression profiles in healthy human tissues of on the mRNA and protein level
    - USCS Genome Browser https://genome.ucsc.edu/cgi-bin/hgTrackUi?hgsid=1924540236_YnIvd0hYPhovAQYaFCNeeGa6Tweh&c=chr1&g=tcgaTranscExpr : Transcript-level expression in 33 TCGA Cancer Tissues
    
- Ideas: 
    1. Drilling down on the difference between mRNA levels and protein expression: One area of interest to me is comparing the bulk tissue RNA expression (from GTEx) to the protein expression overview (from The Human Protein Atlas- HPA). For example, with CD34, at first glance, there is high mRNA expression in breast tissue, but no protein expression in breast tissue. I wonder if there would be a way to characterize this phenomenon. I am not sure if there is a way to directly compare GTEx samples to the HPA ones (only 40 people sampled), but HPA does have mRNA expression profiles that would make a direct comparison statistically easier? This would be done applying the lens of the potential biomarkers I highlighted. An additional layer could be added by then comparing this to the mRNA and protein expression in cancer patients. 

    2. Building a better tool to query for mRNA expression using TCGA data. The USCS Genome Browser sort of accomplishes this, but in my opinion, is very cluttered and not intuitive to use. TNM plot does have an element of this, but also involves the additional layer of comparing to normal and doesn’t have a way to download raw data. I’m envisioning a way to compare expression of a particular biomarker across cancer type with the ability to change variables (like age, gender) and a way to download access the data. This is sort of a merge of GDC and TNM plot. 
    
- "It has been proposed that three potential reasons for the lack of a strong correlation between mRNA and protein expression levels are: (i) translational regulation, (ii) differences in protein in vivo half-lives, and (iii) the significant amount of experimental error, including differences with respect to the experimental conditions (Greenbaum et al. 2003; Beyer et al. 2004). We recently performed a quantitative analysis of the contributions of various biochemical and physical sources to the correlation of mRNA and protein abundance in Desulfovibrio vulgaris. The results showed that analytic variations in mRNA expression and protein abundance contributed to 34–44% of the total variation of mRNA–protein correlation, and protein and mRNA stabilities contributed to 5 and 2% of the total variation of mRNA–protein correlation, respectively (Nie et al. 2006a). "(https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1698625/#:~:text=It%20has%20been%20proposed%20that,differences%20with%20respect%20to%20the) 

- https://bmcmedgenomics.biomedcentral.com/articles/10.1186/s12920-018-0463-6 : Evidence that GTEX can be used for matched normal 

- https://www.nature.com/articles/sdata201861 - Unifying cancer and normal RNA sequencing data from different sources: we developed a pipeline that processes and unifies RNA-seq data from different studies, which includes uniform realignment, gene expression quantification, and batch effect removal

# 2/18/2024

## Mouse Databases

- https://www.informatics.jax.org/expression.shtml

-  https://www.informatics.jax.org/gxd#gxd=nomenclature%3DCD34%26vocabTerm%3D%26annotationId%3D%26locations%3D%26locationUnit%3Dbp%26structure%3D%26structureID%3D%26theilerStage%3D0%26assayType%3DImmunohistochemistry%26assayType%3DIn%20situ%20reporter%20%28knock%20in%29%26assayType%3DRNA%20in%20situ%26assayType%3DNorthern%20blot%26assayType%3DNuclease%20S1%26assayType%3DRNase%20protection%26assayType%3DRT-PCR%26assayType%3DWestern%20blot%26results%3D100%26startIndex%3D0%26sort%3D%26dir%3Dasc%26tab%3Dstagegridtab%26structureIDFilter%3DEMAPA%3A25765

- Singel cell human and mouse : https://bio.liclab.net/SCInter/index.php

- Cell Marker 2.0 for mouse - http://117.50.127.228/CellMarker/index.html Described here https://academic.oup.com/nar/article/51/D1/D870/6775381 markers of different cell types have been gradually disclosed (10,11). In order to distinguish different cell types in different tissues, we reported the first version of CellMarker database (CellMarker 1.0), which enabled users to search for all known experimentally supported markers for different cell types in various organs in humans or mouse.

- Mammalian Transcriptomic Database https://ngdc.cncb.ac.cn/mtd/search.php This might be helpful but I have no idea how to read the graphs? 

- A mouse tissue atlas of small noncoding RNA https://www.pnas.org/doi/full/10.1073/pnas.2002277117#data-availability

- A tissue-specific atlas of mouse protein phosphorylation and expression https://www.ebi.ac.uk/gxa/experiments/E-PROT-13/Results?specific=true&geneQuery=%255B%257B%2522value%2522%253A%2522CD34%2522%252C%2522category%2522%253A%2522symbol%2522%257D%255D&filterFactors=%257B%257D&cutoff=%257B%2522value%2522%253A0.000001%257D

- Creating something like the protein atlas - mRNA per tissue but for the mouse ? Does this exist? 
Could maybe use MGI to create

- https://www.immgen.org/Databrowser19/DatabrowserPage.html

- Mouse Models of Human Cancer Database (MMHCdb) - https://tumor.informatics.jax.org/mtbwi/index.do

- EMAGE (e-Mouse Atlas of Gene Expression) is an online biological database of gene expression data in the developing mouse (Mus musculus) embryo. http://www.emouseatlas.org/emage/

- https://www.mousephenotype.org/

- http://www.noncode.org/index.php

- Potential mouse protein database - https://swissmodel.expasy.org/repository/species/10090
- neuroscience transcriptomic genetic data for collaborative research on genomic disorders. https://phenogen.org/index.jsp

# 2/25/2024
- Tried to find Python program to more easily download GDC data. Since there is a new Data Portal, it appears some of the API has changed. There are also variables categorized as new names. This promising package did not work with the new portal: https://github.com/vappiah/DataMiner
- Learned some basic R, installed R studio then BiocManager to access Bioconductor and utilize TCGAbiolinks - https://github.com/tiagochst
    - BiocManager::install("remotes")
    - BiocManager::install("BioinformaticsFMRP/TCGAbiolinks")
- Download data from GDC Portal using TCGAbiolinks R Package
- Played around with TCGA-OV (ovarian cancer) because working on a biomarker project related to OC in Master's class

