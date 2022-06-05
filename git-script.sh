#!/bin/bash


echo "Commit: "
read commit
# add all files to staging area
git add .
sleep 1

# add commit
git commit -m "$commit"
sleep 1
echo "Commit added successfully: $commit"

# push files from origin to master repository
git push

echo "Done!"











