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
        echo -e "[$RED ERREUR $RESET_CLR]"
        exit 1
    fi
}

### START OF SCRIPT ###
read -p "Entrer le titre du README : " readme_title

echo -n "Création de README.md : "
echo "# $readme_title" >> README.md 2>/dev/null
check_cmd

echo -n "Initialisation de Git : "
git init >/dev/null 2>&1
check_cmd

echo -n "Ajout de tout le contenu : "
git add . >/dev/null 2>&1
check_cmd

read -p "Entrer votre message de commit : " commit_message

echo -n "Commit des changements : "
git commit -m "$commit_message" >/dev/null 2>&1
check_cmd

echo -n "Positionnement sur la branche main : "
git branch -M main >/dev/null 2>&1
check_cmd

read -p "Entrer votre nom de dépôt distant : " repo_name

echo -n "Ajout du dépôt distant : "
git remote add origin https://github.com/ValentinTainon/$repo_name.git >/dev/null 2>&1
check_cmd

echo -n "Push sur le dépôt distant : "
git push -u origin main >/dev/null 2>&1
check_cmd
### END OF SCRIPT ###