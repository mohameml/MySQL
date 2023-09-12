# cour 11 : Les Fonctions d'Agrégations 


## 1. Intoduction :


Les fonctions d'agrégation en SQL sont des fonctions qui effectuent des calculs sur un ensemble de valeurs de colonnes pour renvoyer une seule valeur agrégée en résultat. Ces fonctions sont utilisées pour effectuer des opérations telles que le calcul de la somme, la moyenne, le maximum, le minimum, le comptage, etc., sur les données d'une table. 


## 2. Les fonctions :

### 2.1. COUNT

La fonction `COUNT` permet de compter le nombre de lignes dans un ensemble de données. Elle peut être utilisée avec ou sans argument. Par exemple, pour compter le nombre total d'employés dans une table "Employés" :

```sql
SELECT COUNT(*) AS Total_Employés
FROM Employés;
```

### 2.2. SUM

La fonction `SUM` permet de calculer la somme des valeurs numériques dans une colonne. Par exemple, pour calculer le total des ventes dans une table "Ventes" :

```sql
SELECT SUM(Montant) AS Total_Ventes
FROM Ventes;
```

### 2.3. AVG

La fonction `AVG` permet de calculer la moyenne des valeurs numériques dans une colonne. Par exemple, pour calculer la moyenne des notes dans une table "Notes" :

```sql
SELECT AVG(Note) AS Moyenne_Notes
FROM Notes;
```

### 2.4. MAX et MIN

Les fonctions `MAX` et `MIN` permettent de trouver respectivement la valeur maximale et minimale dans une colonne. 
Par exemple, pour trouver l'âge maximum et minimum parmi les clients dans une table "Clients" :

```sql
SELECT MAX(Âge) AS Âge_Maximum, MIN(Âge) AS Âge_Minimum
FROM Clients;
```

