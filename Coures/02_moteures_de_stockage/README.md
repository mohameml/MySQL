# cour 02 : Les Moteures de stockages 


## 1. Introduction aux moteurs de stockage

#### Définition :

Un moteur de stockage, également appelé gestionnaire de stockage ou moteur de base de données, est un composant crucial d'un système de gestion de bases de données relationnelles (SGBDR). Il est responsable de la manière dont les données sont stockées, organisées, gérées, et comment elles sont accessibles et gérées par le système. Chaque SGBDR peut avoir plusieurs moteurs de stockage disponibles, chacun ayant ses propres caractéristiques et avantages.

#### Rôle et importance :
- Le moteur de stockage détermine la manière dont les données sont physiquement stockées sur le disque, ce qui peut avoir un impact significatif sur les performances et la gestion des données.
- Il offre des fonctionnalités spécifiques, telles que la gestion des transactions, la concurrence, l'indexation, etc.
- Le choix du moteur de stockage est crucial pour l'optimisation des performances et la prise en charge des fonctionnalités nécessaires à une application.

### 2. Types de moteurs de stockage

#### Moteurs de stockage InnoDB :
- Prise en charge des transactions ACID (Atomicité, Cohérence, Isolation, Durabilité).
- Gestion avancée de la concurrence.
- Utilisé par défaut dans MySQL.

#### Moteurs de stockage MyISAM :
- Stockage non transactionnel.
- Performances de lecture rapides.
- Peu d'intégrité des données.

#### Moteurs de stockage MEMORY :
- Stockage en mémoire vive RAM.
- Très rapide mais ne convient pas pour les données volumineuses.
- Les données sont perdues en cas de redémarrage du serveur.





### 3. Comparaison des moteurs de stockage

#### Performances :
- InnoDB est souvent recommandé pour les performances globales et la prise en charge des transactions.
- MyISAM est rapide en lecture, mais moins fiable en écriture.

#### Intégrité des données :
- InnoDB garantit l'intégrité des données grâce à la prise en charge des transactions.
- MyISAM est moins fiable en matière de cohérence des données.

#### Fonctionnalités avancées :
- InnoDB prend en charge les transactions, la concurrence et les fonctionnalités avancées.
- MyISAM est plus simple et ne prend pas en charge certaines fonctionnalités avancées.

### 4. Choix du moteur de stockage

#### Facteurs de décision :
- Taille et nature des données.
- Besoins de performances.
- Niveau de sécurité et d'intégrité requis.
- Fonctionnalités spécifiques à l'application.

#### Scénarios d'utilisation recommandés :
- Utilisez InnoDB pour les applications transactionnelles critiques.
- MyISAM peut être utilisé pour les applications de lecture intensive.
- Sélectionnez le moteur de stockage en fonction des besoins spécifiques de l'application.

### 5. Modification du moteur de stockage :

```sql
  // pour InnoDB :
 SET default_storage_engine = InnoDB ;

 // pour MyISAM :
 SET default_storage_engien = MyISAM ;
```
#### RQ :
pour affichier les moteures de stockages :
```sql
SHOW ENGINENS ;
```


