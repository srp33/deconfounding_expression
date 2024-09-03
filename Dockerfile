FROM bioconductor/bioconductor:RELEASE_3_19

RUN R -e "BiocManager::install('doParallel')"
RUN R -e "BiocManager::install('readxl')"
RUN R -e "BiocManager::install('SCAN.UPC')"
RUN R -e "BiocManager::install('tidyverse')"

COPY install_annotation_packages.R /
RUN Rscript /install_annotation_packages.R

#ENV R_TempDir=/tmp
#ENV TMPDIR=/tmp
#ENV TMP=/tmp
#ENV TEMP=/tmp

#RUN pip3 install
#  numpy scikit-learn pandas tensorflow=1.11.0
