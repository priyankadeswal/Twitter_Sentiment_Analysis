data.file<-read.delim("/home/priyanka/Downloads/intern/dataset/digitremove.csv", sep=",", stringsAsFactors=FALSE,header=T, na.strings="")
head(data.file)
data.test<-data.file$digirem
head(data.test)

read_pos <- read.csv("/home/priyanka/Downloads/lexicon-based/opinion-lexicon-English/positive-words.txt", header = F)
read_neg <- read.csv("/home/priyanka/Downloads/lexicon-based/opinion-lexicon-English//negative-words.txt", header = F)
library(stringi)
countEmoticons <- function(textStr, patternList) {
  
  patternList$count <- sapply(patternList$V1, function(x) stri_count_fixed(textStr, x))
  sum(patternList$count)
}

data.test$positive <- sapply(data.test, function(x) countEmoticons(x, read_pos))
data.test$negative <- sapply(data.test, function(x) countEmoticons(x, read_neg))
head(data.test$positive)
