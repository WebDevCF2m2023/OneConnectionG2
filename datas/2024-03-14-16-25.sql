-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : jeu. 14 mars 2024 à 15:25
-- Version du serveur : 10.10.2-MariaDB
-- Version de PHP : 8.2.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `oneconnectiong2`
--
CREATE DATABASE IF NOT EXISTS `oneconnectiong2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oneconnectiong2`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ar_title` varchar(180) NOT NULL,
  `ar_text` text NOT NULL,
  `ar_datetime` datetime DEFAULT current_timestamp(),
  `ar_is_published` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ar_id`, `ar_title`, `ar_text`, `ar_datetime`, `ar_is_published`) VALUES
(1, 'test 1 test 1 test 1 test 1 ', 'test 1 test 1 test 1 test 1 test 1 test 1 test 1 test 1 test 1 test 1 ', '2024-03-14 16:14:41', 1),
(2, 'hj', 'dfggh', '2024-03-14 16:22:57', 2);

-- --------------------------------------------------------

--
-- Structure de la table `article_has_category`
--

DROP TABLE IF EXISTS `article_has_category`;
CREATE TABLE IF NOT EXISTS `article_has_category` (
  `ar_id_has` int(10) UNSIGNED NOT NULL,
  `cg_id_has` int(10) UNSIGNED NOT NULL,
  KEY `ar_id_has` (`ar_id_has`),
  KEY `cg_id_has` (`cg_id_has`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(50) NOT NULL,
  `cg_desc` varchar(600) DEFAULT NULL,
  `cg_visibility` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article_has_category`
--
ALTER TABLE `article_has_category`
  ADD CONSTRAINT `article_has_category_ibfk_1` FOREIGN KEY (`ar_id_has`) REFERENCES `article` (`ar_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `article_has_category_ibfk_2` FOREIGN KEY (`cg_id_has`) REFERENCES `category` (`cg_id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
