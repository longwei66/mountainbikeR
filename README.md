# mountainbiker - when R meets mountainbike and strava

[![Build Status](https://travis-ci.org/longwei66/mountainbikeR.svg?branch=dev)](https://travis-ci.org/longwei66/mountainbikeR)

## What is mountainbikeR

A package for mountainbikers who use strava to log their rides and want to 
explore and visualise their rides data.

## Objective

This package combines several tools :

- a set of functions to get your personnal data from strava api, your activites, gear, segments
- a set of functions to visualise your activities and segment data, plots, maps, etc...
- a shiny app packaging data and visualisation
- a plumber api integrating a trained machine learning model to predict if a given segment is a single track
- all the necessary code to retrain the model
- a set of function to explore a defined geographical area, and especially find single track segments

# Main functions

## Getting & cleaning dat a from strava api

### Documentation

Strava API is well documented [here](https://developers.strava.com/)

### Principles

`mountainbikeR` uses object oriented programming, implemented as R6 class ( you can read mo [here](https://adv-r.hadley.nz/r6.html)).

### Prerequisites
You should first create a personnal app in strava following this [guide](https://developers.strava.com/docs/getting-started/#account).

### Initialization : `mountainbiker_initializer`
You should initialise a mountainbikeR object using your strava credentials using `mountainbiker_initializer$new()`.
In the example bellow, strava credentials are stored in `~/.Renviron` (see [here](https://daattali.gitbooks.io/stat545-ubc-github-io/bit003_api-key-env-var.html)).

```
my_mbr <- mountainbiker_initializer$new(
     my_app_name = Sys.getenv("STRAVA_APP_NAME")
     , my_client_id = Sys.getenv("STRAVA_CLIENT_ID_")
     , my_client_secret = Sys.getenv("STRAVA_CLIENT_SECRET")
     , my_app_scope = "read,read_all,activity:read_all"
     , cache = FALSE
)
```

## `mountainbikeR` Datasets

- `stream_type`contains types of streams
- `workout_types` contains types of workout


# Log - Setup Devops

## Create package structure

```
usethis::create_package("../mountainbikeR/")
```

## Set-up repo on github (or gitlab)

Create github repository, add readme and GPL3.0 slicense and R gitignore

## Add git in the Rstudio 

In Rstudio, add git support in the project properties, after Rstudio restart, in
terminal :

## Sync the github repo with local project

```
# Remove the local .gitignore
rm .gitignore

# initiate the upstream tracking of the project on the GitHub repo
git remote add origin https://github.com/longwei66/mountainbikeR

# pull all files from the GitHub repo (typically just readme, license, gitignore)
git pull origin master

# set up GitHub repo to track changes on local machine
git push -u origin master
```

## Set-up the test environement

```
usethis::use_testthat()
```

## Set-up the raw data environment

```
usethis::use_data_raw()
```

## Make the package

```
devtools::document()
devtools::test()
devtools::check()
devtools::load_all()
```

## Add continuous integration

https://jef.works/blog/2019/02/17/automate-testing-of-your-R-package/

https://docs.travis-ci.com/user/languages/r/

