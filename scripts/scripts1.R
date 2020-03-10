#załadowanie bibliotek
library(tm)

#zmiana katalogu roboczego

workDir <- "D:\\AH\\TextMining"
setwd(workDir)

#defeinicja katalogów funkcjonalnych

inputDir <- ".\\data"
outputDir <- ".\\results"
scriptsDir <- ".\\scripts"
workspacesDir <- ".\\workspaces"
#utworzenie korpusu dokumentów

corpusDir <- paste(inputDir, sep = "\\")

corpus <- VCorpus(
  DirSource(
    corpusDir,
    pattern = "*.txt",
    encoding = "UTF-8"
  ),
  readerControl = list(
    language = "pl_PL"
  )
)

#wstępne przetwarzaniea

corpus <- tm_map(corpus, removeNumbers)

corpus <- tm_map(corpus, removePunctuation)

corpus <- tm_map(corpus, content_transformer(tolower))
stopListFile <- paste(inputDir,"stopwords_pl.txt",sep = "\\")
stopList <- readLines(stopListFile, encoding = "UTF-8")
corpus <- tm_map(corpus, removeWords, stopList)
corpus <- tm_map(corpus, stripWhitespace)

#wyświetlenie zawartości korpusu
writeLines(as.character(corpus[[1]]))
writeLines(corpus[[1]]$content)


