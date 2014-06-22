#' @title PubMed wordcloud using function 'plotWordcloud' of package {GOsummaries}
#' 
#' @description grid based wordcloud drawing function
#' @param abstracts output of cleanAbstracts, or a data frame with one colume of 'word' and one colume of 'freq'.
#' @param rot.per proportion words with 90 degree rotation
#' @param max_min  relative scales to adjust the size difference between largest and smallest word, by default the largest word is written with 10 times as large font than the smallest
#' @param scale a fraction of the available space on figure that will be covered with the bounding boxes of words
#' @param min.freq words with frequency below min.freq will not be plotted
#' @param max.words Maximum number of words to be plotted. least frequent terms dropped
#' @param random.order plot words in random order. If false, they will be plotted in decreasing frequency
#' @param colors vector of colors fro the words. This vector will be extrapolated into as many colors as needed, starting with the first color for lower frequencies and ending with last color for higher frequencies.
#' @param random.colors if true, assigns random color for the words.
#' @param algorithm algorithm to find positions of words possible values: "circle", "leftside" and "rightside".
#' @param tryfit if TRUE the algorithm checks if all words fit to the figure, if not it tries gradually smaller values of scale parameter until everything fits
#' @param dimensions  a two element vector of units giving the width and height of the word cloud respectively
#' @details This function just call 'plotWordcloud' from package {GOsummaries}. See package {GOsummaries} for more details about the parameters.
#' @seealso \code{\link{plotWordCloud}}
#' @seealso \code{\link{colSets}}
#' @export
#' @examples
#' # Abs=getAbstracts(c("22693232", "22564732", "22301463", "22015308", "21283797", "19412437"))
#' # cleanAbs=cleanAbstracts(Abs)
#' # pmWordCloud(cleanAbs)
pmWordCloud<-function (abstracts, rot.per = 0.3, max_min = c(1, 0.1), scale = 0.2, min.freq = 2, 
                       max.words = Inf, random.order = FALSE, colors=colSets(type="Accent"), 
                       random.colors=TRUE,algorithm = c("circle","leftside","rightside"), 
					   tryfit = TRUE, dimensions = unit(c(1, 1), "npc")) {
  algorithm=match.arg(algorithm)
  plotWordcloud(words=abstracts$word,freq=abstracts$freq,rot.per=rot.per, max_min = max_min, 
                scale = scale, min.freq = min.freq, max.words = max.words, 
                random.order = random.order, colors=colors, algorithm =algorithm,
                tryfit = tryfit, dimensions = dimensions)
}
