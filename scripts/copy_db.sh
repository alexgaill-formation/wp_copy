#!/bin/bash
# -*- ENCODING: UTF-8 -*-
source ./copy_variable.sh;

function copy_db()
{
    # Chemin par défaut du répertoire
    backup=$PWD
    parent_dir=$(dirname "$backup")

    #Ajouts des prompts nécessaires pour la récupération de la BDD
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

    if [[ -x "/Applications/MAMP/Library/bin/mysqldump" ]]; then
        /Applications/MAMP/Library/bin/mysqldump --no-tablespaces --host=$db_host --user=$db_user --password=$db_password $db_nom > $db_path/$db_nom.sql
    elif [[ -x "/usr/bin/mysqldump" ]]; then
        /usr/bin/mysqldump --no-tablespaces --host=$db_host --user=$db_user --password=$db_password $db_nom > $db_path/$db_nom.sql
    fi
    
    #Message de réussite ou d'echec
    if [[ $? -eq 0 ]]; then
        echo "$?"
        echo "${GREEN}La sauvegarde a bien été exécutée ! :D"
    else 
        echo "$?"  
        echo "${RED}La sauvegarde a échouée ! :'("
    fi      
}
copy_db