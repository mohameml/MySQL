
-- création de la BD :

CREATE DATABASE `PhotoNum`;

USE `PhotoNum`;



-- création des tables :

-- table Client 

CREATE TABLE Client
(
    Email VARCHAR(50) NOT NULL ,
    nom VARCHAR(50) NOT NULL ,
    prénom VARCHAR(50) NOT NULL ,
    adress VARCHAR(50) ,
    passwd VARCHAR(50) NOT NULL ,

    PRIMARY KEY(Email)
);


-- table Fichier :
