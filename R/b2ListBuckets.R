# List B2 Buckets

b2ListBuckets <- function(){

  b2Return <- httr::GET(paste(accountAuthorization$apiUrl,"/b2api/v1/b2_list_buckets?accountId=",accountAuthorization$accountId,sep=""), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)))

  # Output as dataframe
  as.data.frame(
    jsonlite::fromJSON(content(b2Return, type = "text"))
  )

}
