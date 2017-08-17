#' @title get Abstracts
#' @description retrieve abstracts of the specified PMIDs from PubMed.
#' @param pmid a set of PMIDs
#' @param https  use https instead of http
#' @param s download how many PMIDs each time
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
getAbstracts <-function(pmid,https=TRUE,s=100){
  n = length(pmid)
  cat("There are total", n, "PMIDs\n")
  if(n>0){
    abst <- c()
  #Data record download - basic URL
    tmp <- "://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id="
    eDDownload <- ""
    if(https){
      eDDownload <- paste("https", tmp, sep="")
    }else{
      eDDownload <- paste("http", tmp, sep="")
    }
    if(n <= s){
        hlp1 <- paste(eDDownload, paste(pmid, collapse = ",", sep = ""), sep = "")
        hlp2 <- paste(hlp1, "&rettype=abstract", sep = "")
        xData <- getURL(hlp2)
        testDoc <- xmlTreeParse(xData, useInternalNodes = TRUE)
        topFetch <-xmlRoot(testDoc)
        abst <- xpathSApply(topFetch, "//Abstract", xmlValue)
    }
    else{
        from = 1
        to = s
        while(1){
            cat("downloading abstracts for PMIDs from", from, "to", to, "...\n")
            hlp1 <- paste(eDDownload, paste(pmid[from:to], collapse = ",", sep = ""), sep = "")
            hlp2 <- paste(hlp1, "&rettype=abstract", sep = "")
            xData <- getURL(hlp2)
            testDoc <- xmlTreeParse(xData, useInternalNodes = TRUE)
            topFetch <-xmlRoot(testDoc)
            tmp <- xpathSApply(topFetch, "//Abstract", xmlValue)
            if(to == n){
                break
            }
            else{
                from = to + 1
                if(to + s <= n){
                    to = to +s
                }
                else{
                    to = n
                }
            }
            abst <- c(abst, tmp)
        }
    }
  }else{
    abst = c("Zero", "Articles", "Found")
  }
return(abst)
}
