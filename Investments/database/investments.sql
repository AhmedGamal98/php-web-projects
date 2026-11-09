-- Cleaned copy of the original database dump.
-- Personal data (users, admins, contacts, messages, payments, medical data) was removed
-- before publishing. Table structure and reference data are kept.
-- After importing, add your own admin/user rows to log in.

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 01:49 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `investments`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_ID` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

-- (rows of `admin` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `status` enum('Accepted','Rejected','Pending','') NOT NULL DEFAULT 'Pending',
  `acceptance` int(11) NOT NULL DEFAULT '0',
  `read_activity` int(11) NOT NULL DEFAULT '0',
  `idea_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `status`, `acceptance`, `read_activity`, `idea_id`, `investor_id`, `creator_id`) VALUES
(27, 'Accepted', 1, 1, 12, 1212121213, 1234567890),
(28, 'Pending', 0, 0, 16, 1212121213, 1234567811),
(29, 'Accepted', 1, 1, 16, 1234567891, 1234567811);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Restaurant'),
(2, 'computer'),
(7, 'hh');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

-- (rows of `contact` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `creator`
--

CREATE TABLE `creator` (
  `nationalid` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Age` date NOT NULL,
  `Bio` text,
  `Gender` enum('Male','Female','','') NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PhoneNum` int(11) NOT NULL,
  `Type` enum('creator','investor','','') NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `bio_check` int(11) NOT NULL DEFAULT '0',
  `id_check` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creator`
--

-- (rows of `creator` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `ideas`
--

CREATE TABLE `ideas` (
  `ideas_ID` int(11) NOT NULL,
  `Budget` int(11) NOT NULL,
  `Current_investors` int(11) NOT NULL,
  `Status` enum('Completed','Pending','Expired','') NOT NULL,
  `image` longblob,
  `name` varchar(255) DEFAULT NULL,
  `idea_category_id` int(11) NOT NULL,
  `Raised_money` int(11) NOT NULL,
  `idea_description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `idea_tag_id` int(11) NOT NULL,
  `expiredDate` date NOT NULL,
  `creator_ID` int(11) NOT NULL,
  `Description_check` int(11) NOT NULL DEFAULT '0',
  `Current_Investors_check` int(11) NOT NULL DEFAULT '0',
  `Budget_Amount_ckeck` int(11) NOT NULL DEFAULT '0',
  `Raised_Amount_ckech` int(11) NOT NULL DEFAULT '0',
  `Status_check` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ideas`
--

-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- (rows of `ideas` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `Interest_ID` int(11) NOT NULL,
  `investor_ID` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`Interest_ID`, `investor_ID`, `category_id`, `tag_id`) VALUES
(1, 1212121212, 1, 1),
(6, 1212121213, 1, 1),
(7, 1298130862, 1, 1),
(8, 1298130862, 1, 1),
(22, 1420981243, 1, 1),
(29, 1420981243, 1, 1),
(30, 1420981243, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `investor`
--

CREATE TABLE `investor` (
  `nationalid` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Age` date NOT NULL,
  `Bio` text NOT NULL,
  `Gender` enum('Male','Femail','','') NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PhoneNum` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `type` enum('creator','investor','','') NOT NULL,
  `Budget` int(11) NOT NULL DEFAULT '0',
  `bio_check` int(11) NOT NULL DEFAULT '0',
  `budget_check` int(11) NOT NULL DEFAULT '0',
  `id_check` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investor`
--

-- (rows of `investor` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `Message_ID` int(11) NOT NULL,
  `Content` text NOT NULL,
  `date` date NOT NULL,
  `read_activity` int(11) NOT NULL DEFAULT '0',
  `creator_ID` int(11) DEFAULT NULL,
  `investor_ID` int(11) DEFAULT NULL,
  `opposer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

-- (rows of `messages` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `acceptance` int(11) NOT NULL DEFAULT '0',
  `read_activity` int(11) NOT NULL DEFAULT '0',
  `status` enum('Accepted','Rejected','Pending','') NOT NULL DEFAULT 'Pending',
  `part` varchar(255) DEFAULT NULL,
  `budget` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `idea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `acceptance`, `read_activity`, `status`, `part`, `budget`, `creator_id`, `investor_id`, `idea_id`) VALUES
(1, 1, 1, 'Accepted', 'Yes', 300, 1234567890, 1212121213, 12),
(2, 0, 0, 'Pending', 'Yes', 150, 1096534231, 1420981243, 20),
(3, 1, 1, 'Accepted', 'Yes', 120, 1342569876, 1230075123, 21),
(4, 1, 1, 'Accepted', 'Yes', 100, 1342569876, 1420981243, 21),
(5, 0, 0, 'Pending', 'Yes', 1200, 1342569876, 1420981243, 21);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`, `category_id`) VALUES
(1, 'El-Sayed Restaurant', 1),
(7, 'kk', 7),
(8, 'AI', 2),
(9, 'websites', 2),
(10, 'Android', 2),
(11, 'Flutters', 2),
(12, 'erdsf', 7),
(13, 'fgfdgdfg', 1),
(14, 'fdgfdgd', 1),
(15, 'rtetretr', 2),
(16, 'rtertretr', 1),
(17, 'ewwewwew', 1),
(18, 'eqwewqewe', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idea_id` (`idea_id`),
  ADD KEY `investor_id` (`investor_id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creator`
--
ALTER TABLE `creator`
  ADD PRIMARY KEY (`nationalid`);

--
-- Indexes for table `ideas`
--
ALTER TABLE `ideas`
  ADD PRIMARY KEY (`ideas_ID`),
  ADD KEY `creator_ID` (`creator_ID`),
  ADD KEY `idea_category_id` (`idea_category_id`),
  ADD KEY `idea_tag_id` (`idea_tag_id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`Interest_ID`),
  ADD KEY `interests_ibfk_1` (`investor_ID`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `investor`
--
ALTER TABLE `investor`
  ADD PRIMARY KEY (`nationalid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`Message_ID`),
  ADD KEY `creator_ID` (`creator_ID`),
  ADD KEY `investor_ID` (`investor_ID`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `investor_id` (`investor_id`),
  ADD KEY `idea_id` (`idea_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ideas`
--
ALTER TABLE `ideas`
  MODIFY `ideas_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `Interest_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `Message_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`ideas_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`investor_id`) REFERENCES `investor` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`creator_id`) REFERENCES `creator` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ideas`
--
ALTER TABLE `ideas`
  ADD CONSTRAINT `ideas_ibfk_1` FOREIGN KEY (`creator_ID`) REFERENCES `creator` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ideas_ibfk_2` FOREIGN KEY (`idea_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ideas_ibfk_3` FOREIGN KEY (`idea_tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`investor_ID`) REFERENCES `investor` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interests_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interests_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`creator_ID`) REFERENCES `creator` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`investor_ID`) REFERENCES `investor` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `creator` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`investor_id`) REFERENCES `investor` (`nationalid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`idea_id`) REFERENCES `ideas` (`ideas_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
