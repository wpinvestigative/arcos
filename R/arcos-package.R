#' \code{arcos} package
#'
#' Download and use data from ARCOS, raw or summarized by the Washington Post, in R
#'
#'
#' @name arcos
#' @docType package
#' @author Andrew Ba Tran (@@abtran)
#' @author Steven Rich (@@dataeditor)
#' @author Aaron Williams (@@aboutaaron)
#' @importFrom stringr str_to_upper
#' @import magrittr
#' @importFrom jsonlite fromJSON
#' @import dplyr
#' @importFrom urltools param_set
#' @importFrom vroom vroom
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))
