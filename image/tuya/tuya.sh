#!/bin/sh
echo "KEY: $TUYA_KEY
SECRET: $TUYA_SECRET
DEVICE_ID: $TUYA_DEVICE_ID

"
tuya-cli wizard | tee /tmp/tuya.logs
reset
tail +4 /tmp/tuya.logs | tr "'" '"'
