Backblazer
=======

Bindings to the [Backblaze B2 API](https://www.backblaze.com/b2/docs/). 

This package provides convenience functions for the Backblaze B2
cloud storage API. All B2 API calls are mapped to equivalent R functions.
This package allows R programs upload, download and delete files from B2.

## Quick start

### Install

```r
# install.packages("devtools")
devtools::install_github("phillc73/backblazer")
library("backblazer")
```
### Required Packages

The following additional R packages are required.

```r
# Requires a minimum of version 1.0.0
library("httr")
# Requires a minimum of version 0.9.19
library("jsonlite")
# Requires a minimum of version 0.9.1
library("openssl")
# Requires a minimum of version 3.2.3. Included in base R.
library("tools")
```

## Supported Functions

```
?b2AuthorizeAccount
?b2CreateBucket
?b2DeleteBucket
?b2DeleteFileVersion
?b2DownloadFilebyId
?b2DownloadFileByName
?b2GetFileInfo
?b2GetUploadUrl
?b2HideFile
?b2ListBuckets
?b2ListFileNames
?b2ListFileVersions
?b2UpdateBucket
?b2UploadFile
```
This list covers all Backblaze B2 API functions. Each function contains documented descriptions for their use. All mandatory parameters are included for the functions to operate. Some optional parameters are included. It is currently possible to upload, download, list, hide and delete files in a Backblaze B2 account using this package.

### How to Use

A [more detailed vignette is available](https://github.com/phillc73/backblazer/blob/master/vignettes/backblazer-howToUse.Rmd) with details regarding how to use each of these functions.

Please refer directly to the [Backblaze B2 API documentation](https://www.backblaze.com/b2/docs/) for even further information.

## Status

This should be largely complete and covers all Backblaze B2 API calls.

Current Version: 0.1

### Issues

Problems? Something just doesn't work?

[Submit issues here](https://github.com/phillc73/backblazer/issues).

## Links

* [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html)
* [Backblaze B2 Documentation](https://www.backblaze.com/b2/docs/)
* [Author's Website](http://www.starkingdom.co.uk)
* [Author on Twitter](https://twitter.com/_starkingdom)

## Disclaimer

The `backblazer` package is provided with absolutely no warranty. All `backblazer` functions have been tested and should work, but they may not work as you think they do. Be careful with your stuff. Things may go wrong. Author accepts no responsibility for lost, damaged or otherwise soiled files. 





