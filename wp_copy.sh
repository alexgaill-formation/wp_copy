#!/bin/bash
# -*- ENCODING: UTF-8 -*-

. ./scripts/copy_project.sh;
. ./scripts/copy_db.sh;

# Associer fichier qui gère la copie du projet wordpress
    # Prompt pour path du projet à copier
    # Prompt pour path du dossier de destination
    # Vérifier que le projet existe au premier path
    # Vérifier que le path de destination existe.
    # Si le path de destination n'existe pas demander à le créer
    # Fonction de création de path
    # Fonction de copie du projet
    # Ajouter les messages de succès et d'erreurs

# Associer fichier de copie de la BDD
    # Ajouter les prompts nécessaires pour la récupération de la BDD
    # Copier la BDD dans un dossier backup
    # Ajouter les prompt pour BDD de destination
        # Permettre à l'utilisateur de laisser un prompt vide si la valeur est identique à la valeur de récupération
    # Fonction qui crée la nouvelle BDD
    # Ajouter les messages de succès et d'erreurs
