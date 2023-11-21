

CREATE DATABASE Comptes ;


CREATE TABLE Comptes 
(
    Email VARCHAR(50) NOT NULL PRIMARY KEY ,
    NOM VARCHAR(50) NOT  NULL ,
    PRENOM VARCHAR(50) NOT  NULL , 
    
    motpasse VARCHAR(50) NOT NULL 

);

INSERT INTO Comptes(Email , NOM , PRENOM , motpasse)
VALUES ('mhm@gmail.com' , 'sidi' ,'mohamed' , 'klmn');