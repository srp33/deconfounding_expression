#!/bin/bash

set -e

thisDir=$(dirname $0)

#################
#### GSE20194
#################

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE20194
# https://pubmed.ncbi.nlm.nih.gov/20064235/
unadjusted_file_path="/data/gse20194/unadjusted.csv"
if [ ! -f ${unadjusted_file_path} ]
then
  Rscript ${thisDir}/gse20194.R ${unadjusted_file_path}
fi

#################
#### GSE24080
#################

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE24080
# https://pubmed.ncbi.nlm.nih.gov/20064235/

unadjusted_file_path="/data/gse24080/unadjusted.csv"

if [ ! -f ${unadjusted_file_path} ]
then
    # This file is large, so it was failing when I tried downloading it with GEOquery.
    wget -O /tmp/GSE24080_RAW.tar https://ftp.ncbi.nlm.nih.gov/geo/series/GSE24nnn/GSE24080/suppl/GSE24080_RAW.tar
    cd /tmp
    mkdir -p GSE24080
    mv GSE24080_RAW.tar GSE24080/
    cd GSE24080/
    tar -xvf GSE24080_RAW.tar
    rm GSE24080_RAW.tar

    Rscript ${thisDir}/gse24080.R

    rm -rf /tmp/*
fi

#################
#### GSE49711
#################

# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE49711
# https://pubmed.ncbi.nlm.nih.gov/25150839/
unadjusted_file_path="/data/gse49711/unadjusted.csv"

#if [ ! -f ${unadjusted_file_path} ]
#then
    Rscript /scripts/prepdata/gse49711.R "${unadjusted_file_path}"
#fi

#########################
#### Other possibilities
#########################

#bash /scripts/prepdata/bladderbatch.sh
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE47792 (SEQC superseries)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE49711 (same as GSE49711 but uses Agilent microarrays)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE54275 (specifically, the samples for GPL15932)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE25507 (Affymetrix Human Genome U133 Plus 2.0)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE65204 (Agilent)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE58979 (Affymetrix PrimeView)
#https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE19750 (Affymetrix Human Genome U133 Plus 2.0)
#bash /scripts/prepdata/tcga.sh
