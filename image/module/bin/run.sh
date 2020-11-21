#!/bin/sh

web_ui_up(){
	# Wait for the UI
	while ! egrep -q "Homebridge Config UI .* is listening" $LOG 2>/dev/null; do
		sleep 1
	done

	echo "[`hostname -s`] Started"
}

LOG="/homebridge/homebridge.log"
rm $LOG
web_ui_up &
/init
echo "[`hostname -s`] Stopped"
