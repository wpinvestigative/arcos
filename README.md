# arcos <img src="https://avatars3.githubusercontent.com/u/29076131?s=400&u=0a0d9f18182017eb3398e1920b0aa9c7c0ca0e74&v=4" align="right" alt="" width="120" />

![](http://www.r-pkg.org/badges/version/arcos)  ![](http://cranlogs.r-pkg.org/badges/arcos)

The Washington Post [published](https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources) a significant portion of a database that tracks the path of every opioid pain pill, from manufacturer to pharmacy, in the United States between 2006 and 2012. We have reported a [number of stories](https://www.washingtonpost.com/national/2019/07/20/opioid-files/) using this data set, but we believe there are more stories to be told.

We are making this data accessible [as an API](https://arcos-api.ext.nile.works/__swagger__/) for everyone to download and [use in their reporting](https://www.washingtonpost.com/national/2019/08/12/post-released-deas-data-pain-pills-heres-what-local-journalists-are-using-it/) or research to promote a deeper understanding of the regional and local effects of the opioid crisis.

This ARCOS package is a wrapper to utilize the [ARCOS API](https://arcos-api.ext.nile.works/__swagger__/). 

-------

To install the development version from GitHub, issue the following command in R: 

```
devtools::install_github('wpinvestigative/arcos')

library(arcos)
```

### Tips on how to use the API in R

* [Annual maps](https://wpinvestigative.github.io/arcos/articles/annual-maps.html)

* [County analysis](https://wpinvestigative.github.io/arcos/articles/county-analysis.html)

* [Per capita pharmacies](https://wpinvestigative.github.io/arcos/articles/per-capita-pharmacies.html)


### Guidelines for using this data

* The API requires a key. **Use "WaPo" as the key or use any of the keys [listed here](keys/keys.txt). We reserve the right to blacklist these and invite users to sign up for their own individual keys in the future if the need arises.** ~~To get one, fill out the form at the bottom of [this page](https://www.washingtonpost.com/national/2019/07/18/how-download-use-dea-pain-pills-database/#sub) to establish a connection with our team and report any issues downloading the data. This will also allow us to update you with any additional information as it comes out and answer questions you may have. Because of the volume of requests, we ask you use this channel rather than emailing our reporters individually.~~

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

* We’ve been asked why we don’t have more recent data. The answer: The DEA only produced data from 2006 through 2014 in the case. We know that 2013 and 2014 data exists, but we have not been able to get access because of the ongoing court case in Ohio. The Post is still fighting for its release.

### Alternate ways to download summarized data

* Go to the DEA pain pills [database page](https://www.washingtonpost.com/graphics/2019/investigations/dea-pain-pill-database/#download-resources).

* Enter the state and county (if applicable) for which you want data.

* You can download graphics and/or analyzed data sets for distributors, manufacturers and pharmacies in the area by clicking “Get chart as image.” If you would like to do your own analysis, you can download the raw data file by clicking the bold and underlined link below each chart.

### Download the raw data

* [Click here](https://d2ty8gaf6rmowa.cloudfront.net/dea-pain-pill-database/bulk/arcos_all_washpost.tsv.gz) to download the national data from The Washington Post. Note: This is a very large file, so download times may be long.

* If you want to download the full data set released by the Ohio federal court, click [here](https://d2ty8gaf6rmowa.cloudfront.net/dea-pain-pill-database/bulk/arcos_all.tsv.gz). This includes information on shipments of other drugs, shipments between distributors, drugs distributed to mail order pharmacies, refunded shipments, and more.

------

__Available datasets (Read the [reference page](reference/index.html) for more info):__

|  **Function** | **What** | **Type** | **Years available** |
| --- | --- | --- | --- |
|  buyer_addresses() | Get DEA designated addresses for each pharmacy | Raw |  |
|  buyer_details() | Get monthly summarized pill totals by county | Summarized | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  combined_buyer_annual() | Get annual total pills for each buyer (pharmacy, etc) in a county | Summarized | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  combined_buyer_monthly() | Get annual total pills for each buyer (pharmacy, etc) in a county | Summarized | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  county_population() | Get annual population for counties between 2006 and 2012 | Supplemental | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  county_raw() | Download raw prescription data for specified county (by state and county names) | Raw |  |
|  county_raw_fips() | Download raw prescription data for specified county (by county FIPS code) | Raw |  |
|  not_pharmacies() | Get list of misidentified pharmacies by BUYER_DEA_NOs | Supplemental |  |
|  pharm_cbsa() | Get the core-based statistical area GEOID for each pharmacy | Supplemental |  |
|  pharm_counties() | Get county GEOID for each pharmacy | Supplemental |  |
|  pharm_latlon() | Get latitude and longitude data for each pharmacy | Supplemental |  |
|  pharm_tracts() | Get census tract GEOID for each pharmacy | Supplemental |  |
|  pharmacy_raw() | Download raw prescription data for specified pharmacy into R | Raw |  |
|  raw_data() | Download raw ARCOS data | Raw |  |
|  reporter_addresses() | Get DEA designated addresses for each Reporter | Raw |  |
|  state_population() | Get annual population for states between 2006 and 2012 | Supplemental | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  summarized_county_annual() | Get annual summarized pill totals by county | Summarized | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  summarized_county_monthly() | Get monthly summarized pill totals by county | Summarized | 2006, 2007, 2008, 2009, 2010, 2011, 2012 |
|  total_distributors_county() | Get total pills for each distributor in a county | Summarized |  |
|  total_distributors_state() | Get total pills for each distributor in a state | Summarized |  |
|  total_manufacturers_county() | Get total pills for each manufacturer in a county | Summarized |  |
|  total_manufacturers_state() | Get total pills for each manufacturer in a state | Summarized |  |
|  total_pharmacies_county() | Get total pills for each pharmacy in a county | Summarized |  |
|  total_pharmacies_state() | Get total pills for each pharmacy in a state | Summarized |  |
