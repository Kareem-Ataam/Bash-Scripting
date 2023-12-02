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

#Install the needed softwares- wget, unzip and httpd
sudo yum update -y >/dev/null
yum install wget unzip httpd -y >/dev/null

#Start and enable the web service
systemctl enable --now httpd

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

#Restart the httpd service
sudo systemctl restart httpd

#Info for ensuring that the service works as intended
systemctl status httpd
ls /var/www/html
