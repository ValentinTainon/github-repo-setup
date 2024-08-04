#!/usr/bin/bash

### COLORS VARS ###
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET_CLR="\e[0m"

### FUNCTIONS ###
check_cmd() {
    if [ $? -eq 0 ]; then
        echo -e "[$GREEN OK $RESET_CLR]"
    else
        echo -e "[$RED ERROR $RESET_CLR]"
        exit 1
    fi
}

### START OF SCRIPT ###
read -p "Enter the README title: " readme_title

echo -n "Creating README.md: "
echo "# $readme_title" >> README.md 2>/dev/null
check_cmd

echo -n "Initializing Git: "
git init >/dev/null 2>&1
check_cmd

echo -n "Added all content: "
git add . >/dev/null 2>&1
check_cmd

read -p "Enter your commit message: " commit_message

echo -n "Commit changes: "
git commit -m "$commit_message" >/dev/null 2>&1
check_cmd

echo -n "Positioning on the main branch: "
git branch -M main >/dev/null 2>&1
check_cmd

read -p "Enter your remote repository name: " repo_name

echo -n "Adding the remote repository: "
git remote add origin https://github.com/ValentinTainon/$repo_name.git >/dev/null 2>&1
check_cmd

echo -n "Push to the remote repository: "
git push -u origin main >/dev/null 2>&1
check_cmd
### END OF SCRIPT ###