install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)

###### Get NBN Atlas data ######
# NBN Atlas record filter:
#     - No unconfirmed, unconfirmed (not reviewed) or unconfirmed (plausible)
#     - No absences

getNBNData = function(latinName,numRecords){
  # Split species name into genus and species to parse the API for NBN Atlas
  binomNmSplit = strsplit(latinName,"[ ]")
  genus = binomNmSplit[[1]][1]
  species = binomNmSplit[[1]][2]
  
  if (species != "sp.") {
    api=paste("https://records-ws.nbnatlas.org/occurrences/search?",
              "q=*:*&fq=genus:",
              genus,
              "&fq=-(identification_verification_status%3A%22Unconfirmed%22%20OR",
              "%20identification_verification_status%3A%22Unconfirmed%20-%20",
              "not%20reviewed%22%20OR%20identification_verification_status%3A%22",
              "Unconfirmed%20-%20plausible%22)&fq=-occurrence_status%3A%22absent",
              "%22&fq=taxon_name%3A%22",
              genus,
              "%20",
              species,
              "%22&pageSize=",numRecords,sep = "")
  } else {
    api=paste("https://records-ws.nbnatlas.org/occurrences/search?",
              "q=*:*&fq=genus:",
              genus,
              "&fq=-(identification_verification_status%3A%22Unconfirmed%22%20OR",
              "%20identification_verification_status%3A%22Unconfirmed%20-%20",
              "not%20reviewed%22%20OR%20identification_verification_status%3A%22",
              "Unconfirmed%20-%20plausible%22)&fq=-occurrence_status%3A%22absent",
              "%22&fq=taxon_name%3A%22",
              genus,
              "%22&pageSize=",numRecords,sep = "")
  }
  taxonInfo = GET(api)
  taxonInfoContent = httr::content(taxonInfo, as = 'text')
  taxonInfoContentJSON = jsonlite::fromJSON(taxonInfoContent)
  df=taxonInfoContentJSON$occurrences
  return(df)
}




  

