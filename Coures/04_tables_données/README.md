# cour 04 : les Tables et les types de données 

# 1. Les Tables 


## a.Introduction aux Tables en SQL

- les **tables** sont des structures fondamentales utilisées pour stocker et organiser des données. Une table est essentiellement une collection de données organisée en lignes (ou enregistrements) et en colonnes (ou attributs). Les tables sont le pilier de la modélisation des données relationnelles.

### b.Structure d'une Table

Une table est composée des éléments suivants :

1. **Nom de la Table** : Chaque table doit avoir un nom unique qui la distingue des autres tables de la base de données.

2. **Colonnes (Attributs)** : Les colonnes sont des éléments de données individuels de la table. Chaque colonne a un nom et un type de données spécifique qui détermine le genre de données qu'elle peut stocker, par exemple, des nombres, des chaînes de caractères, des dates, etc.

3. **Lignes (Enregistrements)** : Les lignes de la table contiennent les données réelles. Chaque ligne représente un enregistrement unique avec des valeurs spécifiques pour chaque colonne.

4. **Clé Primaire** : Une clé primaire est une ou plusieurs colonnes qui garantissent l'unicité de chaque enregistrement dans la table. Elle est utilisée pour identifier de manière unique chaque ligne.

### c. Les Requétes :

- **Créer une Table :** 

    ```sql
    -- creér une Table :

    CREATE Table `t_user`
    (
        `id_user` INT ,
        `user_name` VARCHAR(65),
        `user_brithday` DATE
    );

    -- ou :

    CREATE Table  IF NOT EXISTS `t_user`
    (
        -- suite
    );

    
    ```

-  **Afficher le contenu d'une Table :**

    ```sql
    -- afficher les table :
    USE `test`;
    SHOW TABLES ; -- afficher le tableaux de la BD : test

    -- si on'a pas utilise USE :
    SHOW TABLES FROM `test`;


    -- A1fficher la table avec toutes les attrinuts :

    DESCRIBE `t_user`;
    -- ou :
    DESC `t_user`;
    -- ou :
    EXPLAIN `t_user`;  

    -- afficher tout le dattilles :
    SHOW TABLE STATUS ; -- moçteur de stockage , encodage ...etc 
    
    ```

- **Supprimer une table :**
    ```sql
    DROP TABLE `t_user`;
    ```

- **changer la structure d'une Table : ``ALTER TABLE``**


    *  changer la structure :

  
        ```sql
        ALTER TABLE `nom_table`
            ADD `nom_nv_coln` TYPE(m) , -- ajouetr un nouveau attribut .
            CHANGE `nom_coln_ancien` `nom_coln_nv` TYPE  , -- renommer une colonne
            MODIFY `nom_coln` NOUVEAUTYPE ,  -- modifier le type d'un attribut 
            DROP  `nom_col`  ;  -- supprimer une colonne 
        
        ```


    * Rénommer une table :

        ```sql
        ALTER TABLE nom_table renme to new_name ;  -- pour renommer la table 

        ```
    * Ajouter des contraints .




#### RQ :
on peut spécifier le moteur de stockage et l'encodage lors de la creéation d'une table

Exemple :

```sql

CREATE TABLE IF NOT EXISTS `table_users`
(
    `id_user` SMALLINT(6),
    `user_name` VARCHAR(30) ,
    `user_mail` VARCHAR(100) ,
    `user_registartion` DATE ,
    `user_admin` BOOLEAN  ,
)
ENGINE = MyISAM 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci
;


```









# 2.Types de données


les **types de données** déterminent le genre de données qu'une colonne peut stocker. Les types de données sont essentiels pour garantir la cohérence et l'intégrité des données dans une base de données. 

1. **INT** : Il stocke des nombres entiers, tels que -1, 0, 1, 2, 3, etc.

2. **VARCHAR(n)** : Il stocke des chaînes de caractères de longueur variable, avec une longueur maximale de n caractères.

3. **CHAR(n)** : Il stocke des chaînes de caractères de longueur fixe, avec une longueur exacte de n caractères.

4. **FLOAT** ou **DOUBLE** : Ils stockent des nombres à virgule flottante (nombres décimaux).

5. **DATE** : Il stocke des dates au format "AAAA-MM-JJ".

6. **TIME** : Il stocke des heures au format "HH:MM:SS".

7. **DATETIME** ou **TIMESTAMP** : Ils stockent des combinaisons de dates et d'heures.

8. **BOOLEAN** : Il stocke des valeurs booléennes, soit TRUE, soit FALSE.

## 2.1 Types numériques

|TYPE|TAILLE|LIMITE (signé)|LIMITE (non signé)|
|:--|:--|:--|:--|
|BIT(m)|1 octet|b'000000' à b'111111'|b'000000' à b'111111'|
|TINYINT(m)|1 octet|-128 à 127|0 à 255|
|BOOL<br>BOOLEAN|-|-|-|
|SMALLINT(m)|2 octets|-32768 à 32767|0 à 65535|
|MEDIUMINT(m)|3 octets|-8388608 à 8388607|0 à 16777215|
|INT(m)<br>INTEGER(m)|4 octets|-2147483648 à 2147483647|0 à 4294967295|
|BIGINT(m)|8 octets|-2<sup>63</sup> à 2<sup>63</sup>-1|0 à 2<sup>64</sup>-1|
|DECIMAL(m, d)<br>DEC(m, d)<br>NUMERIC(m, d)<br>FIXED(m, d)|8 octets|jusqu'à 65 chiffres significatifs|jusqu'à 65 chiffres significatifs|
|FLOAT(m, d)|4 octets|-1,175494351.10<sup>-38</sup> à 3,402823466.10<sup>38</sup>|1,175494351.10<sup>-38</sup> à 3,402823466.10<sup>38</sup>|

> **NOTE** : Le type BOOLEAN est équivalent à un TINYINT(1)

---

## 2.2 Types pour les chaînes

|TYPE|TAILLE|LIMITE|
|:--|:--|:--|
|CHAR(m) / BINARY(m)|m|255 caractères / octet|
|VARCHAR(m) / VARBINARY(m)|m+1|255 caractères / octet|
|TINYTEXT / TINYBLOB|m+1|255 caractères / octet|
|TEXT(m) / BLOB(m)|m+2|65535 caractères / octet|
|MEDIUMTEXT / MEDIUMBLOB|m+3|16777215 caractères / octet|
|LONGTEXT / LONGBLOB|m+4|4294967295 caractères / octet|
|SET|1, 2, 3, 4 ou 8 octets|8, 16, 24, 32 ou 64 choix|
|ENUM|1 ou 2 octets|255 ou 65535 choix|

---

## 2.3 Types pour les dates

|TYPE|TAILLE|LIMITE|
|:--|:--|:--|
|DATE|3 octets|1000-01-01 à 9999-12-31|
|TIME|3 octets|00:00:00 à 23:59:59|
|DATETIME|8 octets|1000-01-01 00:00:00 à 9999-12-31 23:59:59|
|YEAR|1 octet|1901 à 2155|
|TIMESTAMP|4 octets|19700101000000 à 20380119031407|