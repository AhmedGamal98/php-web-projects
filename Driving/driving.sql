-- Cleaned copy of the original database dump.
-- Personal data (users, admins, contacts, messages, payments, medical data) was removed
-- before publishing. Table structure and reference data are kept.
-- After importing, add your own admin/user rows to log in.

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2021 at 11:43 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `driving`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

-- (rows of `admin` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `assessing`
--

CREATE TABLE `assessing` (
  `assessingID` int(11) NOT NULL,
  `Assessing` int(11) NOT NULL,
  `Type` enum('Weekly','Definitive','','') NOT NULL,
  `traineeID` int(11) NOT NULL,
  `trainnerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `trainee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `participationID` int(11) NOT NULL,
  `acceptance` int(11) NOT NULL DEFAULT 0,
  `trainningID` int(11) NOT NULL,
  `traineeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participation`
--

INSERT INTO `participation` (`participationID`, `acceptance`, `trainningID`, `traineeID`) VALUES
(14, 0, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `Card_ID` int(11) NOT NULL,
  `End_Date` date NOT NULL,
  `CVV` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `trainee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

-- (rows of `payment` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `trainee`
--

CREATE TABLE `trainee` (
  `traineeID` int(11) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'trainee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainee`
--

-- (rows of `trainee` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `trainner`
--

CREATE TABLE `trainner` (
  `trainnerID` int(11) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `license_photo` longblob DEFAULT NULL,
  `CV` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'trainner',
  `acceptance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainner`
--

-- (rows of `trainner` removed: personal data)
-- --------------------------------------------------------

--
-- Table structure for table `trainner_assessing`
--

CREATE TABLE `trainner_assessing` (
  `assessing_id` int(11) NOT NULL,
  `assessing` int(11) NOT NULL,
  `trainner_id` int(11) NOT NULL,
  `trainee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trainning_schedule`
--

CREATE TABLE `trainning_schedule` (
  `trainningID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Starting_date` date NOT NULL,
  `Ending_date` date NOT NULL,
  `trainning_time` time NOT NULL,
  `Price` int(11) NOT NULL,
  `trainnerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainning_schedule`
--

INSERT INTO `trainning_schedule` (`trainningID`, `Name`, `Starting_date`, `Ending_date`, `trainning_time`, `Price`, `trainnerID`) VALUES
(4, 'Package 2', '2021-03-02', '2021-03-09', '05:01:00', 110, 4),
(5, 'Package 3', '2021-03-15', '2021-03-10', '16:22:00', 120, 4),
(6, 'Package 3', '2021-03-15', '2021-03-10', '16:22:00', 1200, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `assessing`
--
ALTER TABLE `assessing`
  ADD PRIMARY KEY (`assessingID`),
  ADD KEY `traineeID` (`traineeID`),
  ADD KEY `trainnerID` (`trainnerID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `trainee_id` (`trainee_id`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`participationID`),
  ADD KEY `traineeID` (`traineeID`),
  ADD KEY `trainningID` (`trainningID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`traineeID`);

--
-- Indexes for table `trainner`
--
ALTER TABLE `trainner`
  ADD PRIMARY KEY (`trainnerID`);

--
-- Indexes for table `trainner_assessing`
--
ALTER TABLE `trainner_assessing`
  ADD PRIMARY KEY (`assessing_id`),
  ADD KEY `trainee_id` (`trainee_id`),
  ADD KEY `trainner_id` (`trainner_id`);

--
-- Indexes for table `trainning_schedule`
--
ALTER TABLE `trainning_schedule`
  ADD PRIMARY KEY (`trainningID`),
  ADD KEY `trainnerID` (`trainnerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessing`
--
ALTER TABLE `assessing`
  MODIFY `assessingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `participation`
--
ALTER TABLE `participation`
  MODIFY `participationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trainee`
--
ALTER TABLE `trainee`
  MODIFY `traineeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trainner`
--
ALTER TABLE `trainner`
  MODIFY `trainnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `trainner_assessing`
--
ALTER TABLE `trainner_assessing`
  MODIFY `assessing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trainning_schedule`
--
ALTER TABLE `trainning_schedule`
  MODIFY `trainningID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessing`
--
ALTER TABLE `assessing`
  ADD CONSTRAINT `assessing_ibfk_1` FOREIGN KEY (`traineeID`) REFERENCES `trainee` (`traineeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assessing_ibfk_2` FOREIGN KEY (`trainnerID`) REFERENCES `trainner` (`trainnerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`traineeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`traineeID`) REFERENCES `trainee` (`traineeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`trainningID`) REFERENCES `trainning_schedule` (`trainningID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trainner_assessing`
--
ALTER TABLE `trainner_assessing`
  ADD CONSTRAINT `trainner_assessing_ibfk_1` FOREIGN KEY (`trainee_id`) REFERENCES `trainee` (`traineeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trainner_assessing_ibfk_2` FOREIGN KEY (`trainner_id`) REFERENCES `trainner` (`trainnerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trainning_schedule`
--
ALTER TABLE `trainning_schedule`
  ADD CONSTRAINT `trainning_schedule_ibfk_1` FOREIGN KEY (`trainnerID`) REFERENCES `trainner` (`trainnerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
