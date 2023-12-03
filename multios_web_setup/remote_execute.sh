#!/bin/bash
##########
##This script works on a master machine and execute a web server setup script on a set of other machines (targets).
##These target machines are specified in the file called remote_hosts.
##########
for host in $(cat remote_hosts); do
	echo "Setting up $host"
	#Copy the script from the masetr to the target or the remote machine
	scp multios_web_setup.sh devops@$host:/home/devops
	#Execute the script on the remote machine using ssh
	ssh devops@$host sudo /home/devops/multios_web_setup.sh https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
	ssh devops@$host sudo rm -f /home/devops/multios_web_setup.sh
	echo "Done with machine $host"
done
