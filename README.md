# Sentiment-Analysis-Project

## This is R code that I used to plot and visualize the most frequent words used in my sent emails and to perform sentiment analysis.

### Description
This project was created to analyze the language used in sent emails and determine what sentiments are conveyed through those emails. It is useful to know this information because it allows insight into how others perceive your emails and if the overall sentiment of the emails is positive or negative. I wanted to create this project to gain insight into my email data and practice working with unstructured data, cleaning, and analyzing data in R.

### Technologies
* R
* tm library version 0.7-9
* qdapRegex library version 0.7.5
* syuzhet library version 1.0.4
* wordcloud library version 2.6
* RColorBrewer library version 1.1-3
* Thunderbird

### Instructions
#### To download email data...
* Download emails from gmail using Google Takeout (https://takeout.google.com/)
* Emails will be downloaded as an mbox file
* Use Thunderbird to convert to text file
* Set working directory in R to where text file is saved so that it can be read into R
```
setwd("pathtotextfile")
```
#### To run this project in R, download the ZIP file and run the R script in the R console.

### Credits
* Learned how to code certain tasks from: https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/text-mining-and-sentiment-analysis-with-r/
