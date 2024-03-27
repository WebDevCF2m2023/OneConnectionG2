-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 27 mars 2024 à 09:21
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `oneconnectiong2`
--
DROP DATABASE IF EXISTS `oneconnectiong2`;
CREATE DATABASE IF NOT EXISTS `oneconnectiong2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `oneconnectiong2`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ar_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ar_title` varchar(180) NOT NULL,
  `ar_text` text NOT NULL,
  `ar_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `ar_is_published` tinyint UNSIGNED NOT NULL,
  `user_us_id` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `fk_article_user1_idx` (`user_us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ar_id`, `ar_title`, `ar_text`, `ar_datetime`, `ar_is_published`, `user_us_id`) VALUES
(3, 'Apprendre le SQL', 'Le SQL (Structured Query Language) est un langage permettant de communiquer avec une base de données. Ce langage informatique est notamment très utilisé par les développeurs web pour communiquer avec les données d’un site web. SQL.sh recense des cours de SQL et des explications sur les principales commandes pour lire, insérer, modifier et supprimer des données dans une base.\r\n\r\nCours\r\n\r\nLes cours ont pour but d’apprendre les principales commandes SQL telles que: SELECT, INSERT INTO, UPDATE, DELETE, DROP TABLE… Chaque commande SQL est présentée par des exemples clairs et concis. Ces tutoriels peuvent vous aider à faire votre propre formation SQL.\r\n\r\nEn plus de la liste des commandes SQL, les cours présentes des fiches mnémotechniques présentant les fonctions SQL telles que AVG(), COUNT(), MAX() …\r\n\r\nSystème de gestion de base de données (SGBD)\r\n\r\nChaque SGBD possède ses propres spécificités et caractéristiques. Pour présenter ces différences, les logiciels de gestion de bases de données sont cités, tels que : MySQL, PostgreSQL, SQLite, Microsoft SQL Server ou encore Oracle.\r\n\r\nDes SGBD de type NoSQL sont également présentés, tel que Cassandra, Redis ou MongoDB.\r\n\r\n\r\nOptimisation\r\n\r\nSavoir effectuer des requêtes n’est pas trop difficile, mais il convient de véritablement comprendre comment fonctionne le stockage des données et la façon dont elles sont lues pour optimiser les performances. Les optimisations sont basées dans 2 catégories: les bons choix à faire lorsqu’il faut définir la structure de la base de données et les méthodes les plus adaptées pour lire les données.', '2024-03-19 10:55:18', 1, 1),
(4, 'SQL GROUP_CONCAT()', 'Dans le langage SQL, la fonction GROUP_CONCAT() permet de regrouper les valeurs non nulles d’un groupe en une chaîne de caractère. Cela est utile pour regrouper des résultats en une seule ligne autant d’avoir autant de ligne qu’il y a de résultat dans ce groupe.\r\n\r\nL’intérêt le plus flagrant de cette fonction consiste à concaténer les valeurs d’une colonne correspondant à une jointure avec une autre table. De cette manière, il n’est pas forcément nécessaire d’effectuer un traitement supplémentaire des résultats pour exploiter les valeurs.\r\n\r\nAttention : la fonction GROUP_CONCAT() est actuellement disponible que pour MySQL. Les autres Systèmes de Gestion de Base de Données (SGBD) tel que PostgreSQL, SQLite ou SQL Server n’intègrent pas cette fonctionnalité.', '2024-03-19 11:00:05', 1, NULL),
(5, 'SQL CONVERT() (PostgreSQL et Oracle)', 'La fonction SQL CONVERT() utilisé sous PostgreSQL ou Oracle permet de changer l’encodage d’une chaîne de caractère. La fonction permet par exemple de convertir un texte en UTF-8 en un texte Latin-1, c’est à dire en ISO-8859-1.\r\n\r\nAttention : la fonction CONVERT() utilisé dans les Systèmes de Gestion de Base de Données (SGBD) MySQL et SQL Server ne servent pas à la même chose. Dans ces SGBD, la fonction permet de convertir un type de données en un autre, par exemple pour convertir une donnée FLOAT en INTEGER.\r\n\r\nSyntaxe\r\n\r\nLa fonction s’utilise dans n’importe quelle requête SQL en respectant la syntaxe suivante :\r\n\r\nSELECT CONVERT( texte, encodage_source, encodage_fin);\r\n\r\nLe premier paramètre correspond à la chaîne de caractère à convertir, avec un type tel qu’un VARCHAR. Le deuxième paramètre correspond à l’encodage de cette chaîne de caractère. L’encodage doit correspondre pour que la fonction réalise le changement d’encodage convenablement. Le dernier paramètre correspond à l’encodage souhaité.\r\n\r\nImportant : les mots-clés à utiliser pour définir la source d’encodage sont défini dans les documentations officielles de PostgreSQL et de Oracle. Ces 2 système utilisent des mots-clés différents pour nommer les encodages.\r\n\r\nExemple\r\n\r\nLa requête ci-dessous est un exemple fictif pour convertir une chaîne de caractère sous PostgreSQL de l’encodate UTF-8 à un encodage Latin-1.\r\n\r\nSELECT CONVERT(\'texte en utf8\', \'UTF8\', \'LATIN1\');\r\n-- résultat : \'texte en utf-8\'\r\n\r\nCe résultat ne permet pas de constater visuellement d’une différence. Pour tester convenablement cette fonction il est possible de tester avec certains caractères spéciaux tels que les caractères accentués.', '2024-03-19 11:04:38', 1, 1),
(6, 'SQL CONVERT() (MySQL et SQL Server)', 'La fonction SQL CONVERT(), dans les systèmes MySQL et SQL Server, permet de convertir une donnée d’un type en un autre, de façon semblable à CAST(). La fonction permet par exemple de convertir une données de type FLOAT en INTEGER ou un DATE en DATETIME.\r\n\r\nAttention : avec les Système de Gestion de Base de Donnée (SGBD) PostgreSQL et Oracle, la fonction CONVERT() permet de convertir une chaîne de caractère d’un encodage en un autre, tel qu’une conversion de UTF-8 à Latin-1 (ISO-8859-1).\r\n\r\nSyntaxe\r\n\r\nMySQL\r\n\r\nLa fonction peut s’utiliser dans une requête SQL en respectant la syntaxe suivante :\r\n\r\nCONVERT(expression, type);\r\n\r\nLe paramètre “expression” correspond à la donnée qui doit subir le transtypage. Le type de données peut être BINARY, CHAR, DATE, DATETIME, INTEGER ou TIME.\r\n\r\nSQL Server\r\n\r\nLa même fonction s’utilise différemment avec SQL Server. La syntaxe est la suivante :\r\n\r\nCONVERT ( type, expression );\r\n\r\nLe paramètre “expression” correspond également à la donnée qui doit changer de type. Le type quand à lui peut contenir plus de possibilité, allant du type BINARY à TEXT, en passant par CHAR, VARCHAR, DATETIME, TIMESTAMP et bien d’autres.', '2024-03-19 11:05:44', 1, 1),
(7, 'Logiciels SQL', 'La conception d’un système qui va recourir à un Système de Gestion de Base de Données (SGBD) et donc qui devra utiliser le langage SQL nécessite parfois l’utilisation de logiciels pour concevoir un tel système grâce à des méthodes telles que UML ou Merise. Des logiciels peuvent aussi aider à gérer les données sans avoir à utiliser des lignes de commandes. Cette page recense des logiciels qui peuvent s’avérer utile lorsqu’on doit créer une interface liées à une base de données.\r\n\r\nLogiciels de modélisation ou de gestion des données\r\n\r\nAnalyseSI : conception et de modélisation des bases de données\r\n\r\nApache OpenJPA : solution de mapping objet-relationnel (ORM)\r\n\r\nDBDesigner : logiciel de conception de base de données sous forme graphique\r\n\r\nDevaki-nextobjects : modélisation de base de données avec la méthode Merise.\r\nDia : logiciel de création de diagramme\r\n\r\nHeidiSQL : outil d’administration de base de données développé et optimisé pour MySQL. Originalement développé sous le nom “MySQL-Front” le logiciel est devenu un projet libre en 2006\r\n\r\nJava Database Connectivity : interface de programmation permettant aux applications Java d’accéder, par le biais d’une interface commune, à des sources de données pour lesquelles il existe des pilotes JDBC\r\n\r\nJMerise : logiciel dédié à la modélisation des modèles conceptuels de données pour Merise\r\n\r\nKexi : interface graphique de contrôle des bases de données. Repose sur la bibliothèque SQLite, mais il est également possible de l’interfacer avec MySQL et PostgreSQL\r\n\r\nMocodo : programme qui génère des diagrammes entités-associations, ou Modèles Conceptuels de Données (MCD), ainsi que des schémas relationnels, ou Modèles Logiques de Données (MLD), et des tables SQL\r\n\r\nMPD Designer : programme de modélisation physique de données, permettant de générer les scripts SQL correspondant au MPD aussi bien pour MySQL 5.0 que pour SQL Server 2005 et Oracle 10g\r\n\r\nMySQL Community Server : version téléchargable de MySQL\r\nMySQL Workbench : logiciel de gestion et d’administration de bases de données \r\nMySQL\r\n\r\nMySQL-Front : outil d’administration de base de données développé et optimisé pour être utilisé avec MySQL\r\n\r\nOpen Database Connectivity : logiciel qui permet à une application informatique de manipuler plusieurs bases de données (même s’il s’agit de SGBD différents)\r\n\r\nOpen ModelSphere : outil de génie logiciel permettant la modélisation relationnelle de données, la modélisation des processus d’affaires, et la modélisation UML\r\n\r\nOracle SQL Developer : environnement de développement intégré (EDI) qui est un outil graphique permettant d’interroger des bases de données Oracle à l’aide du langage SQL\r\n\r\nOracle Warehouse Builder : outil décisionnel qui sert à créer des procédés d’extraction / transformation destinés à récupérer des données provenant de bases de données opérationnelles et les envoyer vers un datawarehouse\r\n\r\nPerl DBI : interface de programmation permettant de manipuler des base de données en langage de programmation Perl\r\npgModeler : logiciel de modélisation de base de données PostgreSQL\r\n\r\nPowerAMC : logiciel de conception et modélisation de base de données\r\n\r\nRRDtool : outil de gestion de base de données RRD (Round-Robin database)\r\n\r\nSequel Pro : logiciel de gestion d’applications utilisant MySQL, disponible sur Mac\r\n\r\nSQLAlchemy : toolkit open source SQL et outil de mapping objet-relationnel (ORM)\r\nSQL Developper Data Modeler : outil de modélisation de base de données Oracle\r\nToad (Tool for Oracle Application \r\nDevelopers) : logiciel permettant de consulter et d’administrer une base de données\r\nVisio : logiciel de diagrammes et de synoptique pour Windows\r\nWinDesign : outil de modélisation de systèmes d’information organisationnel et informatique\r\nApplication web\r\n\r\nAdminer : application web fournissant une interface graphique pour MySQL\r\nPhpMyAdmin : application web de gestion de base de données MySQL\r\n\r\nPhpPgAdmin : application web de gestion de base de données PostgreSQL\r\nFramework ou bibliothèque\r\nActiveX Data Objects : bibliothèque logicielle de Microsoft fournissant une interface d’accès aux données\r\n\r\nADOdb : bibliothèque d’abstraction destinée à communiquer avec différents SGBD\r\nHibernate : framework open source gérant la persistance des objets en base de données relationnelle\r\n\r\niBATIS : framework de persistance qui permet de mettre en correspondance des requêtes SQL et des instances d’objet\r\n\r\nPdoMap : bibliothèque permettant d’encapsuler les entités d’une base de données sous la forme d’objets\r\nDivers\r\n\r\nECPG : précompilateur permettant d’inclure des commandes SQL dans un source C\r\n\r\nOLE DB : API développée par Microsoft permettant l’accès aux données\r\n\r\nOracle Activity Report : logiciel informatique utilitaire servant à mesurer les performances d’une base de données \r\nOracle\r\n\r\nOracle Application Express : environnement de développement intégré (EDI) permettant de créer des applications web en développement rapide et dont le but est d’exploiter des bases de données Oracle\r\n\r\nPro*C : outil permettant d’inclure des commandes SQL dans un programme C\r\n\r\nXA : interface de communication entre un gestionnaire de ressource (par exemple une base SQL) et un gestionnaire de transaction\r\n\r\nXcalia Intermediation Core (XIC) : plate-forme d’intermédiation permettant à une entreprise d’accéder à l’ensemble de ses données, de déployer des Applications Métier, à partir de briques composites', '2024-03-19 11:08:56', 1, 2),
(8, 'Moteurs de stockage', 'Un moteur de stockage, aussi appelé moteur de table, est un ensemble d’algorithme qui permettent de stocker et d’accéder aux données dans un Système de Gestion de Base de Données (SGBD). En règle général, les SGBD utilisent chacun qu’un seul moteur de stockage qui est optimisé au mieux pour la lecture, l’écriture et la suppression de données.\r\n\r\nMySQL\r\n\r\nMySQL se démarque des autres SGBD car il propose libre choix à ses utilisateurs d’utiliser un moteur de table parmi plusieurs moteurs différents. Ces moteurs de stockage peuvent être transactionnel ou non-transactionnel.\r\n\r\nPrincipaux moteurs de stockage\r\nLes éléments ci-dessous présente une liste non-exhaustive des principaux moteurs de stockage :\r\n\r\nMyISAM\r\nInnoDB\r\nBDB (ou BerkeleyDB)\r\nArchive\r\nAria\r\nBLACKHOLE\r\nCSV\r\nFalcon\r\nFEDERATED\r\nInfiniDB\r\nMariaDB\r\nMEMORY\r\nTokuDB\r\n\r\nChacun de ces moteurs de table possèdent des caractéristiques propres qui peuvent être représenter des atouts ou des inconvénients selon le type d’application qui aura besoin d’une base de données.', '2024-03-19 11:10:03', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cg_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(50) NOT NULL,
  `cg_desc` varchar(600) DEFAULT NULL,
  `cg_visibility` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`cg_id`, `cg_name`, `cg_desc`, `cg_visibility`) VALUES
(2, 'MySQL', 'MySQL est un Système de Gestion de Base de Données (SGBD) parmi les plus populaires au monde. Il est distribué sous double licence, un licence publique générale GNU et une propriétaire selon l’utilisation qui en est faites. La première version de MySQL est apparue en 1995 et l’outil est régulièrement entretenu.', 1),
(3, 'PostgreSQL', 'PostgreSQL est un Système de Gestion de Base de Données (SBGD) libre disponible sous licence BSD. Ce système multi-plateforme est largement connu et réputé à travers le monde, notamment pour son comportement stable et pour être très respectueux des normes ANSI SQL. Ce projet libre n’est pas géré par une entreprise mais par une communauté de développeurs.', 1),
(4, 'MariaDB', 'MariaDB est un Système de Gestion de Base de Données (SGBD) disponible sous licence GPL. Ce système est un fork de MySQL, ce qui signifie que c’est un nouveau logiciel créé à partir du code source de MySQL.', 1),
(5, 'Microsoft SQL Server', 'Microsoft SQL Server, aussi appelé « SQL Server » ou parfois plus simplement « MSSQL », est un système de gestion de base de données relationnelle développé par Microsoft. Ce système est exclusivement disponible sur l’environnement Windows.', 0);

-- --------------------------------------------------------

--
-- Structure de la table `category_has_article`
--

DROP TABLE IF EXISTS `category_has_article`;
CREATE TABLE IF NOT EXISTS `category_has_article` (
  `category_cg_id` int UNSIGNED NOT NULL,
  `article_ar_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`category_cg_id`,`article_ar_id`),
  KEY `fk_category_has_article_article1_idx` (`article_ar_id`),
  KEY `fk_category_has_article_category_idx` (`category_cg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category_has_article`
--

INSERT INTO `category_has_article` (`category_cg_id`, `article_ar_id`) VALUES
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(2, 4),
(4, 4),
(3, 5),
(2, 6),
(4, 6),
(5, 6),
(2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `us_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `us_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `us_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'bin case sensitive',
  `us_email` varchar(150) DEFAULT NULL,
  `us_active` tinyint UNSIGNED DEFAULT NULL,
  `us_uniq_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_login_UNIQUE` (`us_login`),
  UNIQUE KEY `us_email_UNIQUE` (`us_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`us_id`, `us_login`, `us_pwd`, `us_email`, `us_active`, `us_uniq_id`) VALUES
(1, 'Mikhawa', '$2y$10$XJVEdejNpyWM6REHK/dx0.fmkA1x7UlT2c/H8OnTufwPrnCrYkbNe', 'mikhawa@cf2m.be', 1, '65f95ec2513c11.45254374'),
(2, 'PierreSandron', '$2y$10$IyydusecNWrqa8u.80OIt.gEQ8MldmSZaOXi0J8QhhkKuWlbLxsUW', 'PierreSandron@cf2m.be', 1, '65f95ee8531fe6.62715921'),
(3, 'Logan', '$2y$10$I91RM6Bpx4ny646ZfwFkleQf/UMF9g2fd.VEhUkXFmDc2X/syZhrq', 'logan@cf2m.be', 0, '6603e1d234b2e7.68808816');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_user1` FOREIGN KEY (`user_us_id`) REFERENCES `user` (`us_id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `category_has_article`
--
ALTER TABLE `category_has_article`
  ADD CONSTRAINT `fk_category_has_article_article1` FOREIGN KEY (`article_ar_id`) REFERENCES `article` (`ar_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_category_has_article_category` FOREIGN KEY (`category_cg_id`) REFERENCES `category` (`cg_id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
