# Load required libraries
library(httr)
library(caTools)

# Set endpoint URL, base 64 encode access credentials
url <- "https://api.backblaze.com/b2api/v1/b2_authorize_account"
accessToken <- caTools::base64encode("ACCOUNT_ID:AUTHORIZATION_KEY") # Add your own credentials

# Authorise
b2AuthorizeAccount <- httr::GET(url=url, add_headers(Authorization = paste("Basic ", accessToken, sep="")))


