#!/bin/bash
#################
###This script takes a number from the user and checks if it's even or odd
##################

read -p "Enter a number:" NUM
# =~ is used for pattern matching 
# We used double square brackets with if instead of single as they support more features one of them is pattern matching

#Validate if the given input is an integer number
if [[ $NUM =~ ^-?[0-9]+$ ]]; then
	if [ $((NUM % 2)) -eq 0 ]; then
		echo  "$NUM is even"
	else
		echo "$NUM is odd"
	fi
else
	echo "Please enter an integer number" 
fi 
