-- cour 10 

/*
------------ CRUD : --------------
C : create(INSERT INTO )
R : Read(SELECT)
U : UPDATE 
D : DELETE 
*/
-- UPDATE :

-- mise a jour d'une ligne :
UPDATE fv_clients 
SET client_loyalty = 20 WHERE client_firstname = "nebil";

--

UPDATE fv_clients 
SSET client_loyalty = 10 ; -- ceci affcete toutes la table 
--
UPDATE fv_clients 
SET client_loyalty = client_loyalty + 2 WHERE client_loyalty >= 20;


-- DELETE  :

-- supprimer 
DELETE FROM `nom_table` WHERE id = 2 ;

--vrq : vider la table 

DELETE FROM `nom_table`;
-- ou : plus optimisé
TRUNCATE TABLE `nom_table`;