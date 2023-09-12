-- cour 12 :

-- GROUB BY :


SELECT COUNT(*) AS "nombre de résuidants" , user_country FROM `fv_users` GROUP BY user_country ;

-- WITH ROLLUP :

SELECT user_country , SUM(user_age)
FROM fv_users
GROUP BY user_country WITH ROLLUP;

-- HAVAING :

SELECT user_country , SUM(user_age) AS `sum_ages`
FROM fv_users
GROUP BY user_country 
HAVING sum_ages > 20 ;

-- rq : on peut ajouter un tri :
SELECT user_country , SUM(user_age) AS `sum_ages`
FROM fv_users
GROUP BY user_country 
HAVING sum_ages > 20 
ORDER BY sum_ages ;