-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2021 at 03:54 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deneme`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `sp_get_planets`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_planets` ()  BEGIN
  SELECT id, name, color,num_of_moons,mass,rings FROM planets;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ogrenci`
--

DROP TABLE IF EXISTS `ogrenci`;
CREATE TABLE IF NOT EXISTS `ogrenci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_dogum` date NOT NULL,
  `sinif` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ogrenci`
--

INSERT INTO `ogrenci` (`id`, `ad`, `soyad`, `t_dogum`, `sinif`) VALUES
(1, 'Eyüp', 'Çetinkaya', '2016-10-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
CREATE TABLE IF NOT EXISTS `planets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `color` text COLLATE utf8mb4_unicode_ci,
  `num_of_moons` int(11) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `rings` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `planets`
--

INSERT INTO `planets` (`id`, `name`, `color`, `num_of_moons`, `mass`, `rings`) VALUES
(1, 'Mercury', 'gray', 0, 0.55, 0),
(2, 'Venus', 'yellow', 0, 0.82, 0),
(3, 'Earth', 'blue', 1, 1, 0),
(4, 'Mars', 'red', 2, 0.11, 0),
(5, 'Jupiter', 'orange', 53, 317.9, 0),
(6, 'Saturn', 'hazel', 62, 95.19, 1),
(7, 'Uranus', 'lightblue', 27, 14.54, 1),
(8, 'Neptune', 'darkblue', 14, 17.15, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
