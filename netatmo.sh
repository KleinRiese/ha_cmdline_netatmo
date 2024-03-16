#!/bin/bash

# Insert your personal Data from https://dev.netatmo.com/apps/
# Do not remove the quotes from the refresh_token.
client_id=xxx
client_secret=xxx
refresh_token="xxx"

# No changes needed after this line
if [ -e "refresh.token" ]; then
        refresh_token=$(cat "refresh.token")
fi

# Get current access and refresh token
json_data=$(curl -s --location --request POST "https://api.netatmo.com/oauth2/token" --form "grant_type=refresh_token" --form "refresh_token=$refresh_token" --form "client_id=$client_id" --form "client_secret=$client_secret")

# refresh_token und access_token aus der JSON-Zeichenfolge extrahieren
refresh_token=$(echo "$json_data" | jq -r '.refresh_token')
access_token=$(echo "$json_data" | jq -r '.access_token')

# Save refresh token
if [ -n "$refresh_token" ]; then
	echo "$refresh_token" > refresh.token
fi

# Get Station data
curl -s -X GET "https://api.netatmo.com/api/getstationsdata?get_favorites=true" -H "accept: application/json" -H "Authorization: Bearer $access_token"
