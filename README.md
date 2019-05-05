# What is mountainbikeR

A package for mountainbikers who use strava to log their rides and want to 
explore and visualise their rides data.

## Objective


# Log - Code

## Import functions from previous project

- `connect2strava` to connect to strave api with key an secret
- `listActivities` to get all your activities in one table
- `getGear` to get the list of your gears
- `cleanActitiesList` to clean list of activities
- `decodePolyline` a code to decode polyline (google format for geo path)
- `getActivity`to get all the details of one specific activity
- `getStreams`to get streams from an activity

## Add datasets

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


## Make the package

```
devtools::document()
devtools::test()
devtools::check()
devtools::load_all()
```
