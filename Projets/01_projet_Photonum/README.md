# **la sociéte ``PhotoNum``:**

## 1. **Description de l'application:**

- La société de tirage de photos numériques sur l’Internet PhotoNum désire revoir son application de gestion de photos afin de pouvoir offrir de
nouveaux services à ses clients ,Pour cela, elle envisage d’utiliser une base de données relationnelle.

- Un client, identifié par son adresse e-mail, est décrit par son nom et prénom, son adresse postale (utile pour l’expédition de ses commandes), et
dispose d’un mot de passe pour son authentification à la connexion au site PhotoNum 

- Chaque client doit télécharger ses fichiers images, identifiés par leur chemin d’accès sur le serveur, afin de pouvoir commander des impressions. Un certain nombre d’informations sur les conditions de la prise de vue sont ajoutées à chaque fichier image : l’appareil photo et l’objectif utilisés, la
distance focale, la sensibilité ISO, l’ouverture, la vitesse d’obturation et les dimensions de l’image.

- Un album est identifié de façon unique, comprend une collection de photos, et comporte un titre et un éventuel sous-titre. 

- Un livre est un album auquel le client ajoute une préface et une postface, sous forme de petits textes ; il précise quelle photo, parmi celles que contient le livre, doit figurer sur la couverture.

- Chaque photo contenue dans un album ou dans un livre est identifiée par son numéro d’ordre et correspond à un fichier image téléchargé. De
plus, un titre et un commentaire sont associés à chaque photo d’un album ou d’un livre.


## 2. **l'objcetif:**

- Implémenter une application en java qui réponde à le spécifiquations de la sociéte **`PhotNum`** .