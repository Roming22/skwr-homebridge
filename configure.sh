#!/bin/bash
SCRIPT_DIR=`cd $(dirname $0); pwd`

# Container needs to be run once to initialize the content of the persistent volume
CONFIG="$SCRIPT_DIR/volumes/homebridge/config.json"
if [[ ! -e "$CONFIG" ]]; then
	SKWR_NAME=`basename $SCRIPT_DIR`
	cd $SCRIPT_DIR
	LOG_FILE="/tmp/skwr.$SKWR_NAME"
	nohup skwr run . > $LOG_FILE &
	while [ `egrep -c "Homebridge v[0-9.]+ is running on port " $LOG_FILE` = "0" ]; do
		echo "Waiting for the container to boot..."
		sleep 3
	done
	$SCRIPT_DIR/generate_service.sh
	skwr exec . npm uninstall homebridge-dummy
	skwr stop .
fi

HOMEBRIDGE_PORT=`grep --max-count 1 '"port"' $CONFIG | sed 's:[^0-9]::g'`
sed -i -e "s:\s*\(HOMEBRIDGE_PORT\)=.*:\1=$HOMEBRIDGE_PORT:" $SCRIPT_DIR/etc/service.cfg
