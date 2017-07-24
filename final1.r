mydata<-read.delim("/home/priyanka/Downloads/intern/dataset/digitremove.csv", sep=",", stringsAsFactors=FALSE,header=T, na.strings="")
head(mydata)
library(NLP)
library(tm)
library(FSelector)
library(Formula)
corpus<-VCorpus(VectorSource(mydata$digirem))
corpus<-tm_map(corpus, stripWhitespace)
dtm=DocumentTermMatrix(corpus)
mat<-as.matrix(dtm)
dataframe<-data.frame(mat)

category<-mydata$Class
dataframe<-cbind(dataframe,category)


weights <- chi.squared(category~., dataframe)
subset <- cutoff.k(weights, 1800)
f <- as.simple.formula(subset, "category")

mf3 <- model.frame(f, data = grams)
write.csv(mf3,"selected_cols.csv")