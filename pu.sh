#!/bin/bash

reset=`tput sgr0`
magenta=`tput setaf 5`
blue=`tput setaf 4`
gray=`tput setaf 7`

start_time=$(date +%s.%3N)
git add .

echo "${blue}enter commit message${reset}"
read message

git commit -m "$message"

branch=$(git rev-parse --abbrev-ref HEAD)

echo "${blue}Enter remote name ${gray}(default: origin)${reset}"
read remote

if test -z "$remote"
  then
        git push -u origin $branch
  else
        git push -u $remote $branch
fi

echo "${blue}Wish to open a pull request? ${gray}[Y/Enter to exit]${reset}"
read PR

end_time=$(date +%s.%3N)
elapsed=$(echo "scale=3; $end_time - $start_time" | bc)
echo "${magenta}$(tput bold)Done in ${elapsed}ms ${reset}"

if [[ "$PR" == [yY] ]]
  then gh pr create
fi
