#!/bin/bash
# -*- ENCODING: UTF-8 -*-

function copy_db()
{
    # Définir la couleur du texte en vert GREEN et remettre en couleur par défaut RESET
    GREEN=$(tput setaf 2)
    RESET=$(tput sgr0)

    backup=$PWD
    parent_dir=$(dirname "$backup")

    read -p "${GREEN}Entrez le nom de votre BDD : ${RESET}" db_nom
    read -p "${GREEN}Entrez le nom de l'utilisateur : ${RESET}" db_user
    read -p "${GREEN}Entrez le mot de passe : ${RESET}" db_password
    read -p "${GREEN}Entrez le hostname : ${RESET}" db_host

    # Laisse le choix à l'utilisateur de choisir son chemin, si c'est vide le chemin pris est celui par défaut.
    read -p "${GREEN}Entrez le chemin de votre BDD (laissez vide pour utiliser le répertoire de sauvegarde actuel) : ${RESET}" db_path
    db_path=${db_path:-$parent_dir/Backup}

    /Applications/MAMP/Library/bin/mysqldump --no-tablespaces --host=$db_host --user=$db_user --password=$db_password $db_nom > $db_path/$db_nom.sql
}
copy_db