# arcos <img src="https://avatars3.githubusercontent.com/u/29076131?s=400&u=0a0d9f18182017eb3398e1920b0aa9c7c0ca0e74&v=4" align="right" alt="" width="120" />

![CRAN Badge](http://www.r-pkg.org/badges/version/arcos)  ![CRAN Downloads](http://cranlogs.r-pkg.org/badges/arcos)

The Washington Post [published](https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources) a significant portion of a database that tracks the path of every opioid pain pill, from manufacturer to pharmacy, in the United States between 2006 and 2014. We have reported a [number of stories](https://www.washingtonpost.com/national/2019/07/20/opioid-files/) using this data set, but we believe there are more stories to be told.

We are making this data accessible [as an API](https://arcos-api.ext.nile.works/__swagger__/) for everyone to download and [use in their reporting](https://www.washingtonpost.com/national/2019/08/12/post-released-deas-data-pain-pills-heres-what-local-journalists-are-using-it/) or research to promote a deeper understanding of the regional and local effects of the opioid crisis.

This ARCOS package is a wrapper to utilize the [ARCOS API](https://arcos-api.ext.nile.works/__swagger__/). There is also a Python wrapper: [arcospy](https://pypi.org/project/arcospy/)

-------

## Installation

Get the latest stable release from CRAN: 

```R
install.packages("arcos")
```

To install the development version from GitHub: 

```R
# install.packages("devtools")
devtools::install_github('wpinvestigative/arcos')
```

### Tips on how to use the API in R

* [Annual maps](https://wpinvestigative.github.io/arcos/articles/annual-maps.html)

* [County analysis](https://wpinvestigative.github.io/arcos/articles/county-analysis.html)

* [Per capita pharmacies](https://wpinvestigative.github.io/arcos/articles/per-capita-pharmacies.html)


### Guidelines for using this data

* The API requires a key. **Use "WaPo" as the key or use any of the keys [listed here](https://github.com/wpinvestigative/arcos-api/blob/master/keys/keys.txt). We reserve the right to blacklist these and invite users to sign up for their own individual keys in the future if the need arises.** ~~To get one, fill out the form at the bottom of [this page](https://www.washingtonpost.com/national/2019/07/18/how-download-use-dea-pain-pills-database/#sub) to establish a connection with our team and report any issues downloading the data. This will also allow us to update you with any additional information as it comes out and answer questions you may have. Because of the volume of requests, we ask you use this channel rather than emailing our reporters individually.~~

* If you publish anything based on this data set, please credit The Washington Post, link to the original source, and send us an email when you’ve hit publish. We want to learn what you discover and will attempt to link to your work as part of cataloguing the impact of this project.

### About this data

* The Post gained access to the Drug Enforcement Administration’s Automation of Reports and Consolidated Orders System, known as ARCOS, [as the result of a court order](https://www.washingtonpost.com/health/how-an-epic-legal-battle-brought-a-secret-drug-database-to-light/2019/08/02/3bc594ce-b3d4-11e9-951e-de024209545d_story.html). The Post and HD Media, which publishes the Charleston Gazette-Mail in West Virginia, waged a year-long legal battle for access to the database, which the government and the drug industry had sought to keep secret.

* There are two levels to this API:

  1. **Raw data** directly from the ARCOS database on shipments of oxycodone and hydrocodone pills to chain pharmacies, retail pharmacies and practitioners but sliced at the county- and pharmacy-level, which is easier to deal with than the 100+ gig unfiltered version (which is also [available to download](#download-the-raw-data)).
  
  2. **Summarized and supplemental data** gathered by The Washington Post journalists.
  
    * Supplemental data such as the latitude and longitude information for nearly 83,000 chain and retail pharmacies geocoded by Post journalists, as well as Census geolocation codes.
    * Summarized data such as on the largest distributors, manufacturers and pharmacies in your county and state, in addition to annual and monthly dosages ordered by pharmacies.
    * We have cleaned the data to include only information on shipments of oxycodone and hydrocodone pills. We did not include data on 10 other opioids because they were shipped in much lower quantities and were diverted at far lower rates over the seven years. Diversion refers to when pills do not go directly to a patient and end up at another source, such as the black market. The Post also removed shipments that did not wind up in the hands of consumers, such as shipments from distributors to themselves. The subset of the data is very similar to how experts working on the federal court case in Ohio analyzed the data.

* There are Veterans Affairs Department distribution pharmacies in Charleston, S.C., and Leavenworth, Kan., that serve the region. The DEA considers these to be retail pharmacies. However, the pills are much more likely to be spread in the region than to those counties. This is why the per capita rate of pills in those counties is far higher.

* It’s important to remember that the number of pills in each county does not necessarily mean those pills went to people who live in that county. The data only shows us what pharmacies the pills are shipped to and nothing else.

* The best way to understand the definitions of the columns and variables in this data set is to refer to the DEA’s [ARCOS handbook](https://www.deadiversion.usdoj.gov/arcos/handbook/full.pdf), which provides detailed descriptions of the records.

### Alternate ways to download summarized data

* Go to the DEA pain pills [database page](https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources).

* Enter the state and county (if applicable) for which you want data.

* You can download graphics and/or analyzed data sets for distributors, manufacturers and pharmacies in the area by clicking “Get chart as image.” If you would like to do your own analysis, you can download the raw data file by clicking the bold and underlined link below each chart.

### Download the raw data

* [Click here](https://d2ty8gaf6rmowa.cloudfront.net/dea-pain-pill-database/bulk/arcos_all_washpost.tsv.gz) to download the national data from The Washington Post. Note: This is a very large file, so download times may be long.

* If you want to download the full data set released by the Ohio federal court, click [here](https://d2ty8gaf6rmowa.cloudfront.net/dea-pain-pill-database/bulk/arcos_all.tsv.gz). This includes information on shipments of other drugs, shipments between distributors, drugs distributed to mail order pharmacies, refunded shipments, and more.

------

__Available datasets (Read the [reference page](https://wpinvestigative.github.io/arcos/reference/index.html) for more info):__

| Function                                                                  | What                                                                            | Type         | Years       | Drugs                   | Buyers                                             |
|---------------------------------------------------------------------------|---------------------------------------------------------------------------------|--------------|-------------|-------------------------|----------------------------------------------------|
| [buyer_addresses()](https://wpinvestigative.github.io/arcos/reference/buyer_addresses.html)                       | Get DEA designated addresses for each pharmacy                                  | Raw          |             | All                     | All                                                |
| [buyer_details()](https://wpinvestigative.github.io/arcos/reference/buyer_details.html)                           | Get monthly summarized pill totals by county                                    | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [buyer_list()](https://wpinvestigative.github.io/arcos/reference/buyer_list.html)                                 | Get list of business types listed in the BUYER_BUS_ACT in the ARCOS database    | Raw          | 2006 - 2014 |                         | All                                                |
| [combined_buyer_annual()](https://wpinvestigative.github.io/arcos/reference/combined_buyer_annual.html)           | Get annual total pills for each buyer (pharmacy, etc) in a county               | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [combined_buyer_monthly()](https://wpinvestigative.github.io/arcos/reference/combined_buyer_monthly.html)         | Get annual total pills for each buyer (pharmacy, etc) in a county               | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [county_list()](https://wpinvestigative.github.io/arcos/reference/county_list.html)                               | Get list of counties and states and fips codes represented in the ARCOS data    | Raw          | 2006 - 2014 |                         |                                                    |
| [county_population()](https://wpinvestigative.github.io/arcos/reference/county_population.html)                   | Get annual population for counties between 2006 and 2012                        | Supplemental | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [county_raw()](https://wpinvestigative.github.io/arcos/reference/county_raw.html)                                 | Download raw prescription data for specified county (by state and county names) | Raw          |             | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [county_raw_fips()](https://wpinvestigative.github.io/arcos/reference/county_raw_fips.html)                       | Download raw prescription data for specified county (by county FIPS code)       | Raw          |             | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [drug_county_biz()](https://wpinvestigative.github.io/arcos/reference/drug_county_biz.html)                       | Raw data by county and individual drug and business type                        | Raw          | 2006 - 2014 | All                     | All                                                |
| [drug_county_raw()](https://wpinvestigative.github.io/arcos/reference/drug_county_raw.html)                       | Raw data by county and individual drug and business type via fips code          | Raw          | 2006 - 2014 | All                     | All                                                |
| [drug_list()](https://wpinvestigative.github.io/arcos/reference/drug_list.html)                                   | Get list of the 14 drugs tracked in the ARCOS data                              | Raw          | 2006 - 2014 | All                     |                                                    |
| [not_pharmacies()](https://wpinvestigative.github.io/arcos/reference/not_pharmacies.html)                         | Get list of misidentified pharmacies by BUYER_DEA_NOs                           | Supplemental | 2006 - 2012 |                         | Retail Pharmacy, Chain Pharmacy                    |
| [pharm_cbsa()](https://wpinvestigative.github.io/arcos/reference/pharm_cbsa.html)                                 | Get the core-based statistical area GEOID for each pharmacy                     | Supplemental | 2006 - 2014 |                         | Retail Pharmacy, Chain Pharmacy                    |
| [pharm_counties()](https://wpinvestigative.github.io/arcos/reference/pharm_counties.html)                         | Get county GEOID for each pharmacy                                              | Supplemental | 2006 - 2014 |                         | Retail Pharmacy, Chain Pharmacy                    |
| [pharm_latlon()](https://wpinvestigative.github.io/arcos/reference/pharm_latlon.html)                             | Get latitude and longitude data for each pharmacy                               | Supplemental | 2006 - 2014 |                         | Retail Pharmacy, Chain Pharmacy                    |
| [pharm_tracts()](https://wpinvestigative.github.io/arcos/reference/pharm_tracts.html)                             | Get census tract GEOID for each pharmacy                                        | Supplemental | 2006 - 2014 |                         | Retail Pharmacy, Chain Pharmacy                    |
| [pharmacy_raw()](https://wpinvestigative.github.io/arcos/reference/pharmacy_raw.html)                             | Download raw prescription data for specified pharmacy into R                    | Raw          | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy                    |
| [raw_data()](https://wpinvestigative.github.io/arcos/reference/raw_data.html)                                     | Download raw ARCOS data                                                         | Raw          | 2006 - 2014 | All                     | All                                                |
| [reporter_addresses()](https://wpinvestigative.github.io/arcos/reference/reporter_addresses.html)                 | Get DEA designated addresses for each Reporter                                  | Raw          | 2006 - 2014 | All                     | All                                                |
| [state_population()](https://wpinvestigative.github.io/arcos/reference/state_population.html)                     | Get annual population for states between 2006 and 2014                          | Supplemental | 2006 - 2014 |                         |                                                    |
| [summarized_county_annual()](https://wpinvestigative.github.io/arcos/reference/summarized_county_annual.html)     | Get annual summarized pill totals by county                                     | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [summarized_county_monthly()](https://wpinvestigative.github.io/arcos/reference/summarized_county_monthly.html)   | Get monthly summarized pill totals by county                                    | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [total_distributors_county()](https://wpinvestigative.github.io/arcos/reference/total_distributors_county.html)   | Get total pills for each distributor in a county                                | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone |                                                    |
| [total_distributors_state()](https://wpinvestigative.github.io/arcos/reference/total_distributors_state.html)     | Get total pills for each distributor in a state                                 | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone |                                                    |
| [total_manufacturers_county()](https://wpinvestigative.github.io/arcos/reference/total_manufacturers_county.html) | Get total pills for each manufacturer in a county                               | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone |                                                    |
| [total_manufacturers_state()](https://wpinvestigative.github.io/arcos/reference/total_manufacturers_state.html)   | Get total pills for each manufacturer in a state                                | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone |                                                    |
| [total_pharmacies_county()](https://wpinvestigative.github.io/arcos/reference/total_pharmacies_county.html)       | Get total pills for each pharmacy in a county                                   | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
| [total_pharmacies_state()](https://wpinvestigative.github.io/arcos/reference/total_pharmacies_state.html)         | Get total pills for each pharmacy in a state                                    | Summarized   | 2006 - 2014 | Oxycodone & Hydrocodone | Retail Pharmacy, Chain Pharmacy, and Practitioners |
