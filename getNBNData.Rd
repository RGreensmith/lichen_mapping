\name{getNBNData}
\alias{getNBNData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
NBN Atlas data
}
\description{
Get species occurrence data from the NBN Atlas. for using the NBN Atlas API key to get the lichen occurrence records.
The function filters out the following: unconfirmed, unconfirmed (not reviewed) or unconfirmed (plausible)
and absences
}
\usage{
getNBNData(char,x)
}
\arguments{
  \item{latinName}{
Binomial latin name of the species i.e. "Phocoena phocoena". Can also use genus only, but need to include 'sp' i.e. "Larus sp". Always needs to include a space inbetween the genus and species.
}
  \item{numRecords}{
Number of records to get from the NBN API
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
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
getNBNData(latinName,numRecords) 
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
