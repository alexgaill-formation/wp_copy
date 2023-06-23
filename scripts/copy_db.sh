#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Définir la couleur du texte en vert GREEN et remettre en couleur par défaut RESET
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

backup=$PWD
parent_dir=$(dirname "$backup")

read -p "${GREEN}Entrez le nom de votre BDD : ${RESET}" db_nom
read -p "${GREEN}Entrez le nom de l'utilisateur : ${RESET}" db_user
read -p "${GREEN}Entrez le mot de passe : ${RESET}" db_password
read -p "${GREEN}Entrez le hostname : ${RESET}" db_host

/Applications/MAMP/Library/bin/mysqldump --no-tablespaces --host=$db_host --user=$db_user --password=$db_password $db_nom > $parent_dir/Backup/$db_nom.sql
