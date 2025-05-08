#!/bin/bash

# Simple Shell with support for handling built-ins (exit, cd, help, history, addpath)
# and other commands get handed to evaluator.

# finalproject.sh was built and based upon the github:
# https://github.com/kodekloudhub/shell-scripting-for-beginners-course

# To use this as a command type:
# chmod +x finalproject

# To access help menu type "help" as the command when prompted.

#---------------------------------------------------------------------------------------#

# prompt built to loop until user uses "exit" command, allows for multiple cmds to be made
while true; do
	read -e -p "finalproject> " line		# makes a prompt

	[[ -z "$line" ]] && continue			# skips if user enters empty input

	cmd=${line%% *} 				# cmd var to see what cmd user
							# inputs

	# help command:
	if [[ "$cmd" == "help" ]]; then		# checks if the cmd = help
	# shows user this message:
	echo "finalproject commands: "
	echo "	cd [dir]	- changes the directory"
	echo "	exit		- exits the loop and quits the shell"
	echo "	help		- displays this message"
	echo "supports pipes (|), redirection (<, >), &&, ||, ;"
	continue
	fi

	# exit command:
	if [[ "$cmd" == "exit" ]]; then		# checks if the cmd = exit
		break				# ends the shell
	fi

	# cd command:
	if [[ "$cmd" == "cd" ]]; then		#checks if the cmd = cd
		target=${line#cd }		# strips "cd " from the input
						# ex. if input was cd /tmp, then
						# target="/tmp"
		if ! cd "$target" 2>/dev/null; then	#custom error message
			echo "cd: file or directory does not exist: $target"
		fi
		continue
	fi

	# more commands, pipes (|), redirection (<, >), &&, ||, ;
	eval "$line"
done
