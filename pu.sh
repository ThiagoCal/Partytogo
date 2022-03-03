#!/bin/bash

reset=`tput sgr0`
magenta=`tput setaf 5`

start_time=$(date +%s.%3N)
git add .

echo "enter commit message"
read message

git commit -m "$message"

branch=$(git rev-parse --abbrev-ref HEAD)

echo "Enter remote name (default: origin)"
read remote

if test -z "$var"
  then
        git push -u origin $branch
  else
        git push -u $remote $branch
fi

echo "Wish to open a pull request? \n [Y/Enter to exit]"
read PR

end_time=$(date +%s.%3N)
elapsed=$(echo "scale=3; $end_time - $start_time" | bc)
echo "${magenta}$(tput bold)Done in ${elapsed}ms ${reset}"

if [[ "$PR" == [yY] ]]
  then gh pr create
fi
