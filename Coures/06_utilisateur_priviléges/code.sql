-- cour 06 



/*

--------------- Gestion des Utilisateurs : -------------------

*/
-- les utilisatuers :
SELECT user from mysql.user;

-- l'utilisateur courrant :

SELECT current_user();

-- creér un utilisateur :

CREATE USER 'nebil'@'localhost' IDENTIFIED BY '22452510'; 

-- RQ  : on peut connecteur par la commande : mysql -u nebil -p

-- changer le mot de passe :

-- methode 1 :

SET PASSWORD FOR 'nebil'@'localhost' = '01234RT6';

-- méthode 2 : recommande 

ALTER USER 
    'nebil' IDENTIFIED BY 'newPAss652';

-- changer le nom :

RENAME USER 'nebil'@'localhost' TO 'newname'@'localhost';


-- supprimer un User :

DROP USER 'nom'@'localhost';


/*

----------------- Les droits d'accées : -----------------

*/

-- Syntaxe génrale de precision d'une droite d'acces :

GRANT '<priviléges>' 
    ON 'nomBD'.'nomTable'
    TO 'nomUser'@'localhost';

-- Exemple :

GRANT ALL 
    ON 'cours_sql'.* TO 'nebil'@'loclalhost'; 

-- rq : si on veut ajouter le droit de chnager le droi d'acceés :

GRANT ALL 
    ON 'cours_sql'.* TO 'nebil'@'loclalhost' WITH GRAND OPTION; 

-- Rétirer un droit :

REVOKE '<priviléges>'
    ON 'nomBD'.'nomTable'
    FROM 'nomUser'@'localhost'; 
