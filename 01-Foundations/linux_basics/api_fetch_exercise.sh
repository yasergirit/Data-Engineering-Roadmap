#!/bin/bash

# --- API Networking & JSON Extraction Exercise ---
# Goal: Use curl to fetch data from an API and prepare it for processing.

# 1. Configuration
API_URL="https://jsonplaceholder.typicode.com/posts"
OUTPUT_JSON="raw_posts.json"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Fetching data from $API_URL..."

# 2. Fetch data using curl
# -s: Silent mode
# -L: Follow redirects
# -o: Write output to file
curl -s -L "$API_URL" -o "$OUTPUT_JSON"

if [ $? -eq 0 ]; then
    echo "SUCCESS: Data downloaded to $OUTPUT_JSON"
else
    echo "ERROR: Failed to fetch data."
    exit 1
fi

# 3. Simple Extraction without specialized tools (using core utils)
# Task: Extract the first 5 titles from the JSON file
echo -e "\n--- Extracting first 5 post titles (Quick look) ---"
grep '"title":' "$OUTPUT_JSON" | head -n 5 | sed 's/.*: "//;s/",//'

# 4. Preparing for Data Engineering
# Create a summary report
REPORT_FILE="api_report_$TIMESTAMP.txt"
TOTAL_POSTS=$(grep -c '"id":' "$OUTPUT_JSON")
echo "API Data Report - $TIMESTAMP" > "$REPORT_FILE"
echo "Source: $API_URL" >> "$REPORT_FILE"
echo "Total objects fetched: $TOTAL_POSTS" >> "$REPORT_FILE"

echo -e "\nSummary report generated: $REPORT_FILE"
cat "$REPORT_FILE"
