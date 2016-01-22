# Create Bucket

b2CreateBucket <- function(bucketName, bucketType){

  # Function options from input, make a dataframe
  accountId <- as.character(accountAuthorization$accountId)
  accountId <- as.data.frame(accountId, stringsAsFactors = FALSE)
  bucketName <- as.data.frame(bucketName, stringsAsFactors = FALSE)
  bucketType <- as.data.frame(bucketType, stringsAsFactors = FALSE)

  # Bind function option data frames together
  vars <- cbind(accountId, bucketName, bucketType)

  # API call
  b2Return <- httr::POST(paste(accountAuthorization$apiUrl,"/b2api/v1/b2_create_bucket", sep=""), body = jsonlite::toJSON(unbox(vars), pretty = TRUE), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)))

  # Check for bad authorisation and sent message
  if (httr::status_code(b2Return) != "200") {
    badReturn <- jsonlite::fromJSON(content(b2Return,type = "text"))
    stop(
      "\nSomething went wrong. Please check the function options to ensure valid values. \n",
      "\nStatus Code: ", badReturn$code, "\nMessage: ", badReturn$message
    )

  } else {
  # Output as dataframe
    jsonlite::fromJSON(content(b2Return, type = "text"))
  }
}
