#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Définir la couleur du texte en vert GREEN et remettre en couleur par défaut RESET
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Demander à l'utilisateur de saisir les informations
read -p "${GREEN}Entrez le nom de votre BDD : ${RESET}" db_nom
read -p "${GREEN}Entrez le nom de l'utilisateur : ${RESET}" db_user
read -p "${GREEN}Entrez le mot de passe : ${RESET}" db_password
read -p "${GREEN}Entrez le hostname : ${RESET}" db_host
read -p "${GREEN}Quelle est le charset utilisé (ex: utf8mb4) : ${RESET}" db_charset

function create_folder() 
{
    
}