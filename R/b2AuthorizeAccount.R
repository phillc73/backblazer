# Authorise B2 Account

b2AuthorizeAccount <- function(url, accountId, authorizationKey) {
  # Combine Account Id and Authorisation Key
  accessToken <- paste(accountId,":",authorizationKey, sep="")
  # Base 64 encode access token
  accessToken <- caTools::base64encode(accessToken)
  # GET the data
  b2Return <-
    httr::GET(url = url, add_headers(Authorization = paste("Basic ", accessToken, sep ="")))

  # Check for bad authorisation and sent message
  if (httr::status_code(b2Return) != "200") {
    badReturn <- jsonlite::fromJSON(content(b2Return,type = "text"))
    stop(
      "Status Code: ", badReturn$code, "\n Message: ", badReturn$message, "\nPlease check your account ID and Authorisation Key. Remember, a new Authorisation key is generated every time you click 'Create application key' in the B2 web interface. \n"
    )

  } else {
    # Output as dataframe. Global variable, ooooohh
    accountAuthorization <<- as.data.frame(
      jsonlite::fromJSON(content(b2Return, type = "text"))
      )
  }
}


