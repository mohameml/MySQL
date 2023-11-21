# cour 06 : Utilisateur Et Priviléges 

La gestion des utilisateurs et des privilèges en SQL est essentielle pour garantir la sécurité et l'intégrité des données dans une base de données.

## I. Gestion des utilisateurs :

### 1. Création des User :

Pour créer un utilisateur dans une base de données, On utilise  la commande  `CREATE USER` 

```sql
CREATE USER 'nom_utilisateur'@'adresse_IP' IDENTIFIED BY 'mot_de_passe';
```


- `'nom_utilisateur'` : Le nom de l'utilisateur que vous créez.
- `'adresse_IP'` : L'adresse IP à partir de laquelle cet utilisateur est autorisé à se connecter. Vous pouvez utiliser `%` pour autoriser la connexion depuis n'importe quelle adresse IP.
- `'mot_de_passe'` : Le mot de passe associé à cet utilisateur.

Exemple :

```sql
CREATE USER 'nebil'@'localhost' IDENTIFIED BY 'jhfdjksfsdfkl';
```

### 2. Changer le mot de passe d'un User :

#### Méthode 1 :

```sql
SET PASSWORD FOR 'nebil'@'localhost' = '01234RT6';
```

#### Méthode 2 :

c'est la méthode le plus recommandée :

```sql

ALTER USER 
    'nebil' IDENTIFIED BY 'newPAss652';

```

### 3. changer le nom d'un User :

```sql
RENAME USER 'nebil'@'localhost' TO 'newname'@'localhost';

```

### 4. Suppression d'Utilisateurs :

Pour supprimer un utilisateur, utilisez la commande `DROP USER` 

```sql
DROP USER 'nom_utilisateur'@'adresse_IP';

```


#### RQ :

```sql
-- les utilisatuers :
SELECT user from mysql.user;

-- l'utilisateur courrant :

SELECT current_user();

```

## II. Attribution de Privilèges

### 1. Ajouter de Priviléges `GRANT` :

- Une fois que vous avez créé un utilisateur, vous pouvez lui attribuer des privilèges pour déterminer ce qu'il est autorisé à faire dans la base de données. Les privilèges courants incluent SELECT (lecture), INSERT (insertion), UPDATE (mise à jour), DELETE (suppression) et d'autres.

- La commande générale pour attribuer des privilèges est `GRANT`. 

- Syntaxe génrale :

```sql
GRANT <priviléges> 
    ON 'nomBD'.'nomTable'
    TO 'nomUser'@'localhost';

```
Exemple :

```sql
GRANT SELECT, INSERT ON nom_de_la_table TO 'nom_utilisateur'@'adresse_IP';
```

#### RQ :

Les priviléges :

![priviléges](sqltable.jpg)

### 2. Révocation de Privilèges

- Si vous devez retirer des privilèges à un utilisateur, vous pouvez utiliser la commande `REVOKE`. 

Exemple :

```sql
REVOKE SELECT, INSERT ON nom_de_la_table FROM 'nom_utilisateur'@'adresse_IP';
```

`



