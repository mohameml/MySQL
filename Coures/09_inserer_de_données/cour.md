# cour 09 : énregistrement de données 

L'enregistrement de données en SQL est essentiel pour ajouter de nouvelles informations à une table de base de données. Vous pouvez utiliser la commande `INSERT INTO` pour insérer de nouvelles lignes de données dans une table. 

## I. INSERT INTO

- La commande `INSERT INTO` est utilisée pour insérer de nouvelles lignes de données dans une table. 

- La syntaxe de base :

```sql
INSERT INTO nom_de_la_table (colonne1, colonne2, ...)
VALUES (valeur1, valeur2, ...);
```

- `nom_de_la_table` : Le nom de la table dans laquelle vous souhaitez insérer les données.
- `(colonne1, colonne2, ...)` : La liste des colonnes auxquelles vous souhaitez insérer des données.
- `VALUES` : Mot-clé indiquant que vous allez spécifier les valeurs à insérer.
- `(valeur1, valeur2, ...)`: Les valeurs que vous souhaitez insérer dans les colonnes correspondantes.

Exemple :

```sql
INSERT INTO Employés (Nom, Prénom, Âge)
VALUES ('Smith', 'John', 30);
```
Cette requête insère un nouvel enregistrement dans la table "Employés" avec les valeurs "Smith" pour la colonne "Nom", "John" pour la colonne "Prénom" et 30 pour la colonne "Âge".

#### RQ : 
On peut aussi inserér de plusieres énregistrement avce `INSERT INTO` :

```sql

INSERT INTO `fv_clients`(client_firstname , client_lastname , client_birthday , client_loyalty)
VALUES
    ("sidi","Abdou" ,"2001-02-04",12) ,
    ("khaled","Oumaree" ,"2003-02-04",20) ,
    ("Ahmed","MOHAMED" ,"1999-02-04",15) ;

```

## II. INSERT INTO ... ON DUPLICATE KEY UPDATE (ou son équivalent)

L'opération "INSERT INTO ... ON DUPLICATE KEY UPDATE"  est utilisée lorsque vous souhaitez insérer des données, mais si une clé primaire ou une contrainte unique entraîne une violation (par exemple, une valeur en double), vous souhaitez mettre à jour la ligne existante au lieu de générer une erreur.

La syntaxe générale est la suivante :

```sql
INSERT INTO nom_de_la_table (colonne1, colonne2, ...)
VALUES (valeur1, valeur2, ...)
ON DUPLICATE KEY UPDATE
colonne1 = valeur1, colonne2 = valeur2, ...;
```

- `nom_de_la_table` : Le nom de la table dans laquelle vous souhaitez insérer les données.
- `(colonne1, colonne2, ...)` : La liste des colonnes auxquelles vous souhaitez insérer des données.
- `VALUES` : Mot-clé indiquant que vous allez spécifier les valeurs à insérer.
- `(valeur1, valeur2, ...)`: Les valeurs que vous souhaitez insérer dans les colonnes correspondantes.
- `ON DUPLICATE KEY UPDATE` : Indique que vous souhaitez mettre à jour les valeurs en cas de violation de clé.
- `colonne1 = valeur1, colonne2 = valeur2, ...`: Les colonnes à mettre à jour avec les nouvelles valeurs.

Exemple :

```sql
INSERT INTO Employés (ID, Nom, Prénom, Âge)
VALUES (123, 'Smith', 'John', 30)
ON DUPLICATE KEY UPDATE Nom = 'Smith', Âge = 30;
```

Cette requête insérera un nouvel enregistrement dans la table "Employés" avec l'ID 123, le nom "Smith", le prénom "John" et l'âge 30. Si un enregistrement avec l'ID 123 existe déjà (violation de clé), il mettra à jour le nom en "Smith" et l'âge en 30 au lieu de générer une erreur.

L'utilisation de "INSERT INTO ... ON DUPLICATE KEY UPDATE" est particulièrement utile lorsque vous souhaitez insérer des données tout en évitant les doublons dans une table. Elle vous permet de gérer les conflits de clés de manière flexible en mettant à jour les valeurs existantes.