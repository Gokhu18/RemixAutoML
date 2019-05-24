% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RemixAutoML.R
\name{CreateCalendarVariables}
\alias{CreateCalendarVariables}
\title{CreateCalendarVariables Create Caledar Variables}
\usage{
CreateCalendarVariables(data, DateCols = NULL, AsFactor = FALSE,
  TimeUnits = "wday")
}
\arguments{
\item{data}{This is your data}

\item{DateCols}{Supply either column names or column numbers of your date columns you want to use for creating calendar variables}

\item{AsFactor}{Set to TRUE if you want factor type columns returned; otherwise integer type columns will be returned}

\item{TimeUnits}{Supply a character vector of time units for creating calendar variables. Options include: "second", "minute", "hour", "wday", "mday", "yday", "week", "isoweek", "month", "quarter", "year"}
}
\value{
Returns your data.table with the added calendar variables at the end
}
\description{
CreateCalendarVariables Rapidly creates calendar variables based on the date column you provide
}
\examples{
data <- data.table::data.table(Date = "2018-01-01 00:00:00")
data <- CreateCalendarVariables(data, DateCols = "Date", AsFactor = FALSE, TimeUnits = c("day", "month", "year"))
}
\seealso{
Other Feature Engineering: \code{\link{AutoDataPartition}},
  \code{\link{AutoWord2VecModeler}},
  \code{\link{DT_GDL_Feature_Engineering}},
  \code{\link{DummifyDT}},
  \code{\link{FAST_GDL_Feature_Engineering}},
  \code{\link{GDL_Feature_Engineering}},
  \code{\link{ModelDataPrep}},
  \code{\link{Scoring_GDL_Feature_Engineering}}
}
\author{
Adrian Antico
}
\concept{Feature Engineering}