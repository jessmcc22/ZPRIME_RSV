# ZPRIME_RSV
This repository contains all information (including raw data, processed data, and all code used for data preprocessing, statistical analysis, and figure generation) used in the analysis of the ZPRIME microbiome data. 

## Relevant Files and Resources

### Raw data Processing
data_formatting.RMD where the animalcule MAE output was filtered to the desired relative abundance length and files were saved that contained sample info, taxon info and count info

### Statistical Analysis
Analysis was completed at a Species and Genus Level. Two folders hold identical information with the only change being the taxon level of interest. Within each Taxon folder, you will find:

rsv_analysis_taxon_1per.rmd Contains analysis at the 1% level
rsv_analysis_taxon_point1.rmd Contains analysis at the .1% level
Data folder - all data (raw and processed)
Plots folder - jpeg graphical output is stored from the rsv_analysis files and is not included on github. Plots can be viewed in the .Rmd file

### Data Folders
Raw data can be found: <br>
genus/data/ZPRIME_raw_revised.rds - revision was for better naming purposes only

Processed data includes: <br>
Filtered data to include an other category for taxon w/less than 1% relative abundance:<br>
genus/data/1pct/Assay_annotation_1pct.csv <br>
genus/data/1pct/Assay_count_1pct.csv <br>
genus/data/1pct/Assay_taxonomy_1pct.csv <br>

Filtered data to include an other category for taxon w/less than .1% relative abundance:<br>
genus/data/point1pct/Assay_annotation_point1pct.csv<br>
genus/data/point1pct/Assay_count_point1pct.csv<br>
genus/data/point1pct/Assay_taxonomy_point1pct.csv<br>

Similar Data Files can be found for species in the species folder<br>

### MultiQC 
MultiQC report is available [here](https://scc-ondemand2.bu.edu/pun/sys/files/fs/restricted/projectnb/infant-microbiome/work/jessmcc/rsv/fastqc_result/multiqc_report.html).

### RefSeq
PathoScope RefSeq libraries were custom-configured.
The RefSeq 2018 indices can be downloaded [here](https://drive.google.com/file/d/13CP5dQz5GxSQsWZh2qHowf8IXZIAFkov/view?usp=sharin).
Up-to-date RefSeq indices may be obtained by using the `download_refseq()1` function from the [MetaScope package](https://compbiomed.github.io/metascope-docs/index.html).
