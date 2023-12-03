#!/bin/bash
################
##This script setup the apache web server with any static website you like
##All you need to provide is the URL of the website template, pass it to the script when you are running it(e.g. ./web_setup.sh URL)
##The directory that contains the files of the site should be archived as the script works on .zip file
##The script is written for Centos or any disrto from its family
##For the script to work properly the unzipped directory should have the same name as the .zip file but without .zip extension
################

#Extract the file name from the URL
FILENAME=$(basename "$1")

#Extract the file name without the .zip extension
FILENAME_WITHOUT_EXTEN="${FILENAME%.zip}"

#For the purpose of checking if the machine is CentOS
yum --version &>/dev/null


if [ $? -eq 0 ]; then #The machine is CentOS
	#Install the needed softwares- wget, unzip and httpd
	sudo yum update -y >/dev/null
	sudo yum install wget unzip httpd -y >/dev/null
	IS_UBUNTU=0

	#Start and enable the web service
	sudo systemctl enable --now httpd
else	#The machine is ubuntu
	sudo apt update -y >/dev/null
	sudo apt install apache2 wget unzip -y >/dev/null
	#Start and enable the web service
	sudo systemctl enable --now apache2
	IS_UBUNTU=1
fi
	
#Download the site template files
cd /tmp/
mkdir webfiles
cd webfiles
sudo wget $1

#Unzip the file of the template
unzip $FILENAME >/dev/null

#Remove the old or the default files that apache uses
sudo rm -rf /var/www/html/*

#Copy the files of the site template to the directory that apache uses to fetch the site files
sudo cp -r $FILENAME_WITHOUT_EXTEN/* /var/www/html/

if [ $IS_UBUNTU -eq 0 ]; then
	#Restart the httpd service
	sudo systemctl restart httpd

	#Info for ensuring that the service works as intended
	systemctl status httpd
else
	#Restart the apache2 service
        sudo systemctl restart apache2

        #Info for ensuring that the service works as intended
        systemctl status apache2
fi
ls /var/www/html
