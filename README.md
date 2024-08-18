# Weather Forecast Logging Script

This script retrieves the current weather report for Warsaw from wttr.in, extracts observed and forecast temperatures, and logs the data to a file. The script saves the weather report and log file in a directory named `WeatherForecast`, which is created in the directory where the script is run. 

## Prerequisites

- **bash**: Make sure you have `bash` installed.
- **curl**: Required to fetch weather data from `wttr.in`.
- **sed**: Used for text processing.
- **grep**: Used to filter text.
- **xargs**: Used to clean up the output.

## Script Overview

1. **Directory Setup**: Creates the `WeatherForecast` directory in the directory where the script is run if it does not exist. If the directory is deleted, it will be recreated the next time the script runs.
2. **Date Formatting**: Formats today's date as `YYYY_mm_dd`.
3. **Fetch Weather Data**: Retrieves weather data for Warsaw and saves it to a file named with today's date.
4. **Extract Temperatures**: Parses the saved file to extract observed and forecast temperatures.
5. **Record Data**: Logs the current date, time, observed temperature, and forecast temperature to a log file, creating a header if necessary.

## Usage

1. **Save the Script**: Clone the repo to your machine.
2. **Make It Executable**: Run the following command to make the script executable:
   ```bash
   chmod +x weather_script.sh

