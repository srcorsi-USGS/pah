% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pah_profiles.R
\name{pah_profiler}
\alias{pah_profiler}
\title{pah_profiler}
\usage{
pah_profiler(pah_dat, compound_column = "casrn", sample_column,
  conc_column, source_profs = source_profiles,
  creosote = "interpolated")
}
\arguments{
\item{pah_dat}{dataframe with PAH concentrations, where there is one column of compounds, and each sample
is contained in a column. If individual samples are to be averaged before computation, the user should supply
the average values.}

\item{compound_column}{column name which will be used to merge with source profiles. This can be a USGS pcode ('pcode'),
CAS registration number ('casrn'), or compound name ('Compound').}

\item{sample_column}{column name of unique sample identifier}

\item{conc_column}{column name of reported concentrations}

\item{source_profs}{a dataframe of source profiles. The default is to use the built-in `source_profiles` table,
but users can provide their own table. This is useful if the user has a source profile to add to the built-in table.}

\item{creosote}{string, Setting for how to handle the source profiles for creosote (n = 2). The source profiles
for creosote only include 11 compounds (missing BeP). However, in published source profiles, BeP is almost always equal to BaP.
Options for ways to handle these creosote profiles include 1) 'drop' to not include creosote profiles in the analysis,
2) 'raw' to include the creosote profiles but limit all profiles to the 11 compounds included in the creosote profiles,
or 3) 'interpolated' to include the creosote profiles where BeP is set equal to BaP.}
}
\value{
Returns two data frames. The first (profiles) is a long dataframe where observations are repeated for
each sample/compound/source combination, and reports the proportional concentration of that unique compound/sample combination,
and chi-squared distance between the source and sample. Additionally, the function adds
all columns in `source_profiles`.  The second dataframe is a long data frame where observations are repeated for
each unique sample/source combination, and the chi2 value is summed across all compounds to create a distance
metric between each sample and source profile.
}
\description{
Creates profiles of PAH compounds in the sample and compares them to source profiles. The
difference between the sample and the source is calculated using a chi-squared statistic. To see
which 12 compounds are used from the source profiles, see the table `source_profiles`.
}
