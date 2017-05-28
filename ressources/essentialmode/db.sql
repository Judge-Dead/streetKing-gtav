-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Sam 20 Mai 2017 à 21:24
-- Version du serveur :  5.6.35
-- Version de PHP :  5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
--

-- --------------------------------------------------------

--
-- Structure de la table `bans`
--

DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
`id` int(10) unsigned NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coordinates`
--

DROP TABLE IF EXISTS `coordinates`;
CREATE TABLE IF NOT EXISTS `coordinates` (
`id` int(11) unsigned NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) unsigned NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `limitation` varchar(255) NOT NULL,
  `isIllegal` tinyint(1) NOT NULL,
  `food` varchar(255) NOT NULL DEFAULT '0',
  `water` varchar(255) NOT NULL DEFAULT '0',
  `needs` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
`job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `loadouts`
--

DROP TABLE IF EXISTS `loadouts`;
CREATE TABLE IF NOT EXISTS `loadouts` (
  `identifier` varchar(256) NOT NULL COMMENT 'The player''s identifier',
  `loadout_name` varchar(256) NOT NULL COMMENT 'The loadout they currently have',
  `hair` int(11) NOT NULL,
  `haircolour` int(11) NOT NULL,
  `torso` int(11) NOT NULL,
  `torsotexture` int(11) NOT NULL,
  `torsoextra` int(11) NOT NULL,
  `torsoextratexture` int(11) NOT NULL,
  `pants` int(11) NOT NULL,
  `pantscolour` int(11) NOT NULL,
  `shoes` int(11) NOT NULL,
  `shoescolour` int(11) NOT NULL,
  `bodyaccessory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `outfits`
--

DROP TABLE IF EXISTS `outfits`;
CREATE TABLE IF NOT EXISTS `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

DROP TABLE IF EXISTS `police`;
CREATE TABLE IF NOT EXISTS `police` (
  `identifier` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL DEFAULT 'Recrue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `recolt`
--

DROP TABLE IF EXISTS `recolt`;
CREATE TABLE IF NOT EXISTS `recolt` (
`ID` int(11) unsigned NOT NULL,
  `raw_id` int(11) unsigned DEFAULT NULL,
  `treated_id` int(11) unsigned DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `treatment_id` int(10) unsigned DEFAULT NULL,
  `seller_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `personalvehicle` varchar(255) NOT NULL,
  `job` int(11) DEFAULT '1',
  `isFirstConnection` int(11) DEFAULT '1',
  `lastpos` varchar(255) DEFAULT '{-887.48388671875, -2311.68872070313,  -3.50776553153992, 142.503463745117}',
  `phone_number` int(255) DEFAULT NULL,
  `enService` tinyint(1) NOT NULL,
  `food` double NOT NULL DEFAULT '100',
  `water` double NOT NULL DEFAULT '100',
  `needs` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_contacts`
--

DROP TABLE IF EXISTS `user_contacts`;
CREATE TABLE IF NOT EXISTS `user_contacts` (
`id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_vehicle`
--

DROP TABLE IF EXISTS `user_vehicle`;
CREATE TABLE IF NOT EXISTS `user_vehicle` (
`ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) NOT NULL,
  `vehicle_wheelcolor` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

DROP TABLE IF EXISTS `user_weapons`;
CREATE TABLE IF NOT EXISTS `user_weapons` (
`ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
 ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `police`
--
ALTER TABLE `police`
 ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `recolt`
--
ALTER TABLE `recolt`
 ADD PRIMARY KEY (`ID`), ADD KEY `raw_id` (`raw_id`), ADD KEY `treated_id` (`treated_id`), ADD KEY `job_id` (`job_id`), ADD KEY `field_id` (`field_id`), ADD KEY `treatment_id` (`treatment_id`), ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
 ADD KEY `user_inventory_ibfk_2` (`item_id`);

--
-- Index pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
 ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bans`
--
ALTER TABLE `bans`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `coordinates`
--
ALTER TABLE `coordinates`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `recolt`
--
ALTER TABLE `recolt`
MODIFY `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `user_contacts`
--
ALTER TABLE `user_contacts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `recolt`
--
ALTER TABLE `recolt`
ADD CONSTRAINT `recolt_ibfk_1` FOREIGN KEY (`raw_id`) REFERENCES `items` (`id`),
ADD CONSTRAINT `recolt_ibfk_2` FOREIGN KEY (`treated_id`) REFERENCES `items` (`id`),
ADD CONSTRAINT `recolt_ibfk_3` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
ADD CONSTRAINT `recolt_ibfk_4` FOREIGN KEY (`field_id`) REFERENCES `coordinates` (`id`),
ADD CONSTRAINT `recolt_ibfk_5` FOREIGN KEY (`treatment_id`) REFERENCES `coordinates` (`id`),
ADD CONSTRAINT `recolt_ibfk_6` FOREIGN KEY (`seller_id`) REFERENCES `coordinates` (`id`);

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
