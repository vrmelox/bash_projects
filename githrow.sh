#!/bin/bash
echo -e "\nCe programme permet de commit vos changements.\n"

echo "Listez les fichiers à ajouter."
read ELEMENTS

if git add $ELEMENTS; then
    echo "Fichiers ajoutés avec succès."
else
    echo "Erreur lors de l'ajout des fichiers."
    exit 1
fi

echo "Redigez le commit"
read COMMITS

if git commit -m "$COMMITS"; then
    echo "Commit créé avec succès."
else
    echo "Erreur lors de la création du commit."
    exit 1
fi

if git push; then
    echo "Modifications poussées avec succès."
else
    echo "Erreur lors du push vers le dépôt distant."
    exit 1
fi