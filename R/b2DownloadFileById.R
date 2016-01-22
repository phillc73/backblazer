# B2 Download File by ID

b2DownloadFileById <- function(fileId, overwrite = FALSE){

  # Function options from input, make a dataframe
  fileId <- as.data.frame(fileId, stringsAsFactors = FALSE)

  # API call
  b2Return <- httr::POST(paste(accountAuthorization$downloadUrl,"/b2api/v1/b2_download_file_by_id", sep=""), body = jsonlite::toJSON(unbox(fileId), pretty = TRUE), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)), write_disk("tmp", overwrite = overwrite))

  # Alternative GET call
  # b2Return <- httr::GET(url = paste(accountAuthorization$downloadUrl,"/b2api/v1/b2_download_file_by_id?fileId=", fileId, sep=""), add_headers('Authorization' = as.character(accountAuthorization$authorizationToken)), write_disk("tmp", overwrite))

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

