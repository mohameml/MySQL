-- cour 13 :

-- UNION :

SELECT * FROM fv_site1_users;
SELECT * FROM fv_site2_users;

-- l'équivalent :
-- rq : il faut que les deux tables ont : le méme  noms , types , orders des champes .

SELECT * FROM fv_site1_users
UNION 
SELECT * FROM fv_site2_users;

-- : il n'ya pas de doublons :

SELECT user_name FROM fv_site1_users
UNION 
SELECT user_name FROM fv_site2_users;

-- si on veut le doublons on utilise : UNION ALL 

SELECT user_name FROM fv_site1_users
UNION  ALL
SELECT user_name FROM fv_site2_users;


-- INTERSECT :

SELECT user_name FROM fv_site1_users
INTERSECT
SELECT user_name FROM fv_site2_users;

-- EXCEPT :
SELECT user_name FROM fv_site1_users
EXCEPT   
SELECT user_name FROM fv_site2_users;