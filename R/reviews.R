#' Amazon.com Book Reviews
#'
#' Amazon.com reader-reviews of several popular books.
#' 
#' @name reviews 
#'
#' @format A data frame with 243,269 observations on the following 5 variables.
#' \describe{
#'    \item{\code{book}}{The book under review. Values along with 
#' book-titles are as follows:  hunger = The Hunger Games,
#' shades Fifty Shades of Gray, fault = The Fault in our Stars,
#' martian = The Martian, unbroken =  Unbroken,
#' gonegirl =  The Gone Girl,
#' goldfinch =  The Goldfinch}
#'    \item{\code{rating}}{rating assigned (1-5)}
#'    \item{\code{URL_fragment}}{Prepend "https://www.amazon.com/" 
#' to get the full URL of the review.}
#'    \item{\code{review_title}}{Title of the review; usually a 
#' concise judgment of the book.}
#'    \item{\code{content}}{HTML of the review text.}
#' }
#' @source  This data frame is a compilation of the data sets in
#' "Amazon Book Reviews", in the UC-Irvine Machine Learning Repository.
#' See \url{https://archive.ics.uci.edu/ml/datasets/Amazon+book+reviews}
#' for more information.
#' @keywords datasets
#'
NA