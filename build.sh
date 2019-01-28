#!/usr/bin/env bash
CURRENTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
docker build $CURRENTDIR --rm -t cassvail/rclone-sync
