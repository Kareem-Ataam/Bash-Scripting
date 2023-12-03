#!/bin/bash
###############
###This script monitors the httpd service on the machine and start it if it was stopped
###You can the schedule the script to run for example every minute through cron jobs so you are continuously monitoring the service
###To add it as a crob job that runs every minute
###Issue the command: crontab -e
###Put this line in the file: * * * * * path/of/script &>>/var/log/httpd_monit.sh
###Here we also directed the output of the script to a log file
###############

echo "################################"
date

if [ -f /var/run/httpd/httpd.pid ]; then
	echo "The httpd service is running"
else
	echo "The httpd service is not running"
	echo "Starting the service............"
	sudo systemctl start httpd
	if [ $? -eq 0 ]; then
		echo "The service started successfully"
	else
		echo "There is a problem starting the service, Please contact the admin"
	fi
fi
echo "################################"
	
