#' Download raw prescription data for specified county (by state and county names) into R
#'
#' Data from from non-contiguous states not yet processed and available. This raw data only includes data from pharmacies and practitioners and the drugs Hydrocodne and Oxycodone.
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
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
#' Data from from non-contiguous states not yet processed and available. This raw data only includes data from pharmacies and practitioners and the drugs Hydrocodne and Oxycodone.
#'
#' @param fips Filter the data to only this county (e.g. ‘01001’ for Autauga, Alabama)
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
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
#' Data from from non-contiguous states not yet processed and available. This raw data only includes data from pharmacies and practitioners and the drugs Hydrocodne and Oxycodone.
#'
#' @param buyer_dea_no Filter the data to only this pharmacy (e.g. ‘AB0454176’)
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
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


#' Download raw prescription data for individual drugs and business type by county into R
#'
#' Data from from non-contiguous states not yet processed and available.
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param drug Filter the data to one of 14 available drugs in the database (e.g. 'OXYCODONE')
#' @param buyer_bus_act If provided, filter the data to one of businesses in BUYER_BUS_ACT (e.g. 'CHAIN PHARMACY', 'HOSP/CLINIC')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
#' library(arcos)
#'
#' bronx <- drug_county_biz(drug="Fentanyl", county = "Laurens", state = "GA",
#'                          buyer_bus_act = "Chain Retail", key="WaPo")
#'
#' head(bronx)
#' }
#' @export

drug_county_biz <- function(drug="Fentanyl", county = "Laurens", state = "GA", buyer_bus_act = "Chain Retail", key="WaPo") {

  url <- "https://arcos-api.ext.nile.works/v1/county_data_drug"

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

  if (!missing(drug)) {
    url <- param_set(url, key = "drug", value = drug)
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


#' Download raw prescription data for individual drugs and business type by county FIPS code into R
#'
#' Data from from non-contiguous states not yet processed and available.
#'
#' @param fips Filter the data to only this county (e.g. ‘01001’ for Autauga, Alabama)
#' @param drug Filter the data to one of 14 available drugs in the database (e.g. 'OXYCODONE')
#' @param buyer_bus_act If provided, filter the data to one of businesses in BUYER_BUS_ACT (e.g. 'CHAIN PHARMACY', 'HOSP/CLINIC')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
#' library(arcos)
#'
#' autauga_al <- drug_fips_biz(drug="Fentanyl", fips="01001", buyer_bus_act="Chain Retail", key="WaPo")
#'
#' head(autauga_al)
#' }
#' @export

drug_fips_biz <- function(drug="Fentanyl", fips="01001", buyer_bus_act="Chain Retail", key="WaPo") {

  url <- "https://arcos-api.ext.nile.works/v1/county_fips_data_drug"

  if (missing(key)) {
    message("Error: API key needed.")
  } else {
    url <- param_set(url, key = "key", value = key)

    if (!missing(fips)) {
      url <- param_set(url, key = "fips", value = fips)
      #df <- vroom(url)
      url <- gsub(" ", "%20", url)

      if (!missing(drug)) {
        url <- param_set(url, key = "drug", value = drug)
        df <- fromJSON(url)
        return(df)
      } else {
        message("Error: No drug name detected")
      }

    } else {
      message("Error: No FIPS code detected")
    }
  }
}


#' Get list of business types listed in the BUYER_BUS_ACT in the ARCOS database
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
#' library(arcos)
#'
#' bl <- buyer_list(key="WaPo")
#'
#' head(bl)
#' }
#' @export

buyer_list <- function(key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/buyer_list"

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)

    df <- fromJSON(url)
    return(df)
  } else {
    message("Error: API key needed.")
  }

}

#' Get list of drugs available in the ARCOS database
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
#' library(arcos)
#'
#' np <- drug_list(key="WaPo")
#'
#'np
#' }
#' @export

drug_list <- function(key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/drug_list"

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)

    df <- fromJSON(url)
    return(df)
  } else {
    message("Error: API key needed.")
  }

}


#' Get dataframe of counties, states, and fips codes that are represented in the ARCOS data
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
#' library(arcos)
#'
#' counties <- county_list(key="WaPo")
#'
#' head(counties)
#' }
#' @export

county_list <- function(key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/county_list"

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)
    df <- fromJSON(url)
    return(df)
  } else {
    message("Error: API key needed.")
  }

}


#' Download raw ARCOS data (Warning 130+ GB file)
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family raw data
#' @examples \donttest{
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

