#!/bin/bash

# Configuration
SOURCE_DIR="."
ARCHIVE_DIR="./archive"
LOG_FILE="data.log"

# 1. Create archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    echo "Creating archive directory..."
    mkdir -p "$ARCHIVE_DIR"
fi

# 2. Check if the source log exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Source log file $LOG_FILE not found. Nothing to stage."
    exit 0
fi

# 3. Define the timestamped archive name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="log_backup_$TIMESTAMP.tar.gz"

echo "Starting data staging process..."

# 4. Copy the log to the archive folder with a timestamp
cp "$LOG_FILE" "$ARCHIVE_DIR/backup_$TIMESTAMP.log"

# 5. Compress all files in the archive folder into a single archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$ARCHIVE_DIR" . --exclude="*.tar.gz"

# 6. Optional: Clean up moved log files after compression
# find $ARCHIVE_DIR -name "*.log" -delete

echo "Staging complete. Archive created: $ARCHIVE_DIR/$ARCHIVE_NAME"
ls -lh "$ARCHIVE_DIR"
