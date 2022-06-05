#!/bin/bash


#initializing node 
if [ -x "$(command -v yarn) ];
then
	yarn init


	# install express, discordjs and mongoose packages
	sleep 0.5
	echo "Processing installation with the basic packages with Yarn..."
	sleep 0.5
	yarn add express discord.js mongoose
	echo "Express,Discord,Mongoose packages successfully installed"
elif [ -x "$(command -v npm) ];
then
	npm init
	# install express, discordjs and mongoose node packages
	sleep 0.5
	echo "Processing installation with the basic packages with NPM"
	sleep 0.5
	npm -i express discord.js mongoose
	echo "Packages successfully installed using NPM"
else
	echo "no packages manager or installer found on your machine, please try to install yarn or npm first"

fi

