#!/bin/sh

set -e

cp /rclone_config/.rclone.conf /config/.rclone.conf
SYNC_COMMAND="rclone sync --config /config/.rclone.conf --verbose /data $SYNC_DESTINATION:/'$SYNC_DESTINATION_PATH'"

while [ 1 ]; do
  echo "Executing rclone sync $SYNC_DESTINATION:/'$SYNC_DESTINATION_PATH"
  eval "$SYNC_COMMAND"
  echo "Waiting $DELAY..."
  sleep $DELAY
done
