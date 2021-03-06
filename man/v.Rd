% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/es_calcs.R
\name{v}
\alias{v}
\title{Calculate the V effect size statistic}
\usage{
v(data, formula, ref_group = NULL)
}
\arguments{
\item{data}{The data frame used for estimation - ideally structured in a tidy 
format.}

\item{formula}{A formula of the type \code{out ~ group} where \code{out} is
the outcome variable and \code{group} is the grouping variable. Note this
variable can include any arbitrary number of groups. Additional variables 
can be included with \code{+} to produce separate estimates by the secondary 
or tertiary variables of interest (e.g., \code{out ~ group + characteristic1 
+ characteristic2}).}

\item{ref_group}{Optional. A character vector or forumla listing the 
reference group levels for each variable on the right hand side of the 
formula, supplied in the same order as the formula. Note that if using the
formula version, levels that are numbers, or include hyphens, spaces, etc., 
should be wrapped in back ticks (e.g., 
\code{ref_group = ~ Active + `Non-FRL`}, or \code{ref_group = ~`8`}). When 
in doubt, it is safest to use the back ticks, as they will not interfere 
with anything if they are not needed. See examples below for more details.}
}
\value{
By default the V statistic for all possible pairings of
 the grouping factor are returned as a tidy data frame. Alternatively, a 
vector can be returned, and/or only the V corresponding to a specific
reference group can be returned.
}
\description{
This function calculates the effect size V, as discussed by 
\href{https://journals.sagepub.com/doi/abs/10.3102/1076998609332755}{Ho, 2009}. The V
statistic is a transformation of \code{\link{auc}}, interpreted as the 
average difference between the distributions in standard deviation units.
}
\examples{

# Calculate V for all pairwise comparisons
v(star, reading ~ condition) 

# Report only relative to regular-sized classrooms
v(star, 
    reading ~ condition, 
    ref_group = "reg")

# Report by ELL and FRL groups for each season, compare to non-ELL students
# who were not eligible for free or reduced price lunch in the fall (using
# the formula interface for reference group referencing).

\dontrun{
v(benchmarks, 
      math ~ ell + frl + season,
      ref_group = ~`Non-ELL` + `Non-FRL` + Fall)

# Same thing but with character vector supplied, rather than a formula
v(benchmarks, 
      math ~ ell + frl + season,
      ref_group = c("Non-ELL", "Non-FRL", "Fall"))
}

}
