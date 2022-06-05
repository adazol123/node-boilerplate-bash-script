#!/bin/bash


echo "What would you name for your repository?: "
read repository
sleep 0.5
echo "Repository visibility?: (private/public) "
read visibility

if [[ visibility == "private" ]]; then
		visible="--private"
elif [[ visibility == "public" ]]; then
		visible="--public"
else 
		visible="--private"
	fi

echo $visible
if [ -x $(command -v gh) ]; then
	gh repo create $repository $visible
	reposit="git@github.com:adazol123/$repository"
	gh repo clone $reposit
	if [ -e $repository ]; then

	sleep 0.5
	cd $repository
	touch README.md
	touch .gitignore
	git add .
	echo "Commit: "
	read commit
	git commit -m "$commit"
	git push origin
	sleep 0.5
	echo "Successfully created repository: $repository"
	else
		echo "Encountered an error when creating the repository"
	fi
else 
	echo "no Github CLI detected on your machine"
fi



