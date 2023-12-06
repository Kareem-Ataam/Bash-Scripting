#!/bin/bash
###################
###This script takes a password from the user and check if it matches a specific password or not
###################

PASSWORD="secret"

while true; do
	read -sp "Enter a password: " USER_PASSWORD
	if [ $PASSWORD == $USER_PASSWORD ]; then
		echo -e "\nCorrect password. Access granted!"
		break
	else
		echo -e "\nIncorrect password. Try again."
	fi
done
