#!/bin/bash

# --- File Permissions & Security Exercise ---
# Goal: Learn to manage who can read, write, or execute files.

TARGET_FILE="secure_data.txt"

# 1. Create a sensitive data file
echo "SECRET_API_KEY=shhhh_its_a_secret" > "$TARGET_FILE"

echo "Current permissions for $TARGET_FILE:"
ls -l "$TARGET_FILE"

# 2. Removing Read/Write for Others (chmod 600: Owner Read+Write, Others Nothing)
echo -e "\nHiding $TARGET_FILE from other users..."
chmod 600 "$TARGET_FILE"
ls -l "$TARGET_FILE"

# 3. Creating an executable script and granting permission
SCRIPT_FILE="helper.sh"
echo 'echo "I am a helper script!"' > "$SCRIPT_FILE"

echo -e "\nTrying to run $SCRIPT_FILE before 755 permission..."
./$SCRIPT_FILE 2>/dev/null || echo "Cannot run: Permission Denied"

echo "Granting executable permissions (chmod +x)..."
chmod +x "$SCRIPT_FILE"

echo "Running script again:"
./$SCRIPT_FILE

# 4. Cleanup/Summary
echo -e "\nSummary:"
echo "- 600: Private (Owner only)"
echo "- 755: Shared (Everyone can read/execute, Owner can write)"
echo "- +x: Make a script runnable"
