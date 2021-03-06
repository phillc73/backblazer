% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/b2GetUploadUrl.R
\name{b2GetUploadUrl}
\alias{b2GetUploadUrl}
\title{Get B2 Upload URL.}
\usage{
b2GetUploadUrl(bucketId)
}
\arguments{
\item{bucketId}{The unique identifier of the bucket where files are to be
uploaded. Bucket IDs may be obtained through the
\code{b2ListBuckets} function in this package.}
}
\value{
If successful a list will be returned containing \code{bucketId},
  \code{uploadURL} and \code{authorizationToken}.
}
\description{
\code{b2GetUploadUrl} returns the URL required in order to upload files to
the user's account on the Backblaze B2 cloud storage product.
}
\details{
This function returns the URL required in order to upload files the user's
account on the Backblaze B2 cloud storage product. An uploadUrl and upload
authorizationToken are also returned. These are valid for 24 hours or until
the endpoint rejects an upload, Further details regarding this API call are
available here:

\url{https://www.backblaze.com/b2/docs/b2_get_upload_url.html}

\code{bucketId} is mandatory and must be user defined.
}
\examples{
\dontrun{
uploadUrlReturn <- b2GetUploadUrl(bucketId = "aUniqueBucketId")
uploadUrl <- uploadUrlReturn$uploadUrl
authToken <- uploadUrlReturn$authorizationToken
}

}

