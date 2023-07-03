#' Get latitude and longitude data for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- pharm_latlon(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_latlon <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/pharmacy_latlon"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }



    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
  }


}

#' Get the core-based statistical area GEOID for each pharmacy based on BUYER_DEA_NO (Only includes retail and chain pharmacy designations)
#'
#' @param geoid Filter the data to only this cbsa GEOD (e.g. '26580')
#' @param county If geoid not included, filter the data to only this county (e.g. 'Mingo')
#' @param state If geoid not included, filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- pharm_cbsa(geoid="26580", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_cbsa <- function(geoid="26580", county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/pharmacy_cbsa"

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

  if (!missing(geoid)) {
    url <- param_set( "https://ne.washingtonpost.com/arcos/v1/pharmacy_cbsa", key = "geoid", value = geoid)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }

    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
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
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- pharm_tracts(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_tracts <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/pharmacy_tracts"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }


    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
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
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- pharm_counties(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

pharm_counties <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/pharmacy_counties"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }


    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
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
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- buyer_addresses(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

buyer_addresses <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/buyer_details"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {

      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }


    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
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
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- reporter_addresses(county = "Harris", state="TX", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

reporter_addresses <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/reporter_details"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }



    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
  }

}



#' Get annual population for counties between 2006 and 2014
#'
#' @param county Filter the data to only this county (e.g. 'Mingo')
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \donttest{
#' library(arcos)
#'
#' mingo_wv <- county_population(county = "Mingo", state="WV", key="WaPo")
#'
#' head(mingo_wv)
#' }
#' @export

county_population <- function(county = "Mingo", state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/county_population"

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
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }


    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
  }

}



#' Get annual population for states between 2006 and 2014
#'
#' @param state Filter the data to county within this state (e.g. 'WV')
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \donttest{
#' library(arcos)
#'
#' wv <- state_population(state="WV", key="WaPo")
#'
#' head(wv)
#' }
#' @export

state_population <- function(state = "WV", key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/state_population"

  if (!missing(state)) {
    url <- param_set(url, key = "state", value = state)
  }

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }



    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
  }

}


#' Get list of misidentified pharmacies by BUYER_DEA_NOs
#'
#' @param key Key needed to make query successful
#' @seealso \url{https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources}
#'
#' @family geocoded data
#' @examples \donttest{
#' library(arcos)
#'
#' np <- not_pharmacies(key="WaPo")
#'
#' head(np)
#' }
#' @export

not_pharmacies <- function(key="WaPo") {
  url <- "https://ne.washingtonpost.com/arcos/v1/not_pharmacies"

  if (!missing(key)) {
    url <- param_set(url, key = "key", value = key)
    url <- gsub(" ", "%20", url)

    if (curl::has_internet()==T) {
      for (i in 1:10) {
        tryCatch({
          df <- fromJSON(url)
          return(df)
          break
        }, error=function(e) {
          message("Sorry, our server must be overwhelmed. Try again in a little bit. If it persists, let us know at https://github.com/wpinvestigative/arcos/issues")
        })
        Sys.sleep(1)
      }


    } else {
      message("Error: No internet connection")
    }

  } else {
    message("Error: API key needed.")
  }

}

