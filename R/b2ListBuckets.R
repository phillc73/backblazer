# List B2 Buckets

b2ListBuckets <- function(){

  # API call
  b2Return <- httr::GET(paste(accountAuthorization$apiUrl,"/b2api/v1/b2_list_buckets?accountId=",accountAuthorization$accountId,sep=""), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)))

  # Check for bad authorisation and sent message
  if (httr::status_code(b2Return) != "200") {
    badReturn <- jsonlite::fromJSON(content(b2Return,type = "text"))
    stop(
      "\nSomething went wrong. Please check the function options to ensure valid values. \n",
      "\nStatus Code: ", badReturn$code, "\nMessage: ", badReturn$message
    )

  } else {
  # Output as dataframe
   b2Return <- jsonlite::fromJSON(content(b2Return, type = "text"))
   b2Return[[1]]
  }
}

