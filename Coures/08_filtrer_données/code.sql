-- cour 08 

-- sélectionner une ligne 
SELECT * FROM fv_games WHERE id_game = 11;

-- sélectionner une partie de la table :

SELECT * FROM fv_games WHERE id_game > 5 ;

-- AND , OR :
SELECT * FROM fv_games WHERE id_game = 5 OR id_game = 11;
SELECT * FROM fv_games WHERE game_price > 15 AND game_stock > 20;

-- jeux free :
SELECT * FROM fv_games WHERE game_price = 0;

-- IN :
SELECT * FROM fv_games WHERE game_stock IN (7,4,3);

-- Between :
SELECT * FROM fv_games WHERE game_price BETWEEN 0 AND 20 ;

-- like : % , _ 
SELECT * FROM fv_games WHERE game_title LIKE 'Pokémon%';


-- IS NULL // IS NOT NULL :
SELECT * FROM fv_games WHERE game_price IS NULL ;

-- ORDER BY : par défaut dans l'orde croissant de PIR 

SELECT * FROM fv_games ORDER BY game_title; -- croissant 
SELECT * FROM fv_games ORDER BY game_title DESC ; -- décroissant 

SELECT * FROM fv_games ORDER BY game_title , game_price DESC; -- ie : si il y'a deux jeux de méme non sera triée par ordre de prix.

-- LIMIT :
SELECT * FROM fv_games LIMIT 5 ;

-- OFFSET :

SELECT * FROM fv_games LIMIT 5 OFFSET 3 ;

-- 
SELECT * FROM fv_games LIMIT 3,5 ; -- inidce , nombre 

