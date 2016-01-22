# B2 Download File by Name

b2DownloadFileByName <- function(bucketName, fileName, overwrite = FALSE){

  # Function options from input, make a dataframe
  fileName <- as.data.frame(fileName, stringsAsFactors = FALSE)
  bucketName <- as.data.frame(bucketName, stringsAsFactors = FALSE)

  # Bind function option data frames together
  vars <- cbind(bucketName, fileName)

  # API call
  b2Return <- httr::GET(url = paste(accountAuthorization$downloadUrl,"/file/", bucketName, "/", fileName, sep=""), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)), write_disk("tmp", overwrite = overwrite))

  # Check for bad authorisation and sent message
  if (httr::status_code(b2Return) != "200") {
    badReturn <- jsonlite::fromJSON(content(b2Return,type = "text"))
    stop(
      "\nSomething went wrong. Please check the function options to ensure valid values. \n",
      "\nStatus Code: ", badReturn$code, "\nMessage: ", badReturn$message
    )

  } else {
    # Rename tmp
    if (file.exists(b2Return$headers$'x-bz-file-name') & !isTRUE(overwrite)) {
      print("Unable to write to disk. File(s) exist and overwrite is set to FALSE")
    }

    else {
      renameResult <- file.rename(from = "tmp", to = b2Return$headers$'x-bz-file-name')
      # Output message
      print("File(s) downloaded successfully and saved to disk.")
    }
  }
}
