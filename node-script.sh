#!/bin/bash


#initializing node 

# check if yarn package manager is currently installed on the machine
if [ -x "$(command -v yarn)" ];
then
	yarn init


	# install express, discordjs and mongoose packages
	sleep 0.5
	echo "Processing installation with the basic packages with Yarn..."
	sleep 0.5
	yarn add express discord.js mongoose
	echo "Express,Discord,Mongoose packages successfully installed"

# check if npm package manager is currently installed on the machine
elif [ -x "$(command -v npm)" ];
then
	npm init
	# install express, discordjs and mongoose node packages
	sleep 0.5
	echo "Processing installation with the basic packages with NPM"
	sleep 0.5
	npm -i express discord.js mongoose
	echo "Packages successfully installed using NPM"
else
	# return an error of both yarn or npm is not detected on the machine
	echo "no packages manager or installer found on your machine, please try to install yarn or npm first"

fi

