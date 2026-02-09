#!/bin/bash

# --- Error Handling & Exit Codes Exercise ---
# Goal: Learn how to handle failures gracefully in a data pipeline.

LOG_FILE="error_log.txt"

echo "Running a pipeline simulation..."

# 1. Successful Command chaining (&&)
echo "Step 1: Check if data.log exists..."
[ -f "data.log" ] && echo "Found data.log" || echo "data.log missing!"

# 2. Redirecting Errors to a Log File
# 'nonexistent_command' will fail, we capture the error
echo "Step 2: Attempting a risky operation..."
ls nonexistent_directory 2>> $LOG_FILE

# 3. Handling specific Exit Codes
cat nonexistent_file.txt 2>/dev/null
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo "CRITICAL: Operation failed with exit code $EXIT_CODE. Checking log..." | tee -a $LOG_FILE
fi

# 4. Summary of Operators
echo -e "\n--- Cheat Sheet ---"
echo "&& : Run second command ONLY if first succeeds"
echo "|| : Run second command ONLY if first fails"
echo "2> : Redirect only standard error"
echo ">> : Append output to file"
echo "\$? : Exit code of the last command (0 = Success)"
