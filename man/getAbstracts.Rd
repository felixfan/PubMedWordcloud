\name{getAbstracts}
\alias{getAbstracts}
\title{get Abstracts}
\usage{
  getAbstracts(pmid)
}
\arguments{
  \item{pmid}{a set of PMIDs}
}
\description{
  retrieve abstracts of the specified PMIDs from PubMed.
}
\examples{
pmids=c("22693232", "22564732", "22301463", "22015308", "21283797", "19412437")
abstracts=getAbstracts(pmids)

pmid="22693232"
abstract=getAbstracts(pmid)

pmids=getPMIDs(author="Yan-Hui Fan",dFrom=2007,dTo=2013,n=10)
abstracts=getAbstracts(pmids)
}
\seealso{
  \code{\link{getPMIDs}}
}

