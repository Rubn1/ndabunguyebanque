-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 08:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banquekaneza`
--

-- --------------------------------------------------------

--
-- Table structure for table `agence`
--

CREATE TABLE `agence` (
  `idagence` varchar(20) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agence`
--

INSERT INTO `agence` (`idagence`, `nom`) VALUES
('01', 'Inyenyeri'),
('02', 'Zuba');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `idcat` varchar(5) NOT NULL,
  `libelle` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`idcat`, `libelle`) VALUES
('1', 'Ouverture'),
('2', 'Retrait'),
('3', 'Versement'),
('4', 'Desactiver');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `codeClient` varchar(20) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `preference` varchar(100) NOT NULL,
  `telpreference` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`codeClient`, `nom`, `prenom`, `tel`, `adresse`, `preference`, `telpreference`) VALUES
('01/01', 'Buntu', 'Carle', '75203569', 'Gihosha', 'Muco cynthia', '7896532'),
('01/02', 'Ntwari', 'Allan', '75896320', 'Mutanga Nord', 'Muco Cynthia', '78956302');

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `numero` varchar(15) NOT NULL,
  `codeClient` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `date_ouverture` date NOT NULL DEFAULT current_timestamp(),
  `solde` float NOT NULL,
  `etat` varchar(10) DEFAULT NULL,
  `agence` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`numero`, `codeClient`, `categorie`, `date_ouverture`, `solde`, `etat`, `agence`) VALUES
('co/01', '01/01', 'Epargne', '2024-10-15', 53000, 'Activé', 'Inyenyeri'),
('co/02', '01/02', 'Courant', '2024-10-15', 20000, 'Activé', 'Zuba');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `code` varchar(15) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fonction` varchar(20) NOT NULL,
  `agence` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`code`, `nom`, `prenom`, `tel`, `adresse`, `username`, `password`, `fonction`, `agence`) VALUES
('01/01', 'KANEZA', 'Christie Floria', '76520235', 'Gikungu', 'admin', '123456789', 'Admin', 'Inyenyeri'),
('01/02', 'Muco ', 'Isabelle', '78956242', 'Gihosha', 'isabelle', '123456789', 'Caissier', 'Inyenyeri');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `codeop` varchar(20) NOT NULL,
  `codeClient` varchar(20) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `idcat` varchar(5) NOT NULL,
  `code` varchar(15) NOT NULL,
  `dateop` date NOT NULL,
  `montant` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`codeop`, `codeClient`, `numero`, `idcat`, `code`, `dateop`, `montant`) VALUES
('01/01', '01/01', 'co/01', '1', '01/01', '2024-10-15', 53000),
('01/02', '01/02', 'co/02', '1', '01/01', '2024-10-15', 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`idagence`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcat`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`codeClient`);

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `codeClient` (`codeClient`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`codeop`),
  ADD KEY `codeClient` (`codeClient`),
  ADD KEY `numero` (`numero`),
  ADD KEY `idcat` (`idcat`),
  ADD KEY `code` (`code`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`codeClient`) REFERENCES `clients` (`codeClient`);

--
-- Constraints for table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`codeClient`) REFERENCES `clients` (`codeClient`),
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`numero`) REFERENCES `compte` (`numero`),
  ADD CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`idcat`) REFERENCES `categorie` (`idcat`),
  ADD CONSTRAINT `operation_ibfk_4` FOREIGN KEY (`code`) REFERENCES `employe` (`code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
