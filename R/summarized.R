#' Get annual summarized pill totals by county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- summarized_county_annual(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

summarized_county_annual <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/combined_county_annual"

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
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get monthly summarized pill totals by county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- summarized_county_monthly(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

summarized_county_monthly <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/combined_county_monthly"

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
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get monthly summarized pill totals by county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- buyer_details(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

buyer_details <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/buyer_details"

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
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get total pills for each pharmacy in a county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- total_pharmacies_county(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

total_pharmacies_county <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_pharmacies_county"

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
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get total pills for each manufacturer in a county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- total_manufacturers_county(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

total_manufacturers_county <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_manufacturers_county"

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
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get total pills for each distributor in a county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- total_distributors_county(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

total_distributors_county <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_distributors_county"

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
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}




#' Get total pills for each pharmacy in a state
#'
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' wv <- total_pharmacies_state(state="WV", key="WaPo")
#'
#' head(wv)
#' }
#' @export

total_pharmacies_state <- function(state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_pharmacies_state"

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}




#' Get total pills for each manufacturer in a state
#'
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' wv <- total_manufacturers_state(state="WV", key="WaPo")
#'
#' head(wv)
#' }
#' @export

total_manufacturers_state <- function(state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_manufacturers_state"

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}



#' Get total pills for each distributor in a state
#'
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' wv <- total_distributors_state(state="WV", key="WaPo")
#'
#' head(wv)
#' }
#' @export

total_distributors_state <- function(state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/total_distributors_state"

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    df <- vroom(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get annual total pills for each buyer (pharmacy, etc) in a county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- combined_buyer_annual(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

combined_buyer_annual <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/combined_buyer_annual"

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
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


#' Get annual total pills for each buyer (pharmacy, etc) in a county
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param year Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family summarized
#' @examples \dontrun{
#' library(arcos)
#'
#' mingo_wv <- combined_buyer_monthly(county = "Mingo", state="WV", year=2012, key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

combined_buyer_monthly <- function(county = "Mingo", state = "WV", year=2012, key="WaPo") {
  url <- "https://arcos-api.ext.nile.works/v1/combined_buyer_monthly"


  if (!missing(year)) {
    url <- param_set(url, key = "year", value = as.character(year))
  }


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
    df <- fromJSON(url)
    return(df)
  } else {
    print("Error: API key needed.")
  }

}


