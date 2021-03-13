#!/bin/bash -e
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

docker build --pull --rm --tag skwr/homebridge:latest -f  "${SCRIPT_DIR}/images/homebridge/Dockerfile" "${SCRIPT_DIR}/images/homebridge"
set -x
docker run --detach --rm --env TZ=America/New_York --env-file "${SCRIPT_DIR}/etc/secret.env" -e PUID=$(id -u) -e PGID=$(id -g) -e HOMEBRIDGE_CONFIG_UI_PORT=8080 --hostname homebridge --name homebridge --network host --volume "/mnt/nas/k3s/storage/persistentvolumes/iot/homebridge:/homebridge" skwr/homebridge
docker logs -f homebridge
