-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bn5yrsvbqm59q9xp2miq-mysql.services.clever-cloud.com:3306
-- Generation Time: Jun 13, 2023 at 08:08 AM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bn5yrsvbqm59q9xp2miq`
--

-- --------------------------------------------------------

--
-- Table structure for table `ARTICLE`
--

CREATE TABLE `ARTICLE` (
  `ID` int NOT NULL,
  `REF` varchar(13) NOT NULL,
  `DESIGNATION` varchar(255) NOT NULL,
  `PRIX` decimal(7,2) NOT NULL,
  `ID_FOU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ARTICLE`
--

INSERT INTO `ARTICLE` (`ID`, `REF`, `DESIGNATION`, `PRIX`, `ID_FOU`) VALUES
(1, 'A01', 'Perceuse P1', '74.99', 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', '2.25', 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4.45', 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', '4.40', 3),
(5, 'A02', 'Meuleuse 125mm', '37.85', 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', '1.80', 3),
(7, 'A03', 'Perceuse à colonne', '185.25', 1),
(8, 'D04', 'Coffret mêches à bois', '12.25', 3),
(9, 'F03', 'Coffret mêches plates', '6.25', 2),
(10, 'F04', 'Fraises d’encastrement', '8.14', 2);

-- --------------------------------------------------------

--
-- Table structure for table `BON`
--

CREATE TABLE `BON` (
  `ID` int NOT NULL,
  `NUMERO` int DEFAULT NULL,
  `DATE_CMDE` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DELAI` int DEFAULT NULL,
  `ID_FOU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BON`
--

INSERT INTO `BON` (`ID`, `NUMERO`, `DELAI`, `ID_FOU`) VALUES
(1, 1, 3, 1),
(2, 2, 5, 2),
(3, 3, 2, 3),
(4, 4, 2, 3),
(5, 5, 7, 2),
(6, 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `COMPO`
--

CREATE TABLE `COMPO` (
  `ID` int NOT NULL,
  `ID_ART` int DEFAULT NULL,
  `ID_BON` int DEFAULT NULL,
  `QTE` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COMPO`
--

INSERT INTO `COMPO` (`ID`, `ID_ART`, `ID_BON`, `QTE`) VALUES
(1, 1, 1, 3),
(2, 5, 1, 4),
(3, 7, 1, 1),
(4, 2, 2, 25),
(5, 3, 2, 15),
(6, 9, 2, 8),
(7, 10, 2, 11),
(8, 4, 3, 25),
(9, 6, 3, 40),
(10, 8, 3, 15),
(11, 4, 4, 10),
(12, 6, 4, 15),
(13, 8, 4, 8),
(14, 2, 5, 17),
(15, 3, 5, 13),
(16, 10, 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `FOURNISSEUR`
--

CREATE TABLE `FOURNISSEUR` (
  `ID` int NOT NULL,
  `NOM` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `FOURNISSEUR`
--

INSERT INTO `FOURNISSEUR` (`ID`, `NOM`) VALUES
(1, 'Française d\'Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils'),
(4, 'rotgrts'),
(5, 'rotgrts');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ARTICLE_FOU` (`ID_FOU`);

--
-- Indexes for table `BON`
--
ALTER TABLE `BON`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_BON_FOU` (`ID_FOU`);

--
-- Indexes for table `COMPO`
--
ALTER TABLE `COMPO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_COMPO_ART` (`ID_ART`),
  ADD KEY `FK_COMPO_BON` (`ID_BON`);

--
-- Indexes for table `FOURNISSEUR`
--
ALTER TABLE `FOURNISSEUR`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `BON`
--
ALTER TABLE `BON`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `COMPO`
--
ALTER TABLE `COMPO`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `FOURNISSEUR`
--
ALTER TABLE `FOURNISSEUR`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD CONSTRAINT `FK_ARTICLE_FOU` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Constraints for table `BON`
--
ALTER TABLE `BON`
  ADD CONSTRAINT `FK_BON_FOU` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Constraints for table `COMPO`
--
ALTER TABLE `COMPO`
  ADD CONSTRAINT `FK_COMPO_ART` FOREIGN KEY (`ID_ART`) REFERENCES `ARTICLE` (`ID`),
  ADD CONSTRAINT `FK_COMPO_BON` FOREIGN KEY (`ID_BON`) REFERENCES `BON` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
