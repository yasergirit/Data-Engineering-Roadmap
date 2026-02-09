#!/bin/bash

# This script demonstrates basic data cleaning using sed and awk
LOG_FILE="data.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found!"
    exit 1
fi

echo "--- Extracting only ERROR messages using grep ---"
grep "ERROR" "$LOG_FILE"

echo -e "\n--- Extracting Timestamp and Message using awk ---"
# awk '{print $1, $2, $4, $5, $6}' prints the 1st, 2nd, and 4th columns onwards
awk '{print $1, $2, "->", $4, $5, $6, $7, $8}' "$LOG_FILE"

echo -e "\n--- Anonymizing User Info using sed (replacing 'User' with 'USER_HIDDEN') ---"
sed 's/User/USER_HIDDEN/g' "$LOG_FILE"

echo -e "\n--- Generating a CSV summary (Timestamp,Level) ---"
awk '{print $1" "$2","$3}' "$LOG_FILE" > log_summary.csv
echo "CSV generated: log_summary.csv"
cat log_summary.csv
