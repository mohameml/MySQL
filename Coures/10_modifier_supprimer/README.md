# cour 10 : Modifier et Supprimer 



## I. La commande `UPDATE`

- La commande `UPDATE` est utilisée pour modifier des enregistrements existants dans une table. 

- La syntaxe générale :

    ```sql
    UPDATE nom_de_la_table
    SET colonne1 = nouvelle_valeur1, colonne2 = nouvelle_valeur2, ...
    WHERE condition;
    ```

- `nom_de_la_table` : Le nom de la table dans laquelle vous souhaitez effectuer la mise à jour.
- `colonne1, colonne2, ...` : Les colonnes que vous souhaitez mettre à jour.
- `nouvelle_valeur1, nouvelle_valeur2, ...` : Les nouvelles valeurs que vous souhaitez attribuer aux colonnes correspondantes.
- `WHERE condition` : La condition qui spécifie quelles lignes de la table doivent être mises à jour. Si vous omettez la clause `WHERE`, toutes les lignes de la table seront mises à jour.

Exemple :

Supposons que vous ayez une table "Employés" avec les colonnes "Nom", "Prénom" et "Salaire" et que vous souhaitiez augmenter le salaire de tous les employés dont le nom est "Smith" de 10 % :

```sql
UPDATE Employés
SET Salaire = Salaire * 1.10
WHERE Nom = 'Smith';
```

Cette requête mettra à jour les salaires de tous les employés portant le nom "Smith" en les multipliant par 1,10 .

## II. La commande `DELETE`

- La commande `DELETE` est utilisée pour supprimer des enregistrements d'une table. 

- La syntaxe générale :

    ```sql
    DELETE FROM nom_de_la_table
    WHERE condition;
    ```

- `nom_de_la_table` : Le nom de la table à partir de laquelle vous souhaitez supprimer des enregistrements.
- `WHERE condition` : La condition qui spécifie quelles lignes de la table doivent être supprimées. Si vous omettez la clause `WHERE`, toutes les lignes de la table seront supprimées.

Exemple :

Supposons que vous souhaitiez supprimer tous les enregistrements de la table "Clients" pour lesquels l'âge est inférieur à 18 ans :

```sql
DELETE FROM Clients
WHERE Âge < 18;
```

Cette requête supprimera tous les enregistrements de la table "Clients" pour lesquels l'âge est inférieur à 18 ans.


#### RQ :
si on veut vider la table :
```sql
--rq : vider la table 

DELETE FROM `nom_table`;
-- ou : plus optimisé
TRUNCATE TABLE `nom_table`;

```
