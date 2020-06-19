library(tidyverse)

dd_concerts <- as_tibble(read.csv(file="https://raw.githubusercontent.com/asperanz/Dead-Dogs-Analytics/master/data/Dead%20Dogs%20Live%20Concerts.csv", header=TRUE, sep=",", stringsAsFactors=FALSE))