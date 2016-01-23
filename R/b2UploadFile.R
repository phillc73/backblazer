# B2 Upload File

b2UploadFile <- function(authToken, uploadUrl, fileName){

  # Function options from input, make a dataframe
  # File Name
  fileNameEncoded <- URLencode(fileName, reserved = TRUE)
  # File Size
  fileSize <- file.size(fileName)
  # sha1 hash of file
  sha1Hash <- openssl::sha1(fileName)
  # File Types List
  b2FileTypes <- readRDS("data/b2FileTypes.rds")
  b2ContentType <- b2FileTypes$contentType[grepl(fileNameExtension, b2FileTypes$fileExtension) == TRUE]

  # API call
  b2Return <- httr::POST(uploadUrl, body = fileName, add_headers('Authorization' = as.character(authToken), 'X-Bz-File-Name' = as.character(fileNameEncoded), 'Content-Type' = as.character(b2ContentType), 'Content-Length' = as.character(fileSize), 'X-Bz-Content-Sha1' = as.character(sha1Hash)))

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
}
