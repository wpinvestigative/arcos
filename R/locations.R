#' Get latitude and longitude data for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- pharm_latlon(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_latlon <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/pharmacy_latlon"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }


  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }


  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }


}

#' Get the core-based statistical area GEOID for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- pharm_cbsa(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_cbsa <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/pharmacy_cbsa"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}

#' Get census tract GEOID for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- pharm_tracts(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_tracts <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/pharmacy_tracts"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get county GEOID for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- pharm_counties(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_counties <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/pharmacy_counties"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get DEA designated addresses for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- buyer_addresses(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

buyer_addresses <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/buyer_details"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get DEA designated addresses for each Reporter based on REPORTER_DEA_NO (Includes Manufacturers and Distributors)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- reporter_addresses(county = "Harris", state="TX", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

reporter_addresses <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/reporter_details"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}



#' Get annual population for counties between 2006 and 2012
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- county_population(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

county_population <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/county_population"

  if (!missing(county)) {
    county_name <- str_to_upper(county)
    county_name <- str_to_upper(county)
    county_name <- gsub("-", " ", county_name)
    county_name <- gsub("%20", " ", county_name)
    url <- param_set(url, key = "county", value = county_name)
  }

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}



#' Get annual population for states between 2006 and 2012
#'
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' wv <- state_population(state="WV", key="WaPo")
#'
#' head(wv)
#' }
#' @export

state_population <- function(state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/state_population"

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}





#' Get list of misidentified pharmacies by BUYER_DEA_NOs
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \dontrun{
#' library(arcos)
#'
#' np <- not_pharmacies(key="WaPo")
#'
#' head(np)
#' }
#' @export

not_pharmacies <- function(key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/not_pharmacies"

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


