#!/bin/bash
##################
### Display system information
##################

#Users currently logged in
echo "The users currently logged in are"
who
echo -e "\n####################################"


#Uptime
echo "The system uptime is"
uptime
echo -e "\n####################################"


#Memory Usage
echo "The system memory usage is"
free -h
echo -e "\n####################################"


#Disk utilization
echo "The disk usage is"
df -h
echo -e "\n#####################################"

#Open Ports
echo "Open Ports"
netstat -antp
echo -e "\n#####################################"

#CPU information
echo "CPU architecture info"
lscpu
echo -e "\n#####################################"

#Processes
echo "Top 5 processes according to CPU usage"
ps aux --sort=-%cpu | head -n 6
echo -e "\n#####################################"


#Kernel Info
echo "The kernel info"
uname -a





































