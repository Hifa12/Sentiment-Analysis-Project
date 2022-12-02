library("tm")
library("qdapRegex")
library("syuzhet")

#read emails
emails <- readLines("Sent.txt")

#remove email addresses
emails <- rm_email(emails, trim = TRUE, clean=TRUE, pattern = "@rm_email", replacement = "", extract = FALSE)

#Creating corpus object
emails <- Corpus(VectorSource(emails))

#Making all text lowercase
clean_emails <- tm_map(emails, content_transformer(tolower))
#Remove numbers, punctuation, unneeded spaces
clean_emails <- tm_map(clean_emails, removeNumbers)
clean_emails <- tm_map(clean_emails, removePunctuation)
clean_emails <- tm_map(clean_emails, stripWhitespace)
#Removing unnecessary words
clean_emails <- tm_map(clean_emails, removeWords, stopwords("english"))
clean_emails <- tm_map(clean_emails, removeWords, c("subject", "from", "date", "to", "hello", "hi", "sent", "haifa", "email", "will", "message", "attached", "khan", "erin"))

#Data frame of 20 most frequent words
clean_emails_tdm <- TermDocumentMatrix(clean_emails)
clean_emails_m <- as.matrix(clean_emails_tdm)
clean_emails_v <- sort(rowSums(clean_emails_m),decreasing=TRUE)
clean_emails_d <- data.frame(word = names(clean_emails_v),freq=clean_emails_v)
head(clean_emails_d, 20)

# Plot of 20 most frequent words
barplot(clean_emails_d[1:20,]$freq, las = 2, names.arg = clean_emails_d[1:20,]$word,
        col ="aquamarine2", main ="10 Most Frequent Words in my Emails", ylab = "Frequencies")

#Number of occurrences of words associated with different emotions
emotions <- get_nrc_sentiment(as.character(emails))
head(emotions,10)

#Sentiment scores of words by afinn scale
afinn_scores <- get_sentiment(emails, method="afinn")
head(afinn_scores)
summary(afinn_scores)

#Sentiment scores of words using bing scale
bing_score <- get_sentiment(emails, method="bing")
head(bing_score)
summary(bing_score)