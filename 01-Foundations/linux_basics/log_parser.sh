#!/bin/bash

# Define the log file to parse
LOG_FILE="data.log"

# Check if log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: $LOG_FILE not found!"
    exit 1
fi

# Get current timestamp for the output filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="log_summary_$TIMESTAMP.txt"

echo "--- Log Analysis Summary ($TIMESTAMP) ---" > "$OUTPUT_FILE"

# Count occurrences of specific keywords
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")
ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")

# Append results to output file
echo "INFO messages: $INFO_COUNT" >> "$OUTPUT_FILE"
echo "ERROR messages: $ERROR_COUNT" >> "$OUTPUT_FILE"
echo "WARNING messages: $WARNING_COUNT" >> "$OUTPUT_FILE"

echo "Analysis complete. Results saved to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
