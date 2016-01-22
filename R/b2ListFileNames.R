# List B2 Files

b2ListFileNames <- function(bucketId){

  # Function options from input, make a dataframe
  bucketId <- as.data.frame(bucketId, stringsAsFactors = FALSE)

  # API call
  b2Return <- httr::POST(paste(accountAuthorization$apiUrl,"/b2api/v1/b2_list_file_names", sep=""), body = jsonlite::toJSON(unbox(bucketId), pretty = TRUE), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)))

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



