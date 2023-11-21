# cour 13 : Union et Intersections 

Les opérations `UNION`, `INTERSECT`, et `EXCEPT` en SQL sont utilisées pour combiner ou comparer des résultats de requêtes provenant de plusieurs tables ou sous-requêtes. 

## I. UNION

L'opération `UNION` est utilisée pour combiner les résultats de deux ou plusieurs requêtes en un seul ensemble de résultats. Les requêtes doivent avoir le même nombre de colonnes, et les types de données dans chaque colonne doivent être compatibles.

### Syntaxe de base :

```sql
SELECT colonne1, colonne2, ...
FROM table1
UNION
SELECT colonne1, colonne2, ...
FROM table2;
```

- `colonne1, colonne2, ...` : Les colonnes que vous souhaitez sélectionner dans les requêtes.
- `table1`, `table2`, ... : Les tables ou sous-requêtes dont vous souhaitez combiner les résultats.

Exemple : Combinez les résultats de deux requêtes pour obtenir une liste unique de noms d'employés de deux tables différentes.

```sql
SELECT Nom
FROM Employés1
UNION
SELECT Nom
FROM Employés2;
```

## II. INTERSECT

L'opération `INTERSECT` est utilisée pour récupérer les enregistrements qui sont communs aux résultats de deux requêtes. Encore une fois, les requêtes doivent avoir le même nombre de colonnes et les types de données compatibles.

### Syntaxe de base :

```sql
SELECT colonne1, colonne2, ...
FROM table1
INTERSECT
SELECT colonne1, colonne2, ...
FROM table2;
```

Exemple : Trouvez les noms d'employés qui sont communs aux deux tables.

```sql
SELECT Nom
FROM Employés1
INTERSECT
SELECT Nom
FROM Employés2;
```

## III. EXCEPT 

L'opération `EXCEPT`  est utilisée pour récupérer les enregistrements qui existent dans la première requête mais pas dans la deuxième. 
 
les requêtes doivent avoir le même nombre de colonnes et les types de données compatibles.

### Syntaxe de base :

```sql
SELECT colonne1, colonne2, ...
FROM table1
EXCEPT
SELECT colonne1, colonne2, ...
FROM table2;
```

Exemple : Trouvez les noms d'employés qui existent dans la première table mais pas dans la deuxième.

```sql
SELECT Nom
FROM Employés1
EXCEPT
SELECT Nom
FROM Employés2;
```

## IV. Remarques importantes

- Les opérations `UNION`, `INTERSECT`, et `EXCEPT` ne prennent en compte que les enregistrements distincts par défaut. Pour inclure tous les enregistrements, y compris les doublons, vous pouvez utiliser `UNION ALL`, `INTERSECT ALL`, et `EXCEPT ALL`.

- Les opérations `UNION`, `INTERSECT`, et `EXCEPT` peuvent être utilisées avec des critères de filtrage supplémentaires en utilisant des clauses `WHERE` dans chaque requête individuelle.

- Assurez-vous que les colonnes que vous souhaitez combiner ou comparer ont des noms et des types de données compatibles.

- Les opérations `UNION`, `INTERSECT`, et `EXCEPT` sont principalement utilisées pour comparer ou combiner des ensembles de données similaires, tels que des tables avec la même structure.