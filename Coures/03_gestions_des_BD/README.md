# cour 03 : gestion des bases de données

Les requêtes de gestion de base de données sont des commandes SQL (Structured Query Language) utilisées pour effectuer des opérations de gestion sur une base de données relationnelle. 

1. **CREATE DATABASE** : Cette requête est utilisée pour créer une nouvelle base de données.

   ```sql
   CREATE DATABASE nom_de_la_base;
   // ou :
   CREATE DATABASE IF NOT EXISTS  nom_de_la_BD ;
   ```

2. **USE DATABASE** : Elle permet de spécifier la base de données à utiliser.

   ```sql
   USE nom_de_la_base;
   ```

3. **Afficher les BD** : Cette requête est utilisée pour afficher les BD.

   ```sql
    SHOW DATABASES;
   ```



4. **DROP DATABASE** : Cette requête permet de supprimer une BD .

   ```sql
   DROP DATABASE nom_de_la_BD;
   ```
5. **Afficher l'encodage d'une BD :**

il existe  requête qui permet d'afficher les variables système liées à l'encodage et aux caractères dans MySQL. 

```sql
SHOW VARIABLES LIKE 'character_set%';
```

#### RQ :

```sql
-- ceci est un commentaires :
# et ca aussi est un commentaires 
/*
Commentaires sur pluisres lignes 

*/

```