-- cour 05 : les contraintes 

CREATE DATABASE IF NOT EXISTS `cours_sql`;

USE `cours_sql`;

CREATE TABLE IF NOT EXISTS `table_users`
(
    `id_user` SMALLINT(6),
    `user_name` VARCHAR(30),
    `user_mail` VARCHAR(100),
    `user_registartion` DATE ,
    `user_admin` BOOLEAN ,
    PRIMARY KEY(id_user)
);

-- NOT NULL :

ALTER TABLE `table_users`
    MODIFY `id_user` SMALLINT(6) NOT NULL ,
    MODIFY `user_name` VARCHAR(30) NOT NULL ,
    MODIFY `user_mail` VARCHAR(100) NOT NULL ,
    MODIFY `user_registartion` DATE NOT NULL ;

-- DEFAULT :

ALTER TABLE `table_users`
    MODIFY `user_admin` BOOLEAN DEFAULT 0 ;

-- ou :
ALTER TABLE `table_users`
    ALTER `user_admin` SET DEFAULT 0 ;

-- rq : si on veut supprimer une contrainte 

ALTER TABLE `table_users`
    ALTER `user_admin` DROP DEFAULT ;

-- CHECK : 

ALTER TABLE `table_users`
    MODIFY `id_user` SMALLINT(6) NOT NULL CHECK(id_user<1000);

-- ou :

ALTER TABLE `table_users`
    ADD CHECK(id_user <1000 );

-- check sur plusiers attribut:

ALTER TABLE `table_users`
    ADD CONSTRAINT plusiers_check CHECK(id_user < 100000 AND  user_admin > 1);

-- pour le supprimer :

ALTER TABLE `table_users`
    DROP CHECK plusiers_check ;


-- UNIQUE :

ALTER TABLE `table_users`
    ADD UNIQUE(`id_user`);

-- Rq : lors de la création de la Table :

CREATE TABLE `nom_tab`
{
    -- les #ts attrinuts 
    UNIQUE(`nom_col1`) -- nom_col1 sera unique 
}

-- rq : une contraint de unicite sur pluiseres champs 

ALTER TABLE `table_users`
    ADD CONSTRAINT unique_ens UNIQUE(`id_user`, `user_name`);

ALTER TABLE `table_users`
    DROP INDEX  unique_ens  ; -- pour supprimer la contrainte 



-- PRIMARY KEY: 

-- lors de la création de table :

CREATE TABLE nom_tab 
{
    -- les attributs 

    PRIMARY KEY(nom_col);
}

-- ou :
ALTER TABLE  `table_users`
    ADD PRIMARY KEY('id_user');

-- retirer le clé primére :
ALTER TABLE `table_users`
    DROP PRIMARY KEY;

-- créer un clé primaire spécifique 

ALTER TABLE `table_users`
    ADD CONSTRAINT ID_specidique PRIMARY KEY(`id_user`,`user_name`);

-- AUTO_INCREMENT :

-- ou lors de la création de table :

CREATE TABLE `table_users`
{  
    `id_user` SMALLINT(6) AUTO_INCREMENT;
    -- les attributs 
    PRIMARY KEY(`id_user`);

}

-- rq : si on veut changer le debut de l'auto_increment :
ALTER TABLE `table_users` AUTO_INCREMENT = 100 ;



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
)
ENGINE = MyISAM 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci
;


-- clé étrange:

-- lors de la création :

CREATE TABLE `table_news`
(
    `id_news` SMALLINT(6) NOT NULL AUTO_INCREMENT,
    `news_title` VARCHAR(66) NOT NULL ,
    `news_contenu` TEXT NOT NULL ,
    `author` SMALLINT(6) NOT NULL ,

    PRIMARY KEY(`id_news`),
    FOREIGN KEY(`author`) REFERENCES `table_users`(`id_user`)
);

-- ou :

ALTER TABLE `table_news`
    ADD FOREIGN KEY(`author`) REFERENCES `table_users`(`id_user`);


-- INDEX :

CREATE INDEX  `index_users` ON `table_users`(`user_name`,`user_mail`);

ALTER TABLE `table_users`
    DROP INDEX `index_users`; -- pour le supprimer 
