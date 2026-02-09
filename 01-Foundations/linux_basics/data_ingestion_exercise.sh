#!/bin/bash

# --- Data Ingestion & Validation Exercise ---
# Goal: Practice directory management, data generation, and basic validation.

# 1. Configuration (Simulated .env variables)
TARGET_DIR="./ingested_data"
LOG_FILE="ingestion.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Starting ingestion process..." | tee -a $LOG_FILE

# 2. Directory Management
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating target directory: $TARGET_DIR" | tee -a $LOG_FILE
    mkdir -p "$TARGET_DIR"
else
    echo "Directory $TARGET_DIR already exists." | tee -a $LOG_FILE
fi

# 3. Data Generation (Creating a mock dataset)
DATA_FILE="$TARGET_DIR/raw_data.csv"
echo "id,name,email,score" > "$DATA_FILE"
echo "1,John Doe,john@example.com,85" >> "$DATA_FILE"
echo "2,Jane Smith,jane@example.com,92" >> "$DATA_FILE"
echo "3,Bob Wilson,,78" >> "$DATA_FILE" # Empty email for validation test

echo "Mock data created at $DATA_FILE" | tee -a $LOG_FILE

# 4. Data Validation (using awk)
echo "Validating data..." | tee -a $LOG_FILE

# Check if any row has missing values (4 columns expected)
MISSING_VALUES=$(awk -F',' '{ if (NF != 4 || $1 == "" || $2 == "" || $3 == "" || $4 == "") print "Line "NR": " $0 }' "$DATA_FILE")

if [ -z "$MISSING_VALUES" ]; then
    echo "SUCCESS: All rows are valid." | tee -a $LOG_FILE
else
    echo "WARNING: Missing values found in following lines:" | tee -a $LOG_FILE
    echo "$MISSING_VALUES" | tee -a $LOG_FILE
fi

# 5. File System Check (Intro to df)
DISK_USAGE=$(df -h . | awk 'NR==2 {print $5}')
echo "Current disk usage on this partition: $DISK_USAGE" | tee -a $LOG_FILE

echo "[$TIMESTAMP] Ingestion process finished." | tee -a $LOG_FILE
