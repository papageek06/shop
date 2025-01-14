-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 14 jan. 2025 à 12:20
-- Version du serveur : 9.1.0
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shop`
--
USE shop;
-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `message`) VALUES
(1, 'Samih', 'Habbani', 'samihhabbani@gmail.com', 'Ceci est mon message !');

-- --------------------------------------------------------

--
-- Structure de la table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sexe` enum('m','f') NOT NULL,
  `city` varchar(20) NOT NULL,
  `postal_code` int(5) UNSIGNED ZEROFILL NOT NULL,
  `address` varchar(50) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `member`
--

INSERT INTO `member` (`id`, `pseudo`, `password`, `last_name`, `first_name`, `email`, `sexe`, `city`, `postal_code`, `address`, `status`) VALUES
(6, 'samih', '$2y$10$Emwm0Vo6whxbY55zelx9NusexdCgr5yXuipACc2Y4zxtHEhzKd1Hi', 'Habbani', 'Samih', 'samihhabbani@gmail.com', 'm', 'Soissons', 02200, 'rue d\'edouard phillipe', 2),
(7, 'david', '$2y$10$bqrclhf5tUM6kNEeRGSDs.5tzhunNqfMeiWYKYO3X9DBXa86Idmv.', 'david', 'cohen', 'samihhabbani@gmail.com', 'm', 'paris', 75020, 'rue de l\'élysée', 2),
(8, 'admin', '$2y$10$kIAEVIcwU6Sni36nT2CPB.KOSB4EktWUrg63YY1lXzW/V6DHfChiK', 'Habbani', 'Samih', 'samihhabbani@gmail.com', 'm', 'Soissons', 02200, 'rue d\'edouard phillipe', 1),
(9, 'natalia', '$2y$10$CnLXhliw4tYzmBNUItu.V.DsUmmnI1Lr79zqNGAyLsoyDvp4HmpsS', 'Fabiano', 'Natalia', 'natalia@gmail.com', 'f', 'Houdan', 78550, '13 rue Saint-Mathieu', 2),
(12, 'rootfsdk', 'toto', 'mlijhuio', 'uhyubyuh', 'iuh@gail.com', 'm', 'uhiouh', 06110, 'uhiufhuinb', 0),
(15, 'root', '$2y$10$fjsgIBxCZwT7KISSrzaWvejoBvqe.Ql6VwAxIdesKlWBqyT8X9HJe', 'lkjhg', 'liuh', 'liuh@gmai.com', 'm', 'piuh', 06600, 'kuh', 0),
(18, 'marc', '$2y$10$A5do49.7AU9WlZ3tPf9xe.EFxYjpN0NYHtGE7.2ZxAcYlsZxr/JYu', 'marc', 'longmar', 'marc@gmail.com', 'm', 'cannes', 06110, '23 av du campon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `created_at` datetime NOT NULL,
  `state` enum('in progress','sent','delivered') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `member_id`, `amount`, `created_at`, `state`) VALUES
(4, 18, 686, '2025-01-13 10:06:12', 'sent'),
(5, 18, 735, '2025-01-13 10:17:04', 'in progress');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(4, 4, 6, 14, 49),
(5, 5, 6, 15, 49);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `color` varchar(20) NOT NULL,
  `size` varchar(5) NOT NULL,
  `public` enum('m','f','mixte') NOT NULL,
  `picture` varchar(250) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `reference`, `category`, `title`, `description`, `color`, `size`, `public`, `picture`, `price`, `stock`) VALUES
(2, '66-f-15', 'tshirt', 'Tshirt Col V rouge', 'c\'est vraiment un super tshirt en soirée !lol', 'rouge', 'S', 'm', 'red_t-shirt.png', 151, 21),
(3, '88-g-77', 'tshirt', 'Tshirt Col rond vert', 'Il vous faut ce tshirt Made In France !!!', 'vert', 'L', 'm', 'green_t-shirt.png', 29, 56),
(4, '55-b-38', 'tshirt', 'Tshirt jaune', 'le jaune reviens &agrave; la mode, non? :-)', 'jaune', 'S', 'm', 'yellow_t-shirt.png', 20, -4),
(5, '31-p-33', 'tshirt', 'Tshirt noir original', 'voici un tshirt noir tr&egrave;s original :p', 'noir', 'XL', 'm', 'black_t-shirt.png', 25, 73),
(6, '56-a-65', 'chemise', 'Chemise Blanche', 'Les chemises c\'est bien mieux que les tshirts', 'blanc', 'L', 'm', 'white_shirt.png', 49, 37),
(7, '63-s-63', 'chemise', 'Chemise Noir', 'Comme vous pouvez le voir c\'est une chemise noir...', 'noir', 'M', 'm', 'black_shirt.png', 59, 113),
(8, '77-p-79', 'pull', 'Pull gris', 'Pull gris pour l\'hiver', 'gris', 'XL', 'f', 'grey_pullover.png', 79, 92);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
