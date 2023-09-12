# cour 08 : Filtrer de données 

Le filtrage de données en SQL est une opération cruciale qui vous permet de sélectionner et de trier les données dans une base de données en fonction de critères spécifiques. Les clauses ``WHERE``, ``ORDER BY``, ``LIMIT`` et ``OFFSET`` sont couramment utilisées pour effectuer ces opérations. 

## I. Clause WHERE

- La clause ``WHERE`` est utilisée pour filtrer les lignes de données en fonction de conditions spécifiques. Elle est généralement utilisée dans une instruction SELECT, UPDATE ou DELETE.

- La syntaxe générale est la suivante :

    ```sql
    SELECT colonnes
    FROM table
    WHERE condition;
    ```

    * `colonnes` : Les colonnes que vous souhaitez sélectionner.
    * `table` : Le nom de la table à partir de laquelle vous lisez les données.
    * `condition` : Les critères de filtrage qui déterminent quelles lignes seront incluses dans le résultat.

    Exemple :

    ```sql
    SELECT Nom, Prénom, Âge
    FROM Clients
    WHERE Âge >= 30;
    ```

- **Opérateures :**

    * **Opérateures Logiques : `AND` , `OR` , `NOT`:**
        ```sql
        SELECT * FROM fv_games WHERE id_game = 5 OR id_game = 11;
        SELECT * FROM fv_games WHERE game_price > 15 AND game_stock > 20;
        SELECT * FROM fv_games WHERE  NOT game_pric > 15
        ```

    * **Opérateures Arithemétiques : `+ , - , * , / , %` :**

        SQL prend en charge diverses opérations arithmétiques que vous pouvez effectuer sur les données numériques stockées dans une base 
        de données. 

        ```sql
        SELECT Colonne1 + Colonne2 AS Somme FROM MaTable;
        
        SELECT Colonne1 - Colonne2 AS Différence FROM MaTable;

        SELECT Colonne1 * Colonne2 AS Produit FROM MaTable;

        SELECT Colonne1 / Colonne2 AS Quotient FROM MaTable;

        SELECT Colonne1 % Colonne2 AS Reste FROM MaTable;

        
        ```

- **Comparateures :**
    
    * **Compérateures Logiques : `IN` , `BETWEEN` ,`LIKE` :**

        ```sql

        -- IN :
        SELECT * FROM fv_games WHERE game_stock IN (7,4,3);

        -- Between :
        SELECT * FROM fv_games WHERE game_price BETWEEN 0 AND 20 ;

        -- like : % , _ 
        SELECT * FROM fv_games WHERE game_title LIKE 'Pokémon%';

        SELECT * FROM fv_games WHERE game_title LIKE "%a"; -- toutes le chaines qui sé termine par a 

        SELECT * FROM fv_games WHERE game_title LIKE "a%"; -- toutes le chaines qui commance par a 

        SELECT * FROM fv_games WHERE game_title LIKE "%a%"; -- toutes le chaines qui contient la lettre a 

        SELECT * FROM fv_games WHERE game_title LIKE "pa%on"; -- toutes le chaines qui commance par 'pa' et se termine par 'on'.

        SELECT * FROM fv_games WHERE game_title LIKE "a_c"; -- toutes le chaines de form : aac,abc,acc,adc,...azc , a1c ... etc 
        ```


    * **Comparateures Arithmetiques : `= , > ,>= , < , <= , != ` :**

        ```sql
        SELECT * FROM fv_games WHERE id_game = 5 ;
        SELECT * FROM fv_games WHERE game_price >= 15;      
        
        ```

- **`IS NULL` et `IS NT NUU`:**


    Les expressions `IS NULL` et `IS NOT NULL` en SQL sont utilisées pour évaluer si une colonne ou une expression contient une valeur 
    nulle (NULL) ou non. Les valeurs NULL indiquent l'absence de données ou l'indétermination d'une valeur dans une colonne.

    ```sql
    SELECT * FROM MaTable WHERE Date_de_Naissance IS NULL;
    SELECT * FROM MaTable WHERE Adresse_Email IS NOT NULL;
 
    ```





## II. Clause ORDER BY

- La clause ORDER BY est utilisée pour trier les résultats d'une requête en fonction d'une ou plusieurs colonnes. Elle peut trier les données dans l'ordre croissant ``ASC`` ou décroissant ``DESC``. 

- La syntaxe est la suivante :

    ```sql
    SELECT colonnes
    FROM table
    ORDER BY colonne1 [ASC|DESC], colonne2 [ASC|DESC], ...;
    ```

    - `colonne1`, `colonne2`, ... : Les colonnes par lesquelles vous souhaitez trier.
    - `[ASC|DESC]` : Facultatif. Indique l'ordre de tri (ASC pour croissant, DESC pour décroissant).

    Exemple :

    ```sql
    SELECT Nom, Prénom, Âge
    FROM Clients
    ORDER BY Âge DESC;
    ```

- **RQ :**
    Lorsque vous avez deux critères de tri dans une clause ``ORDER BY`` en SQL, la base de données trie d'abord les données en fonction du 
    premier critère, puis en cas d'égalité, elle utilise le deuxième critère pour effectuer un tri supplémentaire

    ```sql
    SELECT * FROM Notes ORDER  BY note_math , note_pc ASC ;
    
    ```


## III. LIMIT et OFFSET

- Les clauses LIMIT et OFFSET sont utilisées pour paginer les résultats d'une requête, ce qui signifie que vous ne récupérez qu'une partie des résultats à la fois. Cela est utile pour afficher un nombre limité de résultats par page dans une application web, par exemple. 


- La syntaxe est la suivante :

    ```sql
    -- LIMIT :
    SELECT * FROM table_users LIMIT nb_lignes ;

    -- OFFSET :
    SELECT colonnes
    FROM table
    LIMIT nombre_de_lignes OFFSET décalage;

    -- Syntaxe éqivalent à OFFSET :
    SELECT * FROM fv_games LIMIT 3,5 ; -- inidce , nombre 

    ```

    - `nombre_de_lignes` : Le nombre de lignes à récupérer.
    - `décalage` : Le nombre de lignes à ignorer avant de commencer à récupérer des données.

    Exemple :

    ```sql
    SELECT Nom, Prénom, Âge
    FROM Clients
    LIMIT 10 OFFSET 20;
    ```

    Cela récupérera 10 lignes de données à partir de la 21e ligne de la table "Clients".
