-- sous-requets :

-- les players qui ont deja vendu qq jeux :

SELECT * FROM fv_players 
WHERE player_name IN 
(
    SELECT playertrade_seller  FROM fv_playertrades;
    
);

-- est ce que `Icekissy` est un vendeur de jeux :

SELECT * FROM fv_players
WHERE player_name = 
(
    SELECT playertrade_seller FROM fv_playertrades 
    WHERE playertrade_seller ='Icekissy' LIMIT 1 
);

-- est ce que 'Nephion' est un vendeur de jeux :

SELECT * FROM fv_players
WHERE player_name = 
(
    SELECT playertrade_seller FROM fv_playertrades 
    WHERE playertrade_seller ='Nephion' LIMIT 1 
);


-- les vendures qui ont vendu le jeu Épée en mousse


SELECT * FROM fv_players
WHERE player_name = ANY
(
    SELECT playertrade_seller FROM fv_playertrades 
    WHERE playertrade_item='Épée en mousse'
);