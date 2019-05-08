## code to prepare `DATASET` dataset goes here

## Define the types of workouts
workout_types <- data.table(
    workout_type_id = c(
        10,11,12,
        0,1,2,3,
        NA
    ),
    workout_type = c(
        "Ride.Relax","Ride.Race","Ride.Workout",
        "Run.Relax","Run.Race","Run.Long.Run","Run.Workout",
        NA
    )
)
usethis::use_data(workout_types, overwrite = FALSE)



## Configure all types of streams
# 	time: 	integer seconds
#	latlng: 	floats [latitude, longitude]
#	distance: 	float meters
#	altitude: 	float meters
#	velocity_smooth: 	float meters per second
#	heartrate: 	integer BPM
#	cadence: 	integer RPM
#	watts: 	integer watts
#	temp: 	integer degrees Celsius
#	moving: 	boolean
#	grade_smooth: 	float percent
stream_types <- data.table::data.table(
    type = c(
        "time",
        "latlng",
        "distance",
        "altitude",
        "velocity_smooth",
        "heartrate",
        "cadence",
        "watts",
        "temp",
        "moving",
        "grade_smooth"),
    datatype = c(
        "integer",
        "floats",
        "float",
        "float",
        "float",
        "integer",
        "integer",
        "integer",
        "integer",
        "boolean",
        "float"
    ),
    units = c(
        "seconds",
        "[latitude, longitude]",
        "meters",
        "meters",
        "meters per second",
        "BPM",
        "RPM",
        "watts",
        "degrees Celsius",
        "boolean",
        "percent"
    )
)
usethis::use_data(stream_types, overwrite = FALSE)
