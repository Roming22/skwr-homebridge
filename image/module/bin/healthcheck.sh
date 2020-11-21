#!/bin/sh
curl --connect-timeout 1 --fail --output /dev/null --silent localhost:8080 || exit 1
