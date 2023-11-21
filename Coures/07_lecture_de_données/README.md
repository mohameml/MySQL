# cour 07 : lecutre de données et Aliases

- La lecture de données en SQL est l'une des tâches les plus courantes lors de l'interrogation d'une base de données.
- Les alias (ou pseudonymes) sont des noms temporaires que vous pouvez attribuer aux colonnes ou aux tables dans votre requête SQL pour rendre les résultats plus lisibles ou pour éviter les conflits de noms. 

## I. Lecture de Données (SELECT)

La clause SELECT est utilisée pour récupérer des données à partir d'une table ou de plusieurs tables dans une base de données. La syntaxe générale est la suivante :

```sql
SELECT colonne1, colonne2, ...
FROM nom_de_la_table
WHERE conditions;
```

- `colonne1, colonne2, ...` : Les colonnes que vous souhaitez sélectionner.
- `nom_de_la_table` : Le nom de la table à partir de laquelle vous lisez les données.
- `conditions` (facultatif) : Les conditions qui déterminent quelles lignes seront incluses dans le résultat.

Exemple :

```sql
SELECT Nom, Prénom, Âge
FROM Clients;
```

####  RQ :

```sql
SELECT product_name FROM fv_products; -- sélectionner un champ particulier 

SELECT product_name , product_amount FROM fv_products; --b sélectionner plusiéres champs 

SELECT * FROM fv_products; -- sélectionner touts les champs 

SELECT DISTINCT product_name FROM fv_products;  -- pour éviter la redondandace des valeures.

```

## II. Utilisation d'Aliases

Les alias sont des noms temporaires que vous pouvez donner aux colonnes ou aux tables dans une requête SELECT. Ils rendent le résultat de la requête plus lisible ou résolvent les conflits de noms. Vous pouvez utiliser ``AS`` pour assigner un alias.

### 1.Alias de Colonnes

Vous pouvez donner un alias à une colonne pour changer son nom dans le résultat de la requête :

```sql
SELECT Nom AS Nom_Client, Prénom AS Prénom_Client
FROM Clients;
```

### 2.Alias de Tables

Vous pouvez également donner un alias à une table si vous avez besoin de faire référence à la même table plusieurs fois dans une requête ou si le nom de la table est long :

```sql
SELECT c.Nom, c.Prénom, o.NuméroCommande
FROM Clients AS c;
```



