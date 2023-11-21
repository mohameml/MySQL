# cour 24 : SQLite


## 1.Introduction à SQLite :

- SQLite est un système de gestion de base de données relationnelles (SGBDR) léger, autonome et autogéré. 

- Il s'agit d'une base de données embarquée qui fonctionne sans serveur distinct, stockant les données dans un simple fichier accessible par n'importe quel programme. 



## 2.Installation de SQLite sur Unix :

- Pour utiliser SQLite sur Unix, assurez-vous de l'avoir installé. 

- Il est souvent inclus par défaut dans de nombreuses distributions Unix. Vous pouvez vérifier s'il est déjà installé en ouvrant un terminal et en tapant :

```bash
sqlite3 --version
```

- Si SQLite n'est pas installé, vous pouvez l'installer en utilisant le gestionnaire de paquets de votre distribution :

```bash
sudo apt-get update
sudo apt-get install sqlite3
```

## 3.Utilisation de SQLite :

1. **Démarrer le shell SQLite :**

    Lancez le shell SQLite en ouvrant un terminal et en tapant :

    ```bash
    sqlite3 ma_base_de_donnees.db
    ```

    Cela ouvrira le shell SQLite et créera ou ouvrira la base de données nommée `ma_base_de_donnees.db`.

2. **Opérations dans le shell SQLite :**

    - Créer une table avec des colonnes :
      ```sql
      CREATE TABLE utilisateurs (id INTEGER PRIMARY KEY, nom TEXT, age INTEGER);
      ```

    - Insérer des données dans la table 'utilisateurs' :
      ```sql
      INSERT INTO utilisateurs (nom, age) VALUES ('Alice', 30);
      INSERT INTO utilisateurs (nom, age) VALUES ('Bob', 28);
      ```

    - Sélectionner des données :
      ```sql
      SELECT * FROM utilisateurs;
      ```

    - Quitter le shell SQLite :
      ```sql
      .quit
      ```

### Remarques importantes :

- Vous pouvez exécuter des requêtes SQL directement dans le shell SQLite.
- Le fichier de la base de données créée se trouvera dans le répertoire où vous avez lancé le shell SQLite.
- Les commandes SQLite suivent la syntaxe SQL standard.
- Pour une utilisation plus avancée, consultez la documentation de SQLite et les fonctionnalités supplémentaires comme les transactions, les contraintes, les indexes, etc.

- SQLite est largement utilisé pour des applications mobiles, des petits projets ou des besoins d'entrepôt de données légers grâce à sa facilité d'utilisation et sa portabilité.