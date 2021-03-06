% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subsetMaf.R
\name{subsetMaf}
\alias{subsetMaf}
\title{Subset MAF}
\usage{
subsetMaf(maf, tsb = NULL, genes = NULL, fields = NULL,
  query = NULL, mafObj = TRUE, includeSyn = TRUE, isTCGA = FALSE,
  dropLevels = TRUE, restrictTo = "all")
}
\arguments{
\item{maf}{an MAF object generated by \code{\link{read.maf}}}

\item{tsb}{subset by these samples (Tumor Sample Barcodes)}

\item{genes}{subset by these genes}

\item{fields}{include only these fields along with necessary fields in the output}

\item{query}{query string. e.g, "Variant_Classification == 'Missense_Mutation'" returns only Missense variants.}

\item{mafObj}{returns output as MAF class \code{\link{MAF-class}}. Default TRUE}

\item{includeSyn}{Default TRUE, only applicable when mafObj = FALSE. If mafObj = TRUE, synonymous variants will be stored in a seperate slot of MAF object.}

\item{isTCGA}{Is input MAF file from TCGA source.}

\item{dropLevels}{Default TRUE.}

\item{restrictTo}{restrict subset operations to these. Can be 'all', 'cnv', or 'mutations'. Default 'all'. If 'cnv' or 'mutations', subset operations will only be applied on copy-number or mutation data respectively, while retaining other parts as is.}
}
\value{
subset table or an object of class \code{\link{MAF-class}}
}
\description{
Subsets MAF based on given conditions.
}
\examples{
laml.maf <- system.file("extdata", "tcga_laml.maf.gz", package = "maftools")
laml <- read.maf(maf = laml.maf)
##Select all Splice_Site mutations from DNMT3A and NPM1
subsetMaf(maf = laml, genes = c('DNMT3A', 'NPM1'),
query = "Variant_Classification == 'Splice_Site'")
##Select all variants with VAF above 30\%
subsetMaf(maf = laml, query = "i_TumorVAF_WU > 30")
##Extract data for samples 'TCGA.AB.3009' and 'TCGA.AB.2933' but only include vaf filed.
subsetMaf(maf = laml, tsb = c('TCGA-AB-3009', 'TCGA-AB-2933'), fields = 'i_TumorVAF_WU')
}
\seealso{
\code{\link{getFields}}
}
