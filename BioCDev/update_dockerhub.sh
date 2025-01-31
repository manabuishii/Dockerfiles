# This docker image has LaTeX to build the vignettes
# https://www.bioconductor.org/help/docker/
FROM bioconductor/bioconductor_docker:devel

RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	libmysqlclient-dev \
	default-libmysqlclient-dev \
	libgdal-dev \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	## Install Packages
	&& R -e 'BiocManager::install(version = "devel"); BiocManager::valid(); BiocManager::install(c("BiocCheck", "AnnotationHubData", "Homo.sapiens", "LRBase.Hsa.eg.db", "LRBase.Mmu.eg.db", "MeSH.Hsa.eg.db", "MeSH.Mmu.eg.db", "reactome.db", "RUnit", "graphite", "scTGIF", "ggplot2", "VennDiagram"), ask=FALSE); remotes::install_github(c("rikenbit/scTensor", "rikenbit/LRBaseDbi"))'