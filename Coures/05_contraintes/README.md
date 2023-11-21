# cour 05 : les contraintes en MySQL

Les **contraintes** en MySQL sont des règles appliquées aux données stockées dans une table pour garantir l'intégrité des données, la cohérence et la fiabilité. Elles permettent de spécifier les conditions que doivent respecter les données dans une table. 

## 1. NOT NULL

- **Description** : La contrainte `NOT NULL` spécifie qu'une colonne ne peut pas avoir de valeurs nulles, c'est-à-dire qu'elle doit toujours contenir une valeur.

- **Ajouetr :**

    * **lors de la création de table :**
        ```sql
        CREATE TABLE `test`
        (
            `id_user` SMALLINT(6) NOT NULL;
        );
        ```
    * **Ajouter avec ALTER TABLE** : 
        
        ```sql
        ALTER TABLE nom_de_la_table
        MODIFY  nom_colonne type_de_données NOT NULL;
        ```



- **Supprimer** :
    ```sql
    ALTER TABLE nom_de_la_table
        MODIFY nom_colonne TYPEDONNE ;
    
    ```

## 2. DEFAULT

- **Description** : La contrainte `DEFAULT` spécifie une valeur par défaut pour une colonne si aucune valeur n'est fournie lors de l'insertion d'une nouvelle ligne.

- **Ajouter :**
    * **Lors de la création de table :**
        ```sql
        CREATE TABLE `test`
        (
            `user_admin` BOOLEAN DEFAULT 0 ;
        );
        ```

    * **Apres la création de table** : TABLE` :
        
        ```sql

        -- Ave ALTER TABLE :
        ALTER TABLE `table_users`
            MODIFY `user_admin` BOOLEAN DEFAULT 0 ;

        -- ou :
        ALTER TABLE `table_users`
            ALTER `user_admin` SET DEFAULT 0 ;


        ```


- **Supprimer** :

    ```sql
    ALTER TABLE `table_users`
        ALTER `user_admin` DROP DEFAULT ;
    ```

 
## 3. CHECK

- **Description** : La contrainte `CHECK` permet de spécifier une condition ou une expression qui doit être vraie pour chaque ligne de la table.

- **Ajouter :**
    * **lors dela creéation d'une table :**

        ```sql
        CREATE TABLE `test`
        (
            `prix` INT CHECK(0 <= prix)
        );
        ```



    *  **Ajouter avec ALTER TABLE** :

        ```sql
        -- ajouter une seulle condition :
        ALTER TABLE nom_de_la_table
        ADD CHECK (condition);

        -- ajouter plusiers condition :

        ALTER TABLE `nom_table`
            ADD CONSTRAINT nom_spécifique CHECK(`cond1` AND `cond2`);
        ```


- **Supprimer :** :

    ```sql
    ALTER TABLE `nom_table`
        DROP CHECK nom_spécifique ;
    ```

## 4. UNIQUE

- **Description** : La contrainte `UNIQUE` garantit que toutes les valeurs dans une colonne sont uniques au sein de la table.

- **Ajouter :**

    * **Alors de la création de la table :**   

        ```sql
        CREATE TABLE `test`
        (
            `user_name` VARCHAR,

            UNIQUE(`user_name`)
        )
        ```


    * **Ajouter avec ALTER TABLE** : 

        ```sql
        ALTER TABLE nom_de_la_table
        ADD CONSTRAINT nom_contrainte UNIQUE (nom_colonne1 , nom_colonne2);

        ```

- **Supprimer :**
    
    ```sql
    ALTER TABLE `nom_de_la_table`
    DROP INDEX nom_contrainte  ; 
    ```

## 5. PRIMARY KEY

- **Description** : La contrainte `PRIMARY KEY` identifie de manière unique chaque enregistrement(ligne) dans une table. Elle combine les contraintes `UNIQUE` et `NOT NULL`.

- **Ajouter :**
    * **Lors de la création de la Table :**
        ```sql
        -- lors de la création de table :

        CREATE TABLE nom_tab 
        {
            -- les attributs 

            PRIMARY KEY(nom_col);
        }        
        
        ```
    * **Ajouter avec ALTER TABLE** : 

        ```sql
        ALTER TABLE nom_de_la_table
        ADD PRIMARY KEY (nom_colonne);
        ```



- **Supprimer :** :  
    ```sql
    ALTER TABLE `table_users`
        DROP PRIMARY KEY;    
    ```

## 6. AUTO_INCREMENT

- **Description** : La contrainte `AUTO_INCREMENT` est généralement utilisée pour les clés primaires. Elle permet à une colonne de générer automatiquement des valeurs numériques uniques à chaque nouvelle insertion, simplifiant ainsi la création d'identifiants uniques.

- **Ajouter avec CREATE TABLE** : Vous ajoutez généralement la contrainte `AUTO_INCREMENT` lors de la création de la table :

    ```sql
    CREATE TABLE nom_de_la_table (
        ID INT AUTO_INCREMENT PRIMARY KEY,
        ...
    );
    ```

- **Supprimer avec ALTER TABLE** : 

```sql
ALTER TABLE `test`
    MODIFY `id_user` SMALLINT(6) NOT NULL ; -- sans scpécifier AUTO_INCREMENT 
```


## 7. FOREIGN KEY

- **Description** : La contrainte `FOREIGN KEY` est utilisée pour établir des liens entre les tables. Elle garantit que les valeurs dans une colonne correspondent à une colonne d'une autre table.

- **Ajouter :**

    * **lors de la création d'une Table:**

        ```sql
        -- exmple complet :

        CREATE TABLE IF NOT EXISTS `table_users`
        (
            `id_user` SMALLINT(6) NOT NULL AUTO_INCREMENT,
            `user_name` VARCHAR(30) NOT NULL ,
            `user_mail` VARCHAR(100) NOT NULL,
            `user_registartion` DATE NOT NULL ,
            `user_admin` BOOLEAN  DEFAULT 0 ,
            UNIQUE(`user_name`) ,
            PRIMARY KEY(id_user)
        );


        CREATE TABLE `table_news`
        (
            `id_news` SMALLINT(6) NOT NULL AUTO_INCREMENT,
            `news_title` VARCHAR(66) NOT NULL ,
            `news_contenu` TEXT NOT NULL ,
            `author` SMALLINT(6) NOT NULL ,

            PRIMARY KEY(`id_news`),
            FOREIGN KEY(`author`) REFERENCES `table_users`(`id_user`)
        );
        ```

    * **Ajouter avec ALTER TABLE** : 

        ```sql
        ALTER TABLE nom_de_la_table
            ADD  FOREIGN KEY (nom_colonne) REFERENCES nom_table_reference (nom_colonne_reference);
        ```


- **Supprimer avec ALTER TABLE** : 
    
    ```sql
    ALTER TABLE `table_news`
        DROP FOREIGN KEY `nom_de_la_contraint` ; -- il faut nommer le contrainte FOREIGN KEY  
    ```

    Exemple :

    ```sql
    ALTER TABLE `table_news`
        ADD CONSTRAINT FK_user FOREIGN KEY(`author`) REFERENCES `table_users`(`id_user`);

    -- pour le supprimer :
    ALTER TABLE `table_news`
        DROP FOREIGN KEY FK_user;
    
    ```
## 8. INDEX

- **Description :**
    Un index en MySQL est une structure de données qui améliore la vitesse de récupération des données dans une table. Il agit comme une    
    table de correspondance entre les valeurs dans une colonne spécifique et les emplacements physiques des enregistrements correspondants. 
    Les index sont essentiels pour optimiser les performances des requêtes de recherche, de tri et de jointure.


- **Ajouter un Index:**
    
    Pour ajouter un index à une colonne dans MySQL, vous pouvez utiliser la commande `CREATE INDEX`. Voici la syntaxe générale :

    ```sql
    CREATE INDEX nom_de_l_index
    ON nom_de_la_table (nom_de_la_colonne);
    ```

    Exemple :

    ```sql
    CREATE INDEX idx_Nom
    ON Clients (Nom);
    ```

    Cela crée un index nommé "idx_Nom" sur la colonne "Nom" de la table "Clients". Cela accélérera les opérations de recherche basées sur   
    la colonne "Nom".

- **Supprimer un Index :**

    Pour supprimer un index en MySQL, vous pouvez utiliser la commande `DROP INDEX`. Voici la syntaxe générale :

    ```sql
    ALTER TABLE nom_de_la_table
    DROP INDEX nom_de_l_index;
    ```

    Exemple :

    ```sql
    ALTER TABLE Clients
    DROP INDEX idx_Nom;
    ```

    Cela supprime l'index nommé "idx_Nom" de la table "Clients".

-  **Afficher les Indexes :**

    Pour afficher les indexes d'une table en MySQL, vous pouvez utiliser la commande `SHOW INDEX`. Voici la syntaxe :

    ```sql
    SHOW INDEX FROM nom_de_la_table;
    ```

    Exemple :

    ```sql
    SHOW INDEX FROM Clients;
    ```

    Cette commande affichera les informations sur tous les indexes présents dans la table "Clients", 
    y compris leur nom, leur type, les colonnes indexées, etc.
 


