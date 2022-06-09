-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2014 at 04:15 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pageant`
--
CREATE DATABASE IF NOT EXISTS `pageant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pageant`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE IF NOT EXISTS `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL,
  `type` enum('Mr','Ms','Mrs') NOT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `is_active` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `lname`, `fname`, `mi`, `type`, `number`, `is_active`) VALUES
(1, 'Rivera', 'Marian', 'C.', 'Ms', 1, 'Yes'),
(2, 'Pinto', 'Sam', 'F.', 'Ms', 2, 'Yes'),
(3, 'Aquino', 'Kris', 'C.', 'Ms', 3, 'Yes'),
(4, 'Gonzaga', 'Toni', '', 'Ms', 4, 'Yes'),
(5, 'Locsin', 'Angel', 'R.', 'Ms', 5, 'Yes'),
(6, 'Hermosa', 'Kristine', 'A.', 'Ms', 6, 'Yes'),
(7, 'Mendiola', 'Jessie', 'B.', 'Ms', 7, 'Yes'),
(8, 'Costanza', 'Crizzy', 'M.', 'Ms', 8, 'Yes'),
(9, 'Perry', 'Katty', 'O.', 'Ms', 9, 'Yes'),
(10, 'Williams', 'Hayley', 'B.', 'Ms', 10, 'Yes'),
(11, 'Milby', 'Sam', 'G.', 'Mr', 1, 'Yes'),
(12, 'Pascual', 'Piolo', 'L.', 'Mr', 2, 'Yes'),
(13, 'Paddilla', 'Daniel', 'K.', 'Mr', 3, 'Yes'),
(14, 'Anderson', 'Gerald', 'C.', 'Mr', 4, 'Yes'),
(15, 'Dee', 'Enchong', 'V.', 'Mr', 5, 'Yes'),
(16, 'Dantes', 'Ding Dong', 'M.', 'Mr', 6, 'Yes'),
(17, 'Olivares', 'Caezar', 'R.', 'Mr', 7, 'Yes'),
(18, 'Abunda', 'Boy', 'Y.', 'Mr', 8, 'Yes'),
(19, 'Navarro', 'Vhong', 'Q.', 'Mr', 9, 'Yes'),
(20, 'Crawford', 'Billy', 'W.', 'Mr', 10, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE IF NOT EXISTS `criteria` (
  `name` varchar(200) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`name`, `percentage`) VALUES
('Beach Wear', NULL),
('Intelligence', NULL),
('Long Gown/Barong Tagalog', NULL),
('Production Performance', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_name` varchar(200) NOT NULL,
  `tagline` text NOT NULL,
  `percentage_onOff` enum('Yes','No') NOT NULL DEFAULT 'No',
  `max_c_score` int(11) NOT NULL DEFAULT '10',
  `min_c_score` int(11) NOT NULL DEFAULT '5',
  `decimal_allowed` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`event_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_name`, `tagline`, `percentage_onOff`, `max_c_score`, `min_c_score`, `decimal_allowed`) VALUES
('Search for Mr. & Ms. Intrams 2014', '', 'Yes', 10, 5, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `judge`
--

CREATE TABLE IF NOT EXISTS `judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `judge`
--

INSERT INTO `judge` (`id`, `lname`, `fname`, `mi`) VALUES
(1, 'Supsup', 'Shamcey', ''),
(2, 'Raj', 'Venus', '');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `judge` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `criteria` (`criteria`),
  KEY `judge` (`judge`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `candidate_id`, `criteria`, `score`, `judge`) VALUES
(1, 1, 'Beach Wear', '5.00', 2),
(2, 2, 'Beach Wear', '5.00', 2),
(3, 3, 'Beach Wear', '5.00', 2),
(4, 4, 'Beach Wear', '5.00', 2),
(5, 5, 'Beach Wear', '5.00', 2),
(6, 6, 'Beach Wear', '5.00', 2),
(7, 7, 'Beach Wear', '5.00', 2),
(8, 8, 'Beach Wear', '5.00', 2),
(9, 9, 'Beach Wear', '5.00', 2),
(10, 10, 'Beach Wear', '5.00', 2),
(11, 11, 'Beach Wear', '5.00', 2),
(12, 12, 'Beach Wear', '5.00', 2),
(13, 13, 'Beach Wear', '5.00', 2),
(14, 14, 'Beach Wear', '5.00', 2),
(15, 15, 'Beach Wear', '5.00', 2),
(16, 16, 'Beach Wear', '5.00', 2),
(17, 17, 'Beach Wear', '5.00', 2),
(18, 18, 'Beach Wear', '5.00', 2),
(19, 19, 'Beach Wear', '5.00', 2),
(20, 20, 'Beach Wear', '5.00', 2),
(21, 1, 'Beach Wear', '10.00', 1),
(22, 2, 'Beach Wear', '9.00', 1),
(23, 3, 'Beach Wear', '10.00', 1),
(24, 4, 'Beach Wear', '9.00', 1),
(25, 5, 'Beach Wear', '5.00', 1),
(26, 6, 'Beach Wear', '5.00', 1),
(27, 7, 'Beach Wear', '5.00', 1),
(28, 8, 'Beach Wear', '5.00', 1),
(29, 9, 'Beach Wear', '5.00', 1),
(30, 10, 'Beach Wear', '5.00', 1),
(31, 11, 'Beach Wear', '9.00', 1),
(32, 12, 'Beach Wear', '8.00', 1),
(33, 13, 'Beach Wear', '9.00', 1),
(34, 14, 'Beach Wear', '8.00', 1),
(35, 15, 'Beach Wear', '8.00', 1),
(36, 16, 'Beach Wear', '9.00', 1),
(37, 17, 'Beach Wear', '9.00', 1),
(38, 18, 'Beach Wear', '9.00', 1),
(39, 19, 'Beach Wear', '9.00', 1),
(40, 20, 'Beach Wear', '8.00', 1),
(41, 1, 'Intelligence', '5.00', 2),
(42, 2, 'Intelligence', '9.00', 2),
(43, 3, 'Intelligence', '5.00', 2),
(44, 4, 'Intelligence', '9.00', 2),
(45, 5, 'Intelligence', '5.00', 2),
(46, 6, 'Intelligence', '9.00', 2),
(47, 7, 'Intelligence', '5.00', 2),
(48, 8, 'Intelligence', '9.00', 2),
(49, 9, 'Intelligence', '5.00', 2),
(50, 10, 'Intelligence', '5.00', 2),
(51, 11, 'Intelligence', '5.00', 2),
(52, 12, 'Intelligence', '5.00', 2),
(53, 13, 'Intelligence', '5.00', 2),
(54, 14, 'Intelligence', '5.00', 2),
(55, 15, 'Intelligence', '5.00', 2),
(56, 16, 'Intelligence', '5.00', 2),
(57, 17, 'Intelligence', '5.00', 2),
(58, 18, 'Intelligence', '5.00', 2),
(59, 19, 'Intelligence', '5.00', 2),
(60, 20, 'Intelligence', '5.00', 2),
(61, 1, 'Intelligence', '5.00', 1),
(62, 2, 'Intelligence', '5.00', 1),
(63, 3, 'Intelligence', '5.00', 1),
(64, 4, 'Intelligence', '5.00', 1),
(65, 5, 'Intelligence', '5.00', 1),
(66, 6, 'Intelligence', '9.00', 1),
(67, 7, 'Intelligence', '9.00', 1),
(68, 8, 'Intelligence', '5.00', 1),
(69, 9, 'Intelligence', '5.00', 1),
(70, 10, 'Intelligence', '5.00', 1),
(71, 11, 'Intelligence', '5.00', 1),
(72, 12, 'Intelligence', '5.00', 1),
(73, 13, 'Intelligence', '8.00', 1),
(74, 14, 'Intelligence', '6.00', 1),
(75, 15, 'Intelligence', '5.00', 1),
(76, 16, 'Intelligence', '5.00', 1),
(77, 17, 'Intelligence', '5.00', 1),
(78, 18, 'Intelligence', '5.00', 1),
(79, 19, 'Intelligence', '5.00', 1),
(80, 20, 'Intelligence', '5.00', 1),
(81, 1, 'Production Performance', '5.00', 1),
(82, 2, 'Production Performance', '5.00', 1),
(83, 3, 'Production Performance', '5.00', 1),
(84, 4, 'Production Performance', '5.00', 1),
(85, 5, 'Production Performance', '5.00', 1),
(86, 6, 'Production Performance', '5.00', 1),
(87, 7, 'Production Performance', '5.00', 1),
(88, 8, 'Production Performance', '5.00', 1),
(89, 9, 'Production Performance', '5.00', 1),
(90, 10, 'Production Performance', '5.00', 1),
(91, 11, 'Production Performance', '5.00', 1),
(92, 12, 'Production Performance', '5.00', 1),
(93, 13, 'Production Performance', '9.00', 1),
(94, 14, 'Production Performance', '5.00', 1),
(95, 15, 'Production Performance', '8.00', 1),
(96, 16, 'Production Performance', '5.00', 1),
(97, 17, 'Production Performance', '5.00', 1),
(98, 18, 'Production Performance', '5.00', 1),
(99, 19, 'Production Performance', '5.00', 1),
(100, 20, 'Production Performance', '5.00', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcandidate`
--
CREATE TABLE IF NOT EXISTS `vcandidate` (
`id` int(11)
,`lname` varchar(100)
,`fname` varchar(100)
,`mi` char(2)
,`type` enum('Mr','Ms','Mrs')
,`number` int(11)
,`is_active` enum('Yes','No')
,`full_name` varchar(204)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vscore`
--
CREATE TABLE IF NOT EXISTS `vscore` (
`id` int(11)
,`candidate_id` int(11)
,`criteria` varchar(200)
,`score` decimal(8,2)
,`judge` int(11)
,`candidate_full_name` varchar(202)
,`c_type` enum('Mr','Ms','Mrs')
,`judge_full_name` varchar(202)
);
-- --------------------------------------------------------

--
-- Structure for view `vcandidate`
--
DROP TABLE IF EXISTS `vcandidate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcandidate` AS select `candidate`.`id` AS `id`,`candidate`.`lname` AS `lname`,`candidate`.`fname` AS `fname`,`candidate`.`mi` AS `mi`,`candidate`.`type` AS `type`,`candidate`.`number` AS `number`,`candidate`.`is_active` AS `is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `full_name` from `candidate`;

-- --------------------------------------------------------

--
-- Structure for view `vscore`
--
DROP TABLE IF EXISTS `vscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscore` AS select `score`.`id` AS `id`,`score`.`candidate_id` AS `candidate_id`,`score`.`criteria` AS `criteria`,`score`.`score` AS `score`,`score`.`judge` AS `judge`,concat(`candidate`.`lname`,', ',`candidate`.`fname`) AS `candidate_full_name`,`candidate`.`type` AS `c_type`,concat(`judge`.`lname`,', ',`judge`.`fname`) AS `judge_full_name` from (((`score` join `candidate`) join `criteria`) join `judge`) where ((`score`.`candidate_id` = `candidate`.`id`) and (`score`.`criteria` = `criteria`.`name`) and (`score`.`judge` = `judge`.`id`));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`judge`) REFERENCES `judge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`criteria`) REFERENCES `criteria` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
