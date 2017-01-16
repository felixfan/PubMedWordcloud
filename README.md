[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badge/)
[![GPL Licence](https://badges.frapsoft.com/os/gpl/gpl.svg?v=103)](https://opensource.org/licenses/GPL-3.0/)
[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)

# PubMed wordcloud

Examples of how to create a word cloud using abstracts in PubMed

updated on Thu Oct 16 00:09:49 2014

**PubMedWordcloud** is avaliable on [CRAN](https://CRAN.R-project.org/package=PubMedWordcloud) and [GitHub](https://github.com/felixfan/PubMedWordcloud)

[More about me](http://felixfan.github.io)


```r
install.packages("PubMedWordcloud",dependencies=TRUE)
```

or


```r
library(devtools)
install_github("felixfan/PubMedWordcloud") # from GitHub
```


```r
library(PubMedWordcloud)
```

1. wordcloud of my publications
--------------------------------------
### 1.1 retrieve PMIDs from PubMed

Since my first paper was published in 2007, I will retrieve all PMIDs of my paper from 2007 to this year (2014). I used both 'Yan-Hui Fan' and 'Yanhui Fan' as my name, so I assigned PMIDs for these two names to 'pmid1' and 'pmid2', respectively.


```r
pmid1=getPMIDs(author="Yan-Hui Fan",dFrom=2007,dTo=2014,n=10)
pmid1
```

[1] "24935264" "24721834" "22698742" "22693232" "22564732" "22301463"
[7] "22015308" "21283797"

```r
pmid2=getPMIDs(author="Yanhui Fan",dFrom=2007,dTo=2014,n=10)
pmid2
```

[1] "24890309" "20576513" "19412437"

There are eight PMIDs in 'pmid1' and three PMIDs in 'pmid2'.

### 1.2 edit PMIDs

Note that 'pmid1' and 'pmid2' are vectors, so it is easy to add or delete PMIDs to 'pmid1' and 'pmid2', or combine them. I also write a function to do it, in case you do not want to find out how to do it.

PMID "22698742" in 'pmid1' and "20576513" in 'pmid2' are published by others (have the same name with me). So I want to exclude them and then combine 'pmid1' and 'pmid2'.


```r
rm1="22698742"
pmids1=editPMIDs(x=pmid1,y=rm1,method="exclude")

rm2="20576513"
pmids2=editPMIDs(x=pmid2,y=rm2,method="exclude")

pmids=editPMIDs(x=pmids1,y=pmids2,method="add")
```

**Note: only unique PMIDs were kept**

### 1.3 download abstracts


```r
abstracts=getAbstracts(pmids)
```

### 1.4 clean abstracts

clean data using paackage {tm}: remove Punctuations, remove Numbers, Translate characters to lower or upper case, remove stopwords, remove user specified words, Stemming words.


```r
cleanAbs=cleanAbstracts(abstracts)
```

### 1.5 plot wordcloud using 'plotWordCloud'

Plot  withdafault parameters

```r
plotWordCloud(cleanAbs,min.freq = 2, scale = c(2, 0.3))
```

![](/figure/unnamed-chunk-8-1.png)

Do not rotate words.

```r
plotWordCloud(cleanAbs,min.freq = 2, scale = c(2, 0.3),rot.per=0)
```

![](/figure/unnamed-chunk-9-1.png)

Plot using other colors.

```r
colors=colSets(type="Paired")
plotWordCloud(cleanAbs,min.freq = 2, scale = c(2, 0.3),colors=colors)
```

![](/figure/unnamed-chunk-10-1.png)

Clean the data with Stemming words is TRUE and plot again.

```r
cleanAbs2=cleanAbstracts(abstracts,stemDoc =TRUE)
plotWordCloud(cleanAbs2,min.freq = 2, scale = c(2, 0.3))
```

![](/figure/unnamed-chunk-11-1.png)

**Note: ** 'plotWordCloud' uasually will generate a lot of warnings. Many words could not be fit on page. try to adjust the scale parameter, using smaller value may remove these warnings.

4. References
-----------------
[Shiny Pubmed Word Clouds](http://www.vesnam.com/Rblog/pubmedwordcloud/)
[wordcloud](https://CRAN.R-project.org/package=wordcloud)
[GOsummaries: Word cloud summaries of GO enrichment analysis](https://www.bioconductor.org/packages/release/bioc/html/GOsummaries.html)
[How I used R to create a word cloud, step by step](http://georeferenced.wordpress.com/2013/01/15/rwordcloud/)
[NCBI](http://www.ncbi.nlm.nih.gov/books/NBK25500/)



# Citation:
Yanhui Fan. (2016). PubMedWordcloud: create word cloud using abstracts from PubMed. Zenodo. [![DOI](https://zenodo.org/badge/5810/felixfan/PubMedWordcloud.svg)](https://zenodo.org/badge/latestdoi/5810/felixfan/PubMedWordcloud)
