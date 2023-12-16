#!/bin/bash

#######################
##User Account Management Script
##This script provides many features to manage user accounts in the system, you can:
##Add new user
##Remove an existing one
##Modify user info (password, username, add to group, lock or unlock a user)
##Search for a user
##List existing users
########################

while true; do
	echo "###################################"
	echo "1.Add user"
	echo "2.Remove user"
	echo "3.Modify user"
	echo "4.Search for user"
	echo "5.List users"
	echo "6.Exit"
	echo "###################################"
	
	read -p "Enter your choice: " option
	case $option in
		1)
			while true; do
				read -p "Enter the username: " user_name
				id $user_name &> /dev/null
				if [ $? -eq 0 ]; then
					echo -e "\nUser with this name alredy exist\n"
					continue
				fi
				break
			done
			useradd $user_name &>/dev/null
			if [ $? -ne 0 ]; then
				echo -e "\nUser $user_name already exist\n" 
			fi
			passwd $user_name
			echo -e "\nUser created successfully\n" 
			;;
		2)
			while true; do
				read -p "Enter the username: " user_name
				id $user_name &> /dev/null
				if [ $? -ne 0 ]; then
					echo -e "\nUser doesn't exist\n"
					continue
				fi
				break
			done
			userdel $user_name
			echo -e "\nUser deleetd!\n"
			;;
		3)
			while true; do
				read -p "Enter the username: " user_name
				id $user_name &> /dev/null
                        	if [ $? -ne 0 ]; then
                                	echo "User doesn't exist"
					continue
                        	fi
				break
			done
			echo "1.Change username"
			echo "2.Change user password"
			echo "3.Add user to a secondary group"
			echo "4.Lock a user"
			echo "5.Unlock a user"
			
			read -p "Enter your choice: " mod_option
			case $mod_option in
				1) 
					while true; do
						read -p "Enter the new name:" new_user_name
						id $new_user_name &> /dev/null
						if [ $? -eq 0 ]; then
							echo -e "\nA user with this name already exists\n"
							continue
						fi
						break
					done
					usermod -l $new_user_name $user_name
					echo -e "\nUsername changed to $new_user_name successfully\n"
					;;
				2)
					passwd $user_name
					;;
				3)
					while true; do
						read -p "Enter the name of the group: " group_name
						cat /etc/group | grep -w $group_name &> /dev/null
						if [ $? -ne 0 ]; then
							echo -e "\nNo group with this name\n"
							continue
						fi
						break
					done
					usermod -aG $group_name $user_name
					echo -e "\nUser added successfully to group $group_name\n"
					;;
				4)
					usermod -L $user_name
					echo -e "\nUser $user_name is locked\n"
					;;
				5)
					usermod -U $user_name
					echo -e "\nUser $user_name is unlocked\n"
					;;
				*)
					echo -e "\nInvalid option\n"
					;;
				
				esac		
				;;		
	
		4)	
			read -p "Enter the user name: " user_name
			id $user_name &> /dev/null
			if [ $? -eq 0 ]; then
				echo
				cat /etc/passwd | grep $user_name
				echo
			else
				echo -e "\nUser $user_name doesn't exist\n"
			fi
			;;
		5)
			echo
			cat /etc/passwd | cut -d ":" -f 1
			echo
			;;		
		6)
			echo -e "\nBye:)\n"
			break
			;;
		*)
			echo -e "\nInvalid option\n"
			;;
	esac		
done	
