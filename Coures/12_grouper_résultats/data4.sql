/*
----------------------------------------------------------------------------------------------------------------
-- FICHIER SQL POUR LA SÉANCE #14 (youtube.com/formationvideo8)
-- Jason CHAMPAGNE
----------------------------------------------------------------------------------------------------------------
-- Re-création de la base de données ----------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
DROP DATABASE IF EXISTS `fv_database`;
CREATE DATABASE IF NOT EXISTS `fv_database`;
USE `fv_database`;

/*
----------------------------------------------------------------------------------------------------------------
-- Création des tables -----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
CREATE TABLE IF NOT EXISTS `fv_users`
(
	`id_user` INT NOT NULL AUTO_INCREMENT, 
	`user_name` VARCHAR(65) NOT NULL, 
	`user_age` INT NOT NULL, 
	`user_country` VARCHAR(65) NOT NULL, 
	`user_registration` DATE NOT NULL, 
	PRIMARY KEY(`id_user`)
);

/*
----------------------------------------------------------------------------------------------------------------
-- Ajout de quelques enregistrements ---------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
*/
INSERT INTO `fv_users`(`user_name`, `user_age`, `user_country`, `user_registration`)
VALUES
('Marc', 43, 'France', '2019-01-01'), 
('Fatima', 24, 'Maroc', '2019-03-27'), 
('Fatou', 22, 'Sénégal', '2019-04-01'), 
('Yuna', 38, 'Japon', '2019-06-13'), 
('Nina', 21, 'Italie', '2019-06-13'), 
('Bryan', 37, 'États-Unis', '2019-12-22'), 
('Anne-Claire', 47, 'France', '2019-12-23'), 
('Thomas', 17, 'France', '2020-01-05'), 
('Qiao', 16, 'Chine', '2020-01-05'), 
('Fujiko', 22, 'Japon', '2020-01-18');
