\name{occurrenceMap}
\alias{occurrenceMap}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Map Species Observations
}
\description{
This function creates a map of occurrence records and has the option to plot a density map as well.
}
\usage{
occurrenceMap(basemap, sppDF, colGroup = "a",
              pointsPlot=TRUE, kdePlot = FALSE, plotTitle)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{basemap}{
sf object. Basemap i.e. map of countries.
}
  \item{sppDF}{
  Dataframe. Dataframe must include two columns named "decimalLongitude" and "decimalLatitude".
  }
  \item{colGroup}{
  Character. Species colour group for colour of points map and density map; "a" is teal, "b" is red.
  }
  \item{pointsPlot}{
  Boolean. Option to make a points map. Defaults to TRUE.
  }
  \item{kdePlot}{
  Boolean. Option to make a density map. Defaults to FALSE.
  }
  \item{plotTitle}{
  String. Name of the title for both types of plot.
  }
}
\details{
Projection/CRS of base map, NBN Atlas coordinates: WGS 84.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or standard data sets, see data().

## The function is currently defined as
function (x) 
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
