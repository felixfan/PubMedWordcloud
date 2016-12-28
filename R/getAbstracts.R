#' @title get Abstracts
#' @description retrieve abstracts of the specified PMIDs from PubMed.
#' @param pmid a set of PMIDs
#' @param https  use https instead of http
#' @seealso \code{\link{getPMIDs}}
#' @export
#' @examples
#' # pmids=c("22693232", "22564732", "22301463", "22015308", "21283797", "19412437")
#' # abstracts=getAbstracts(pmids)
#' 
#' # pmid="22693232"
#' # abstract=getAbstracts(pmid)
#' 
#' # pmids=getPMIDs(author="Yan-Hui Fan",dFrom=2007,dTo=2013,n=10)
#' # abstracts=getAbstracts(pmids)
getAbstracts <-function(pmid,https=TRUE){
  if(length(pmid)>0){
  #Data record download - basic URL
    tmp <- "://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id="
    eDDownload <- ""
    if(https){
      eDDownload <- paste("https", tmp, sep="") 
    }else{
      eDDownload <- paste("http", tmp, sep="")
    }
    hlp1 <- paste(eDDownload, paste(pmid, collapse = ",", sep = ""), sep = "")
    hlp2 <- paste(hlp1, "&rettype=abstract", sep = "")
    xData <- getURL(hlp2)
    testDoc <- xmlTreeParse(xData, useInternalNodes = TRUE)
    topFetch <-xmlRoot(testDoc)
    abst <- xpathSApply(topFetch, "//Abstract", xmlValue)
  }else{
    abst = c("Zero", "Articles", "Found")
  }
return(abst)
}
