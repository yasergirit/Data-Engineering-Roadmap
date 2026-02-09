# Module 1: Linux Foundations & Automation

This module covers essential Linux commands and Bash scripting for Data Engineering.

## Scripts Included
- `log_parser.sh`: Counts keywords (INFO, ERROR, WARNING) in `data.log`.
- `data_staging.sh`: Simulates a log rotation and archiving process.
- `process_data.sh`: Demonstrates data cleaning using `sed` and `awk`.

## Automation with Crontab
To automate these tasks (e.g., run the staging script every day at midnight), follow these steps:

1. Open the crontab editor:
   ```bash
   crontab -e
   ```

2. Add the following line to the bottom of the file (adjust the path to your project):
   ```cron
   0 0 * * * /bin/bash /c/Users/PC/OneDrive/Desktop/VBO/01-Foundations/linux_basics/data_staging.sh >> /c/Users/PC/OneDrive/Desktop/VBO/01-Foundations/linux_basics/cron_log.txt 2>&1
   ```

3. Save and exit. The script will now run automatically every day at 00:00.

### Cron Syntax Reminder:
`* * * * * command_to_execute`
- `-` Minute (0 - 59)
- `-` Hour (0 - 23)
- `-` Day of Month (1 - 31)
- `-` Month (1 - 12)
- `-` Day of Week (0 - 6) (0 is Sunday)
