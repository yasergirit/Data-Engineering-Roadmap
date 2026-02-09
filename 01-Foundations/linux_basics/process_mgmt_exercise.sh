#!/bin/bash

# --- Process Management & Resource Monitoring Exercise ---
# Goal: Learn how to monitor, run in background, and manage system processes.

echo "--- 1. System Load Overview ---"
uptime
# free -m is often used for memory, but uptime gives a quick load average

echo -e "\n--- 2. Finding specific processes (Searching for 'bash') ---"
ps aux | grep bash | grep -v grep

echo -e "\n--- 3. Running a process in the BACKGROUND ---"
# We'll run a dummy sleep command for 30 seconds in the background
sleep 30 &
BG_PID=$!
echo "Started background process (sleep 30) with PID: $BG_PID"

echo -e "\n--- 4. Checking Background Jobs ---"
jobs

echo -e "\n--- 5. Stopping (Killing) the process ---"
echo "Terminating process $BG_PID..."
kill $BG_PID

if [ $? -eq 0 ]; then
    echo "SUCCESS: Process $BG_PID terminated."
else
    echo "ERROR: Could not terminate process."
fi

echo -e "\n--- Summary ---"
echo "- ps aux: List all running processes"
echo "- & : Run a command in the background"
echo "- jobs: Show background tasks of current shell"
echo "- kill <PID>: Stop a process"
