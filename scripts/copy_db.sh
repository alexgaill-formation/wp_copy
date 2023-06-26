#!/bin/bash
# -*- ENCODING: UTF-8 -*-

function copy_db()
{
    # Définir la couleur du texte en vert GREEN et remettre en couleur par défaut RESET
    GREEN=$(tput setaf 2)
    RED=$(tput setaf 1)
    RESET=$(tput sgr0)

    # Chemin par défaut du répertoire
    backup=$PWD
    parent_dir=$(dirname "$backup")

    # Ajouts des prompts nécessaires pour la récupération de la BDD
    echo "${GREEN}Entrez le nom de votre BDD : ${RESET}";
    read -p "> " db_nom
    echo "${GREEN}Entrez le nom de l'utilisateur : ${RESET}";
    read -p "> " db_user
    echo "${GREEN}Entrez le mot de passe : ${RESET}";
    read -p "> " db_password
    echo "${GREEN}Entrez le hostname : ${RESET}";
    read -p "> " db_host

    # Laisse le choix à l'utilisateur de choisir son chemin, si c'est vide le chemin pris est celui par défaut.
    echo "${GREEN}Entrez le chemin de votre BDD (laissez vide pour utiliser le répertoire de sauvegarde actuel) : ${RESET}"
    read -p "> " db_path
    db_path=${db_path:-$parent_dir/Backup}

    /Applications/MAMP/Library/bin/mysqldump --no-tablespaces --host=$db_host --user=$db_user --password=$db_password $db_nom > $db_path/$db_nom.sql

    # Message de réussite ou d'echec
    if [[ $? -eq 0 ]]; then
        echo "$?"
        echo "${GREEN}La sauvegarde a bien été exécutée ! :D"
    else 
        echo "$?"  
        echo "${RED}La sauvegarde a échouée ! :'("
    fi      
}
copy_db