#' Download raw prescription data for specified county (by state and county names) into R
#'
#' Data from from non-contiguous states not yet processed and available.
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- county_raw(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

county_raw <- function(county = "Mingo", state = "WV", key="WaPo") {


  url <- "https://arcos-api.ext.nile.works/v1/county_data"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    #county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    #df <- vroom(url)
    url <- gsub(" ", "%20", url)
    df <- fromJSON(url)
    return(df)
  } else {
    message("Error: API key needed.")
  }
}

#' Download raw prescription data for specified county (by county FIPS code) into R
#'
#' Data from from non-contiguous states not yet processed and available.
#'
#' @param fips Filter the data to only this county (e.g. ‘01001’ for Autauga, Alabama)
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \dontrun{
#' library(arcos)
#'
#' autauga_al <- county_raw_fips(fips="01001", key="WaPo")
#'
#' head(autauga_al)
#' }
#' @export

county_raw_fips <- function(fips="01001", key="WaPo") {

  url <- "https://arcos-api.ext.nile.works/v1/county_fips_data"

  if (missing(key)) {
    message("Error: API key needed.")
    } else {
        url <- param_set(url, key = "key", value = key)

        if (!missing(fips)) {
            url <- param_set(url, key = "fips", value = fips)
            #df <- vroom(url)
            url <- gsub(" ", "%20", url)

            df <- fromJSON(url)
            return(df)
          } else {
            message("Error: No FIPS code detected")
          }
      }
}


#' Download raw prescription data for specified pharmacy (by BUYER_DEA_NO) into R
#'
#' Data from from non-contiguous states not yet processed and available.
#'
#' @param buyer_dea_no Filter the data to only this pharmacy (e.g. ‘AB0454176’)
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \dontrun{
#' library(arcos)
#'
#' solo_pharm <- pharmacy_raw(buyer_dea_no="AB0454176", key="WaPo")
#'
#' head(solo_pharm)
#' }
#' @export

pharmacy_raw <- function(buyer_dea_no="AB0454176", key="WaPo") {


  url <- "https://arcos-api.ext.nile.works/v1/pharmacy_data"

  if (missing(key)) {
    message("Error: API key needed.")
  } else {
    url <- param_set(url, key = "key", value = key)

    if (!missing(buyer_dea_no)) {
      url <- param_set(url, key = "buyer_dea_no", value = buyer_dea_no)
      #df <- vroom(url)
      url <- gsub(" ", "%20", url)

      df <- fromJSON(url)
      return(df)
    } else {
      message("Error: No BUYER_DEA_NO id detected")
    }
  }
}


#' Download raw ARCOS data (Warning 130+ GB file)
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \dontrun{
#' library(arcos)
#'
#' the_whole_thing <- raw_data(key="WaPo")
#'
#' head(the_whole_thing)
#' }
#' @export

raw_data <- function(key="WaPo") {


  url <- "https://arcos-api.ext.nile.works/v1/all_the_data"

  if (missing(key)) {
    message("Error: API key needed.")
  } else {
    url <- param_set(url, key = "key", value = key)

      df <- vroom(url)

      #df <- fromJSON(url)
      return(df)
  }
}


# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

