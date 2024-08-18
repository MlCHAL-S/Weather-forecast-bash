#!/bin/bash

# Define the directory where you want to save the log file and weather report
BASE_DIR="./WeatherForecast"

# Create the directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Get today's date in the YYYY_mm_dd format
today=$(date +%Y_%m_%d)

# Define the filenames for the weather report and log file
weather_report="${BASE_DIR}/raw_data_${today}"
log_file="${BASE_DIR}/rx_poc.log"

# Get weather for Warsaw
city=Warsaw
curl -s wttr.in/$city?T --output "$weather_report"

# Get observed and forecast temps
# Extract observed and forecast temperatures from the saved file
obs_temp=$(grep °C "$weather_report" | head -1 | sed 's/[^0-9 °C+()]//g' | xargs)
#echo "Observed: $obs_temp"

# This part assumes that the forecast temperature is on a specific line in the file
fc_temp=$(grep °C "$weather_report" | head -2 | tail -1 | sed 's/[^0-9 °C+()]//g' | xargs)
#echo "Pred: $fc_temp"

# Assign Country and City to variable TZ
TZ='Europe/Warsaw'

# Use command substitution to store the current day, month, and year in corresponding shell variables:
hour=$(TZ=$TZ date -u +%H)
day=$(TZ=$TZ date -u +%d)
month=$(TZ=$TZ date +%m)
year=$(TZ=$TZ date +%Y)

# Create the record to be logged
record=$(echo -e "$year\t$month\t$day\t$hour\t$obs_temp\t$fc_temp C")

# Check if the log file exists and add a header if it does not
if [ ! -f "$log_file" ]; then
    echo -e "Year\tMonth\tDay\tHour\tObserved Temp\tForecast Temp" > "$log_file"
fi

# Write the record to the log file
echo "$record" >> "$log_file"

