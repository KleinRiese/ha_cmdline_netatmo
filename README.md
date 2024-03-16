# Get weather data from your favourite netatmo station

Netatmo has public weather stations and there is a plugin to integrate this data into Home Assistant. Unfortunately, you can't specify an individual station when using public data, only an area.

An add-on is available, but you need to run hass.io to use it.

This simple script uses curl to get the data from your favourite station. To use it, follow these steps:

1) Create a netatmo account
2) Choose a favourite station https://weathermap.netatmo.com/
3) Create an application https://dev.netatmo.com/apps/
4) Fill in your details and create a token, allow scope "read_station".
5) Edit netatmo.sh and fill in "client ID", "client secret" and the "refresh token".
6) Edit configuration.yaml and add "command_line: !include cmdline.yaml" (or add directly to your configuration)
7) My example gets "rain_sum_24". Other values are possible, check the API: https://dev.netatmo.com/apidocumentation/weather
8) Copy netatmo.sh and cmdline.yaml to your installation
