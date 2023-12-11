# Bash-Scripts repo

## server_monitor.sh
This script displays crucial information about a linux server such as the memory usage, disk utilization, open ports, uptime, CPU info, etc...

## web_setup.sh
This script setup the apache web server with any static website you like.

All you need to provide is the URL of the website template, pass it to the script when you are running it(e.g. ./web_setup.sh URL)
The directory that contains the files of the site should be archived as the script works on .zip file.

The script is written for CentOS or any distro from its family.

For the script to work properly the unzipped directory should have the same name as the .zip file but without .zip extension
Example running the script: 
```
./web_setup.sh https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
```

## disk_space_monitor.sh
This script checks the available disk space on a filesystem you specify and if it's below a threshold (you specify) it will give an alert

Positional parameters: It takes two parameters 1->the file system 2->threshold(MB)

Example running the script: 
```
./disk_space_monitor.sh /dev/sda1 512
```

## monit.sh
This script monitors the httpd service on the machine and start it if it was stopped.

You can the schedule the script to run for example every minute through cron jobs so you are continuously monitoring the service.

**_To add it as a crob job that runs every minute:_**
```
Issue the command: crontab -e
Put this line in the file: * * * * * path/of/script &>>/var/log/httpd_monit.log
```
Here we also directed the output of the script to a log file.

## download_images.sh
This script is used to download a set of images that their URLs are specified in the script.

## multios_web_setup
This directory contains the files of a script that works on a master machine and execute a web setup script on other target machines.

**_multios_web_setup.sh_**:The file of the web server setup that will be transmitted from the master to the targets and executed using ssh.

**_remote_hosts_**: Define the name of the target machines that the script will be executed on.

**_remote_execute.sh_**:The script that takes the script from the master machine and copy it to each one of the target machines and execute it.

## count_files.sh
This script counts the number of different file types in a directory that you give its path to the script as a parameter

Positional parameters:/path/of/directory
```
Example running the script:./count_files.sh /dev/
```

## even_or_odd.sh
This script takes a number from the user and checks if it's even or odd

## password_checker.sh
This script takes a password from the user and check if it matches a specific password or not

## backup.sh
This script takes a full or incremental (as the user need) backup of a directory called images in the home directory of the user executing the script.

Positional parameters: type of backup-- either full or incremental.

Running the script: 
```
./backup.sh full or ./backup.sh incremental
```
