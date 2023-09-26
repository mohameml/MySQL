# cour 15 : la division en SQL 



1. **Introduction à la Division :**


- La division est une opération en SQL qui permet de trouver des correspondances dans un ensemble de données par rapport à un autre. 

- Elle est souvent utilisée pour répondre à des questions telles que :
    
    * "Quels éléments de l'ensemble A ont une correspondance complète avec l'ensemble B ?" 
    
    * "Quels éléments de l'ensemble A sont associés à tous les éléments de l'ensemble B ?"


- **Notation  :** R1 ÷ R2
    
    - **Condition :**  R1 et R2 deux relations telles que l’ensemble des attributs de R2 est inclus dans l’ensemble des attributs de R1.
    
    - **Résultat :**

        - Att2 : ensemble des attributs de R2 ET  Att1 = Att2 ∪ Att3 : ensemble des attributs de R1

        - Résultat : Tous les tuples t3 sur Att3 tels que : pour chaque tuple t2 ∈ R2 (sur Att2), le tuple (t2,t3) (sur Att1) existe dans R1.


- en SQL n'existe pas une opération standard pour réaliser la division .



2. **Opération de Division Simulée**

La division n'est pas une opération SQL standard, ce qui signifie qu'elle doit souvent être simulée à l'aide d'autres opérations SQL. Les deux approches courantes pour simuler la division sont l'utilisation de NOT IN et NOT EXISTS.



2.1 **Division avec NOT EXISTS :**


- **Réquette Génearle :**


R(A,B) / S(B) 

```sql
SELECT A
FROM R r
WHERE NOT EXISTS (
SELECT null FROM S s
WHERE NOT EXISTS 
    (
        SELECT null  FROM R
        WHERE A = r.A AND B= s.B 
    )
);


```



- **Exemple1 :**

Supposons que nous ayons deux tables : "Produits" et "Commandes". Nous voulons trouver les produits qui ont été commandés par tous les clients.

```sql
SELECT P.nom_produit
FROM Produits P
WHERE NOT EXISTS (
  SELECT C.ID_Client
  FROM Clients C
  WHERE NOT EXISTS (
    SELECT D.ID_Produit
    FROM Détails_Commande D
    WHERE D.ID_Produit = P.ID_Produit AND D.ID_Client = C.ID_Client
  )
);
```


- **Exemple 2 :**

- Les noms et prénoms des étudiants qui ont une note dans  toutes les matières :

```sql
SELECT nom , prenom FROM Eleves e
WHERE NOT EXISTS 
(
    SELECT matiere FROM MATIERES m
    WHERE NOT EXISTS
    (
        SELECT nom ,prenom FROM Eleves 
        WHERE prenom = e.prenom 
        AND nom = e.nom
        AND matiere = e.matiere
    )
);

```

- **Exemple 3 :**

- on deux tables `Articles`(`nom_article`,`couleur`) , `Couleures`(`couleur`)

- les noms des articles qui ont toutes les couleures .

```sql
SELECT nom_article FROM Articles Ar1 
WHERE NOT EXISTS 
(
    SELECT couleur FROM Couleures 
    WHERE NOT EXISTS 
    (
        SELECT couleur FROM Artciles Ar2
        WHERE Ar1.nom_article = Ar2.nom_article 
        AND Ar2.couleur = couleur 
    )
);

```

- **Explication détaillées :**

    -  pour trouver toutes les articles qui ont toute les couleures il suffit de :

        * cherher les couleures manquent pour chaque artciles .

        * éliminuer les artciles qui ont des couleures manquentes .

    - Exemple : ont cherchre les couleures manquentes pour `T-shirte` :

        ```sql
        SELECT couleur FROM Couleures cl
        WHERE NOT EXISTS 
        (
            SELECT *  FROM Articles Ar 
            WHERE Ar.nom_artcile ='T_shirte' AND Ar.couleur = cl.couleur
        );
        ```

    - Donc il suffit de récupere les articles qui n'ont pas des couleures manquentes :

        ```sql

        SELECT nom_article FROM Articles Ar1
        WHERE NOT EXISTS 
        (
            SELECT couleur FROM Couleures 
            WHERE NOT EXISTS 
            (
                SELECT couleur FROM Artciles Ar2
                WHERE Ar1.nom_article = Ar2.nom_article 
                AND Ar2.couleur = couleur 
            )
        );     
        
        ```


2.2 **DIVISION avec COUNT :**


Les noms et prénoms des étudiants qui ont une note 
dans toutes les matières 
SELECT n.nom, n.prenom
FROM Notes n
GROUP BY n.nom, n.prenom
HAVING count(*) = (SELECT count (distinct cours)
FROM Notes);




2.3 **DIVISION AVEC MINUS :**