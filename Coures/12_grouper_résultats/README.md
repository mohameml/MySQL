# cour 12 : Grouper les Résultats 

Le regroupement ``GROUP BY`` et le filtrage d'agrégation ``HAVING`` en SQL sont des opérations essentielles qui permettent de regrouper des données en fonction de certaines colonnes, puis d'appliquer des fonctions d'agrégation à ces groupes de données. 

## I. GROUP BY

La clause GROUP BY est utilisée pour regrouper des lignes de données en fonction des valeurs d'une ou plusieurs colonnes spécifiées. Une fois les données regroupées, vous pouvez appliquer des fonctions d'agrégation telles que COUNT, SUM, AVG, MAX, MIN, etc., pour effectuer des calculs sur chaque groupe de données.

### Exemple 1 : Compter le nombre d'employés par département

Supposons que vous ayez une table "Employés" avec les colonnes "Nom", "Salaire" et "Département". Vous pouvez utiliser GROUP BY pour compter le nombre d'employés par département :

```sql
SELECT Département, COUNT(*) AS Nombre_des_Employés
FROM Employés
GROUP BY Département;
```

### Exemple 2 : Calculer la somme des ventes par produit

Si vous avez une table "Ventes" avec les colonnes "Produit" et "Montant", vous pouvez utiliser GROUP BY pour calculer la somme des ventes par produit :

```sql
SELECT Produit, SUM(Montant) AS Total_Ventes
FROM Ventes
GROUP BY Produit;
```

#### RQ : `WITH ROLLUP`

La clause `WITH ROLLUP` est utilisée en SQL pour générer des lignes de résumé supplémentaires lors de l'utilisation de la clause `GROUP BY`. Ces lignes de résumé contiennent des valeurs agrégées pour chaque niveau de regroupement. `WITH ROLLUP` est souvent utilisé pour générer des totaux partiels et un total global dans un seul ensemble de résultats.

La syntaxe générale de l'utilisation de `WITH ROLLUP` est la suivante :

```sql
SELECT colonne1, colonne2, ..., fonction_agrégée(colonne) AS résultat
FROM table
GROUP BY colonne1, colonne2, ..., WITH ROLLUP;
```

- `colonne1, colonne2, ...` : Les colonnes selon lesquelles vous effectuez le regroupement.
- `fonction_agrégée(colonne) AS résultat` : La fonction d'agrégation que vous souhaitez appliquer à une colonne pour obtenir un résultat agrégé.
- `table` : La table à partir de laquelle vous effectuez la requête.

Voici un exemple pour illustrer l'utilisation de `WITH ROLLUP` :

Supposons que vous ayez une table "Ventes" avec les colonnes "Année", "Mois", "Montant". Vous souhaitez obtenir un rapport qui affiche le total des ventes par année et par mois, ainsi que le total général par année. Vous pouvez utiliser `WITH ROLLUP` comme suit :

```sql
SELECT Année, Mois, SUM(Montant) AS Total_Ventes
FROM Ventes
GROUP BY Année, Mois WITH ROLLUP;
```

Les résultats incluront des lignes de résumé supplémentaires avec des valeurs agrégées pour chaque niveau de regroupement, par exemple :

- Total des ventes par année et par mois.
- Total des ventes par année uniquement (mois NULL).
- Total général de toutes les années (année NULL).

L'utilisation de `WITH ROLLUP` est utile pour générer rapidement des résumés hiérarchiques de données dans une seule requête, ce qui facilite l'analyse des données agrégées à différents niveaux de détail.

## II. HAVING

La clause HAVING est utilisée pour filtrer les résultats de GROUP BY en fonction de valeurs agrégées. Elle permet de spécifier des conditions sur les résultats agrégés. HAVING est généralement utilisé après GROUP BY.

### Exemple 1 : Trouver les départements avec plus de 5 employés

En utilisant la requête précédente qui compte le nombre d'employés par département, vous pouvez ajouter HAVING pour filtrer les départements ayant plus de 5 employés :

```sql
SELECT Département, COUNT(*) AS Nombre_des_Employés
FROM Employés
GROUP BY Département
HAVING COUNT(*) > 5;
```

### Exemple 2 : Sélectionner les produits avec des ventes totales supérieures à 1000

Utilisez GROUP BY pour calculer la somme des ventes par produit, puis utilisez HAVING pour sélectionner les produits avec des ventes totales supérieures à 1000 :

```sql
SELECT Produit, SUM(Montant) AS Total_Ventes
FROM Ventes
GROUP BY Produit
HAVING SUM(Montant) > 1000;
```

