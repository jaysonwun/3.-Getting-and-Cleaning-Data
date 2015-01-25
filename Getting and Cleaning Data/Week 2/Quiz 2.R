 Quiz 2.
# Problem 1.
library(httr)
library(httpuv)
library(jsonlite)
oauth_endpoints("github")
# 
myapp <- oauth_app("github", <token>, <token>)
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
json1=content(req)
json2=jsonlite::fromJSON(toJSON(json1))
json2[2,45]
# 2013-11-07T13:25:07Z


# Problem 2.
library(sqldf)
setwd("~/Coursera/Getting and Cleaning Data/Week 2")
url <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
download.file(url, destfile="acs.csv", mode="w")
acs<- read.csv("acs.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")

# Problem 3.
qldf("select distinct AGEP from acs")

# Problem 4.
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
library(XML)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

# Problem 5.
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, destfile="question5.for")
#fixed width file
x<- read.fwf(file="question5.for", widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum(x[4])