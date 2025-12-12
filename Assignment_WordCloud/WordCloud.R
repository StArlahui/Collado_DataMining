# Working directory
setwd("C:/Users/Crystal Collado/Documents/rprogramming")

# Required packages
#install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# Part 1 – Data Preparation
feedback <- readLines("feedback.txt", encoding = "UTF-8", warn = FALSE)
feedback <- paste(feedback, collapse = " ")

corpus <- Corpus(VectorSource(feedback))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, content_transformer(function(x) gsub("[^a-z ]", " ", x)))
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)

# Part 2 – Frequency Analysis
tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
word_freqs <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freqs), freq = word_freqs)

print("Top 10 Most Frequent Words")
print(head(df, 10))
print("Top 10 Most Frequent Words")
head(df, 10)
# The most used words are "food", "staff", and "restaurant", showing that customers frequently talk about the food quality, service, and place.
# Other words like "service", "dessert", "ambiance", "chicken", "soup", "steak", and "drinks" reflect feedback on dining experience, menu items, and overall satisfaction.
# This indicates that both the taste of food and the behavior of staff are major factors in customer experience.
# Complaints about slow service, seating, or crowdedness also appear but less frequently.
# Insights from these words can guide improvements in food preparation, menu variety, and staff performance.

# Part 3 – Main Word Cloud
png("wordcloud_exam.png", width = 800, height = 600)
set.seed(1126)
wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 2,
  max.words = 1000,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8, "Dark2")
)
dev.off()

# Part 4 – Rare Word Cloud (5 least frequent words)
df_rare <- subset(df, freq == 1)

print("Least Frequent Words")
print(head(df_rare, 5))

png("wordcloud_rare.png", width = 800, height = 600)
set.seed(709)
wordcloud(
  words = head(df_rare$word, 5),
  freq = head(df_rare$freq, 5),
  min.freq = 1,
  max.words = 5,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8, "Dark2")
)
dev.off()
