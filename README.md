# mountainbiker - when R meets mountainbike and strava

[![Build Status](https://travis-ci.org/longwei66/mountainbikeR.svg?branch=master)](https://travis-ci.org/longwei66/mountainbikeR)

## What is mountainbikeR

A package for mountainbikers who use strava to log their rides and want to 
explore and visualise their rides data.

## Objective


# Main functions

## `mountainbikeR` Functions

### Authentication
- `connect2strava` to connect to strave api with key an secret

### Activities 
- `listActivities` to get all your activities in one table
- `cleanActitiesList` to clean list of activities
- `getActivity`to get all the details of one specific activity

### Streams
- `getStreams`to get streams from an activity

### Gears
- `getGear` to get the list of your gears

### Toolbox
- `decodePolyline` a code to decode polyline (google format for geo path)
- `extractPath` to extract path from polyline and build a data.table with id and date


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

