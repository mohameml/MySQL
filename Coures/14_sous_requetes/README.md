# cour 14 : Les sous-requêtes

Les sous-requêtes en SQL, également appelées requêtes imbriquées, sont des requêtes SQL qui sont incorporées à l'intérieur d'une autre requête SQL. Elles permettent d'effectuer des opérations plus complexes en utilisant les résultats d'une requête comme critère ou ensemble de données pour une autre requête. 

## I. Utilisation de Sous-Requêtes

Les sous-requêtes sont couramment utilisées dans les clauses SQL suivantes :

### 1. WHERE

Vous pouvez utiliser une sous-requête dans la clause WHERE pour filtrer les résultats en fonction des valeurs renvoyées par la sous-requête. 

Par exemple, pour trouver les employés dont le salaire est supérieur à la moyenne :

```sql
SELECT Nom, Salaire
FROM Employés
WHERE Salaire > (SELECT AVG(Salaire) FROM Employés);
```

### 2. FROM

Vous pouvez utiliser une sous-requête dans la clause FROM pour traiter les résultats de la sous-requête comme une table temporaire que vous pouvez interroger. 

Par exemple, pour trouver le nombre d'employés par département :

```sql
SELECT Département, COUNT(*) AS Nombre_des_Employés
FROM (SELECT DISTINCT Département FROM Employés) AS Départements
GROUP BY Département;
```

### 3. SELECT

Vous pouvez utiliser une sous-requête dans la clause SELECT pour obtenir une valeur unique qui sera renvoyée avec chaque ligne résultante. 

Par exemple, pour afficher le nom de l'employé ayant le salaire le plus élevé :

```sql
SELECT Nom, (SELECT MAX(Salaire) FROM Employés) AS Salaire_Max
FROM Employés;
```

## II. Types de Sous-Requêtes

Il existe deux types de sous-requêtes en SQL :

### 1. Sous-Requêtes Corrélées

Une sous-requête corrélée est une sous-requête qui dépend de la requête externe. Cela signifie que la sous-requête est évaluée pour chaque ligne de la requête externe. Les sous-requêtes corrélées sont généralement utilisées lorsque vous devez comparer chaque ligne de la requête externe avec une ou plusieurs lignes d'une autre table.

Exemple : Trouver tous les employés dont le salaire est supérieur à la moyenne de leur département.

```sql
SELECT Nom, Salaire
FROM Employés e
WHERE Salaire > (SELECT AVG(Salaire) FROM Employés WHERE Département = e.Département);
```

### 2. Sous-Requêtes Non-Corrélées

Une sous-requête non-corrélée est une sous-requête qui peut être évaluée une seule fois avant l'exécution de la requête externe. La sous-requête renvoie une seule valeur ou un seul ensemble de résultats qui est utilisé par la requête externe.

Exemple : Trouver le département avec la moyenne de salaire la plus élevée.

```sql
SELECT Département
FROM Employés
GROUP BY Département
HAVING AVG(Salaire) = (SELECT MAX(Moyenne_Salaire) FROM (SELECT Département, AVG(Salaire) AS Moyenne_Salaire FROM Employés GROUP BY Département) AS Moyennes);

```




### III. Requetes imbriquées avancées :

#### 1. opérateurs de quantification en SQL : `ALL` , `ANY` , ``SOME``


Les opérateurs `ALL`, `ANY`, et `SOME` sont utilisés dans SQL pour effectuer des comparaisons entre une valeur et un ensemble de valeurs renvoyées par une sous-requête. Ces opérateurs sont couramment utilisés avec des opérations de comparaison telles que `=`, `>`, `<`, `>=`, `<=`, `!=`, etc.



1. **ALL** : L'opérateur `ALL` est utilisé pour comparer une valeur à toutes les valeurs d'une sous-requête. La condition sera vraie si la comparaison est vraie pour toutes les valeurs de la sous-requête.

   Exemple :
   
   ```sql
   SELECT nom
   FROM employes
   WHERE salaire > ALL (SELECT salaire FROM employes WHERE departement = 'Ventes');
   ```

   Cette requête renverra le nom des employés dont le salaire est supérieur à celui de tous les employés du département "Ventes".

2. **ANY** ou **SOME** : Les opérateurs `ANY` et `SOME` sont interchangeables et sont utilisés pour comparer une valeur à au moins une des valeurs de la sous-requête. La condition sera vraie si la comparaison est vraie pour au moins une des valeurs de la sous-requête.

   Exemple avec `ANY` :
   
   ```sql
   SELECT nom
   FROM employes
   WHERE salaire > ANY (SELECT salaire FROM employes WHERE departement = 'Ventes');
   ```

   Cette requête renverra le nom des employés dont le salaire est supérieur à celui d'au moins un employé du département "Ventes".

   Exemple avec `SOME` :
   
   ```sql
   SELECT nom
   FROM employes
   WHERE salaire > SOME (SELECT salaire FROM employes WHERE departement = 'Ventes');
   ```

   Cette requête est équivalente à la précédente et renverra le même résultat.

#### 2. Les Motés cles `EXISTS` :

**EXISTS** :

   - **Utilisation** : L'opérateur `EXISTS` est utilisé pour vérifier si au moins une ligne est renvoyée par une sous-requête. Si la sous-requête renvoie au moins une ligne, la condition `EXISTS` est évaluée comme vraie ; sinon, elle est évaluée comme fausse.
   
   - **Exemple** : Supposons que vous ayez une table `commandes` et une table `clients`. Vous pouvez utiliser `EXISTS` pour vérifier si au moins une commande a été passée par un client spécifique :
   
     ```sql
     SELECT nom, prenom
     FROM clients c
     WHERE EXISTS (
         SELECT *
         FROM commandes cmd
         WHERE cmd.client_id = c.client_id
     );
    ```

   - **Exemple 2 :**  Les noms et prénoms des étudiants n’ayant pas de note : deux tables `Eleves` et `NOTES`

      ```sql
         SELECT prenom, nom
         FROM Eleves e
         WHERE NOT EXISTS ( SELECT *
         FROM Notes
         WHERE prenom = e.prenom
         AND nom = e.nom );     


         -- ou :

         SELECT prenom , nom
         FROM Eleves 
         WHERE (prenom , nom) NOT IN 
         (
         SELECT prenom , nom
         FROM NOTES

         ); 
      
      ```



     
#### 3. REQUETES imbriquées :

l'expression génerale d'une réquette imbriqueé est :

**........ WHERE expr θ (SELECT ..) AS Q ......**

- **a.si Q retourne une valeur atomique :**

   -  Alors $\theta \in \{= , <> , <= ,= > , < ,>\}$

   - Exemple :
      * Les noms et prénoms des étudiants ayant eu moins que Dark Vador en  bases de données:

      ```sql
      SELECT * FROM Notes
      WHERE cours = 'Bases de Données' 
      AND note <= ( SELECT DISTINCT note
      FROM Notes
      WHERE cours = 'Bases de Données' 
      AND prenom = 'Dark' AND nom = 'Vador' );      
       ```

      Attention … SELECT FROM WHERE doit retourner une seule valeur.


- **b.Q retourne un ensemble de valeurs atomiques:**

   - Alors $\theta \in \{IN , NOT~IN , \phi~ALL , \phi~ANY \}~~~~~~~avec~~ \phi \in \{= ,<> , <= , >= , < , > \}$ 

   - Exemples :
      - Quel cours a la moyenne la plus basse ?

      ```sql
         SELECT cours, AVG(note)
         FROM Notes
         GROUP BY cours
         HAVING AVG(note) <= ALL (
         SELECT AVG(note)
         FROM notes
         GROUP BY cours
         );      
      
      
      ```

      - solution 2 :

      ```sql 
      
      SELECT cour FROM NOTES 
      GROUP BY cour 
      HAVING AVG(note) = (

         SELECT MIN(moyenne_note) FROM (SELECT cour , AVG(note) AS moyenne_note FROM NOTES GROUP BY cour)
      );
      
      
      ```

- **c.Q retourne un n-uplet :**

   - Alors : 

      * la réquette est de la forme : **........ WHERE (expr1, expr2, .....) θ (SELECT ..)  ......**

      * $\theta \in \{= , <> \}$

      * Exemple :

         ```sql
         -- il faut assurer que Q retourne un seule n-uplte 
         SELECT * FROM NOTES WHERE (nom,note) = (SELECT .......) AS Q ;
         
         ```

- **d. Q retourne un ensemble de n-uplets:**

   - Alors : 

      * la réquette est de la forme : **........ WHERE (expr1, expr2, .....) θ (SELECT ..)  ......**

      * $\theta \in \{IN , NOT~IN , \phi~ANY ,\phi~ALL \}$ avec $\phi \in \{=  , <> \}$

      * Exemple : Les noms et prénoms des étudiants n’ayant que des  notes supérieures ou égales à 10 

         ```sql
         SELECT prenom, nom 
         FROM Eleves
         WHERE (prenom, nom) NOT IN 
         ( SELECT prenom, nom 
         FROM Notes
         WHERE note < 10 ) ;        
         
         ```
