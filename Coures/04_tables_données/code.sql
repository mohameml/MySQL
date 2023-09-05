-- ceci est un commentaires :
# et ca aussi est un commentaires 
/*
Commentaires sur npluisres lignes 

*/

CREATE DATABASE `test` ;

SHOW DATABASES ;

USE `test`;

/*

Requets liées aux tables 

*/

-- afficher une table :
SHOW TABLES ;
-- si on'a pas utilise USE :
SHOW TABLES FROM `test`;


-- A1fficher la table avec toutes les attrinuts :

DESCRIBE `t_user`;
DESC `t_user`;
EXPLAIN `t_user`;

-- afficher tout le dattilles :
SHOW TABLE STATUS ; -- moçteur de stockage , encodage ...etc 
-- creér une Table :

CREATE Table `t_user`
(
    `id_user` INT ,
    `user_name` VARCHAR(65),
    `user_brithday` DATE
);


CREATE Table  IF NOT EXISTS `t_user`
(
    -- suite
);

-- modifier une tables : ALTER TABLE `nom_table`

/*

ALTER TABLE `nom_table`
    ADD .. ,
    MODIFY ... ,
    DROP .... ;

*/

ALTER Table `t_user`
    ADD  `code_user` TINYINT ,
    MODIFY  `id_user` SMALLINT ;
    
ALTER TABLE `t_user`
    CHANGE `user_brithday` `user_brith`  DATE ;


-- suppriumer une table :

DROP TABLE `t_user`;

