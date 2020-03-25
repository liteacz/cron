#!/bin/sh

[ -z $CRONTAB_PATH ] && CRONTAB_PATH="/etc/crontab"

if [ ! -f $CRONTAB_PATH ]; then
    echo "Crontab file not found in $CRONTAB_PATH, exitting..."
    exit 1
fi

# Load cron jobs
/usr/bin/crontab $CRONTAB_PATH

# Start cron daemon
/usr/sbin/crond -f -l 8
