# List B2 File Versions

b2ListFileVersions <- function(bucketId){

  bucketId <- as.data.frame(bucketId, stringsAsFactors = FALSE)

  b2Return <- httr::POST(paste(accountAuthorization$apiUrl,"/b2api/v1/b2_list_file_versions", sep=""), body = jsonlite::toJSON(unbox(bucketId), pretty = TRUE), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)))

  # Output as dataframe
  b2Return <- jsonlite::fromJSON(content(b2Return, type = "text"))
  b2Return[[1]]

}
