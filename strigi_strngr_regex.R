rm(list=ls())
library(dplyr)
library(stringi)
library(stringr)

setwd("C:/Fish/R/strigi_strngr_regex")

data=read.csv("flu_tweets 2015_12_21_23_15_29 non_georeferenced .csv",stringsAsFactors = F)

tweet=select(data,tweet)
x=tweet[1,1]

http=sapply(tweet, function(x) str_extract(x,'http.*'))

http2=sapply(http, function(x) which(!is.na))

str_replace(x,' http.*',"")

