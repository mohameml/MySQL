
-- Parité I : Création de BD et des tables :

-- BD : Gestion_notes 

CREATE DATABASE Gestion_notes ;

USE Gestion_notes;


-- Etudient : pour simlifier les chauses : id_etd = numeor_etd

CREATE TABLE Etudient
(
    `id_etudient` SMALLINT(6)  AUTO_INCREMENT ,
    `nom` VARCHAR(50) NOT NULL ,
    `prenom` VARCHAR(50) NOT NULL ,

    PRIMARY KEY(`id_etudient`)
);


-- Matiére : pour simlifier : code_matiére=nom_matiére 

CREATE TABLE Matiere 
(
    `code_matiere` VARCHAR(50) ,
    `coefficient` SMALLINT(3) NOT NULL ,
    PRIMARY KEY(`code_matiere`)
);


-- Evaluation :

CREATE TABLE Evaluer
(
    `numero_etd` SMALLINT(6)  ,
    `code_mat` VARCHAR(50) ,
    `note` SMALLINT(2) ,

    FOREIGN KEY(`numero_etd`) REFERENCES  `Etudient`(`id_etudient`),
    FOREIGN KEY(`code_mat`) REFERENCES `Matiere`(`code_matiere`)
);



-- Partie II : Insertion de données :

-- Etudient :

INSERT INTO `Etudient`(`nom` , `prenom`)
VALUES  
("sidi" ,"Ahmed"),
("khaled","Mohamed"),
("Mohamed Lemine","Oumare"),
("chrif","Mohamedou")
;


-- Matiére :
INSERT INTO Matiere(`code_matiere` ,`coefficient`)
VALUES 
("Math",5),
("PC",3),
("FR",2);


-- Evaluer :

INSERT INTO Evaluer(`numero_etd`,`code_mat`,`note`)
VALUES
(1,"Math",17),
(2,"Math",15),
(3,"Math",13),
(4,"Math",20),
(1,"FR",12),
(2,"FR",17),
(3,"FR",10),
(4,"FR",19),
(1,"PC",18),
(2,"PC",11),
(3,"PC",15),
(4,"PC",14)
;


-- Partie III :

-- Question 1 :

SELECT COUNT(*) AS nombre_totale FROM Etudient;

-- Question 2 : note max , note min par Matiére 

SELECT code_mat , MAX(note) ,MIN(note)
FROM Evaluer
GROUP BY code_mat;

-- Question 3 : Moyenne de chaque étuident dans chaque Matiére 









