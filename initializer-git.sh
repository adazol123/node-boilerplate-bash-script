#!/bin/bash

#################################################################
#								#
#	    Creating repo using command with Github CLI		#
#								#
#################################################################


# Need input from the user for repository name and its visibility
echo "What would you name for your repository?: "
read repository
sleep 0.5
echo "Repository visibility?: (private/public) "
read visibility

#condition statement for the visibility of the repository (private/public)
if [ $visibility == "private" ]; then
		visible="--private"
elif [ $visibility == "public" ]; then
		visible="--public"
else 
		
		visible="--private"
fi

echo "visibility:  $visible"

echo "Continue on creating repository $repository? (Y/N)"
read query
# check condition if user would like to continue the process y,Y or blank to proceed and others to cancel
if [ -z $query ] || [ $query == "y" ] || [ $query == "Y" ]; then

# Check if the Gihub CLI is currently installed on the machine
if [ -x $(command -v gh) ]; then
	# Create repository using the github CLI
	gh repo create $repository $visible -l MIT -g Node
	reposit="git@github.com:adazol123/$repository"

	# Clone the repository 
	gh repo clone $reposit

	# Check  statement once both creation and cloning of the repository was successful
	if [ -e $repository ]; then
		# Add inital files like README then add content to it
		cd $repository
		touch README.md && echo "$repository" >> README.md

		# Add all files from working directory to staging area
		git add .

		# Adding commit for the changes made on the  repository
		echo "Commit: "
		read commit
		git commit -m "$commit"

		# Pushing repo from stagin area to remote/origin  
		git push origin
		sleep 0.5
		echo "Successfully created repository: $repository"
	else
		echo "Encountered an error when creating the repository"
	fi
else 
	echo "No Github CLI detected on your machine"
fi



else
	echo "Repository Initializer has been cancelled"
fi
