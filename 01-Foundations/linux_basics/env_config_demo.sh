#!/bin/bash

# --- Environment Variable Demo ---
# This script shows how to load variables from a .env file.

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
    echo "Loading configuration from $ENV_FILE..."
    # Read each line and export it as an environment variable
    export $(grep -v '^#' $ENV_FILE | xargs)
else
    echo "Error: $ENV_FILE not found!"
    exit 1
fi

echo "Connected to database: $DB_NAME on $DB_HOST"
echo "API Key loaded: ${API_KEY:0:5}***** (Masked for safety)"

# Practice: Accessing system variables
echo "Current User: $USER"
echo "Home Directory: $HOME"
