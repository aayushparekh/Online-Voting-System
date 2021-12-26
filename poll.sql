-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2021 at 04:15 PM
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
-- Database: `poll`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadministrators`
--

DROP TABLE IF EXISTS `tbadministrators`;
CREATE TABLE IF NOT EXISTS `tbadministrators` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbadministrators`
--

INSERT INTO `tbadministrators` (`admin_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Harshil', 'Patel', 'hp@example.com', '0000000000'),
(2, 'admin', 'admin', 'admin@example.com', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'test', 'test', 'test@gmail.com', 'test'),
(4, 'Aayush', 'Parekh', 'aayush@gmail.com', '0000000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbcandidates`
--

DROP TABLE IF EXISTS `tbcandidates`;
CREATE TABLE IF NOT EXISTS `tbcandidates` (
  `candidate_id` int(5) NOT NULL AUTO_INCREMENT,
  `candidate_name` varchar(45) NOT NULL,
  `candidate_position` varchar(45) NOT NULL,
  `candidate_cvotes` int(11) NOT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbcandidates`
--

INSERT INTO `tbcandidates` (`candidate_id`, `candidate_name`, `candidate_position`, `candidate_cvotes`) VALUES
(3, 'Luis Nani', 'Chairperson', 11),
(4, 'Wayne Rooney', 'Chairperson', 20),
(6, 'Thomas Vaemalen', 'Vice-Secretary', 2),
(8, 'Michael Walters', 'Secretary', 9),
(9, 'Roberto Mancini', 'Secretary', 46),
(10, 'Alex Ferguson', 'Treasurer', 0),
(11, 'Howard Web', 'Vice-Treasurer', 3),
(12, 'Richard Santana', 'Vice-Treasurer', 0),
(13, 'Kenny', 'Treasurer', 0),
(14, 'Danny Welbeck', 'Vice-Secretary', 0),
(15, 'Paul Allen', 'Organizing-Secretary', 4),
(16, 'Bill Gates', 'Organizing-Secretary', 4),
(17, 'Madhav', 'Vice-Chairperson', 31),
(18, 'Aayush', 'Vice-Chairperson', 14),
(19, 'Annie', 'HOD', 7),
(20, 'Jigna', 'HOD', 2),
(22, 'Harshil', 'HOD', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tblvotes`
--

DROP TABLE IF EXISTS `tblvotes`;
CREATE TABLE IF NOT EXISTS `tblvotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voter_id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL,
  `candidateName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voter_id` (`voter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvotes`
--

INSERT INTO `tblvotes` (`id`, `voter_id`, `position`, `candidateName`) VALUES
(1, 5, 'Chairperson', 'Luis Nani'),
(2, 5, 'Vice-Secretary', 'Thomas Vaemalen'),
(3, 5, 'Secretary', 'Michael Walters'),
(4, 5, 'Vice-Treasurer', 'Howard Web'),
(5, 5, 'HOD', 'Aman');

-- --------------------------------------------------------

--
-- Table structure for table `tbmembers`
--

DROP TABLE IF EXISTS `tbmembers`;
CREATE TABLE IF NOT EXISTS `tbmembers` (
  `member_id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbmembers`
--

INSERT INTO `tbmembers` (`member_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Aayush', 'Parekh', 'aayush@gmail.com', '0000000000'),
(2, 'Harshil', 'Patel', 'hp@gmail.com', '0000000000'),
(3, 'test', 'testt', 'test@example.com', '098f6bcd4621d373cade4e832627b4f6'),
(5, 'admin', 'admin', 'admin@example.com', '21232f297a57a5a743894a0e4a801fc3'),
(6, 'nobody', 'nobody', 'nobody@gmail.com', 'nobody'),
(7, 'Henry', 'Henry', 'henry@henry.com', 'f1b708bba17f1ce948dc979f4d7092bc');

-- --------------------------------------------------------

--
-- Table structure for table `tbpositions`
--

DROP TABLE IF EXISTS `tbpositions`;
CREATE TABLE IF NOT EXISTS `tbpositions` (
  `position_id` int(5) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(45) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbpositions`
--

INSERT INTO `tbpositions` (`position_id`, `position_name`) VALUES
(1, 'Chairperson'),
(2, 'Secretary'),
(5, 'Vice-Secretary'),
(7, 'Organizing-Secretary'),
(8, 'Treasurer'),
(9, 'Vice-Treasurer'),
(10, 'Vice-Chairperson'),
(11, 'HOD');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblvotes`
--
ALTER TABLE `tblvotes`
  ADD CONSTRAINT `tblvotes_ibfk_1` FOREIGN KEY (`voter_id`) REFERENCES `tbmembers` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
