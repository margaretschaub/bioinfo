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
