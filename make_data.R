# make some data

# use the corpora
# https://github.com/dariusk/corpora
# need to clone that into this dir
library(jsonlite)

filez <- list.files("corpora/data", recursive=TRUE, full.names=TRUE)

# remove the "words" part, as that's hard
filez <- filez[!grepl("corpora/data/words/", filez)]


big_list <- lapply(filez, read_json)


new_list <- list()
for(i in seq_along(big_list)){
  this_list <- big_list[[i]]

  desc <- this_list$description
  this_list$description <- NULL
  this_list$meta <- NULL
  this_list$source <- NULL

  if(length(this_list)==1){
    if(length(this_list[[1]][[1]])==1){
#      cat(names(this_list),"\n")
      if(!is.null(names(this_list))){
        new_list[[names(this_list)]] <- c(unlist(this_list))
      }
    }
  }
}

thingos <- new_list
save(thingos, file="thingos.RData")
