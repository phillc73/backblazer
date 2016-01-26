#' B2 Get File Info.
#'
#' \code{b2GetFileInfo} returns information about a single file from the user's
#' account on the Backblaze B2 cloud storage product.
#'
#' This function returns information about a single file from the user's account
#' on the Backblaze B2 cloud storage product. Further details regarding this API
#' call are available here:
#'
#' \url{https://www.backblaze.com/b2/docs/b2_get_file_info.html}
#'
#' B2 Get File Info \code{fileId} is mandatory and must be user defined.
#'
#' @param fileId The unique identifier of the file whose information is
#'   required. File IDs may be obtained through the \code{b2ListFiles},
#'   \code{b2ListFileVersions} and \code{b2UploadFile} functions in this
#'   package.
#' @return If successful a list will be returned containing \code{fileId},
#'   \code{fileName}, \code{accountId}, \code{contentSha1}, \code{bucketId},
#'   \code{contentLength}, \code{contentType} and \code{fileInfo}.
#'
#' @examples
#' \dontrun{
#' b2GetFileInfo(fileId = "Unique_identifier_of_the_file")
#' }
#'


b2GetFileInfo <- function(fileId) {
  # Function options from input, make a dataframe
  fileId <- as.data.frame(fileId, stringsAsFactors = FALSE)

  # API call
  b2Return <-
    httr::POST(
      paste(
        accountAuthorization$apiUrl,"/b2api/v1/b2_get_file_info", sep = ""
      ), body = jsonlite::toJSON(unbox(fileId), pretty = TRUE), add_headers(
        'Authorization' = as.character(accountAuthorization$authorizationToken)
      )
    )

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
