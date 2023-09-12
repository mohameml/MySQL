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
HAVING AVG(Salaire) = (SELECT MAX(Moyenne_Salaire) FROM (SELECT AVG(Salaire) AS Moyenne_Salaire FROM Employés) AS Moyennes);
```

## III. Bonnes Pratiques

- Utilisez des sous-requêtes lorsque cela est nécessaire pour effectuer des opérations complexes ou pour filtrer les résultats en fonction de critères dynamiques.
- Évitez d'utiliser des sous-requêtes de manière excessive, car elles peuvent rendre les requêtes moins lisibles et moins performantes.
- Assurez-vous de comprendre la différence entre les sous-requêtes corrélées et non-corrélées, et choisissez le type approprié en fonction de votre cas d'utilisation.

Les sous-requêtes sont un outil puissant en SQL qui vous permettent d'effectuer des opérations plus complexes et de répondre à une grande variété de questions en utilisant des requêtes imbriquées. Avec une compréhension solide des sous-requêtes, vous pouvez interroger efficacement et tirer des informations précieuses de vos bases de données.