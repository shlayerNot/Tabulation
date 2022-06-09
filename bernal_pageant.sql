-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 11, 2018 at 04:50 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bernal_pageant`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
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

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE IF NOT EXISTS `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL,
  `type` enum('Mr','Ms','Mrs') NOT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `is_active` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `finalist` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `lname`, `fname`, `mi`, `type`, `number`, `is_active`, `finalist`) VALUES
(1, 'Rivera', 'Marian', 'C.', 'Ms', 1, 'Yes', 'No'),
(2, 'Pinto', 'Sam', 'F.', 'Ms', 2, 'Yes', 'No'),
(3, 'Aquino', 'Kris', 'C.', 'Ms', 3, 'Yes', 'No'),
(4, 'Gonzaga', 'Toni', '', 'Ms', 4, 'Yes', 'No'),
(5, 'Locsin', 'Angel', 'R.', 'Ms', 5, 'Yes', 'No'),
(6, 'Hermosa', 'Kristine', 'A.', 'Ms', 6, 'Yes', 'No'),
(7, 'Mendiola', 'Jessie', 'B.', 'Ms', 7, 'Yes', 'No'),
(8, 'Costanza', 'Crizzy', 'M.', 'Ms', 8, 'Yes', 'No'),
(9, 'Perry', 'Katty', 'O.', 'Ms', 9, 'Yes', 'No'),
(10, 'Williams', 'Hayley', 'B.', 'Ms', 10, 'Yes', 'No'),
(11, 'Milby', 'Sam', 'G.', 'Mr', 1, 'Yes', 'No'),
(12, 'Pascual', 'Piolo', 'L.', 'Mr', 2, 'Yes', 'No'),
(13, 'Paddilla', 'Daniel', 'K.', 'Mr', 3, 'Yes', 'No'),
(14, 'Anderson', 'Gerald', 'C.', 'Mr', 4, 'Yes', 'No'),
(15, 'Dee', 'Enchong', 'V.', 'Mr', 5, 'Yes', 'No'),
(16, 'Dantes', 'Ding Dong', 'M.', 'Mr', 6, 'Yes', 'No'),
(17, 'Olivares', 'Caezar', 'R.', 'Mr', 7, 'Yes', 'No'),
(18, 'Abunda', 'Boy', 'Y.', 'Mr', 8, 'Yes', 'No'),
(19, 'Navarro', 'Vhong', 'Q.', 'Mr', 9, 'Yes', 'No'),
(20, 'Crawford', 'Billy', 'W.', 'Mr', 10, 'Yes', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

DROP TABLE IF EXISTS `criteria`;
CREATE TABLE IF NOT EXISTS `criteria` (
  `name` varchar(200) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`name`, `percentage`, `sort`) VALUES
('Evening Gown And Formal Attire', 10, 4),
('Preliminary Question Answer', 5, 5),
('Production Performance', 50, 1),
('School Uniform', 20, 3),
('Sportswear', 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `event_name` varchar(200) NOT NULL,
  `tagline` text NOT NULL,
  `percentage_onOff` enum('Yes','No') NOT NULL DEFAULT 'No',
  `max_c_score` decimal(8,2) NOT NULL DEFAULT '10.00',
  `min_c_score` decimal(8,2) NOT NULL DEFAULT '5.00',
  `decimal_allowed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `topCandidates` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  PRIMARY KEY (`event_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_name`, `tagline`, `percentage_onOff`, `max_c_score`, `min_c_score`, `decimal_allowed`, `topCandidates`) VALUES
('Search for Mr. & Ms. Intrams 2018', '', 'Yes', '10.00', '5.00', 'Yes', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `final_criteria`
--

DROP TABLE IF EXISTS `final_criteria`;
CREATE TABLE IF NOT EXISTS `final_criteria` (
  `name` varchar(200) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `final_criteria`
--

INSERT INTO `final_criteria` (`name`, `percentage`, `sort`) VALUES
('Beauty/Masculinity', NULL, 1),
('Intelligence', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `final_score`
--

DROP TABLE IF EXISTS `final_score`;
CREATE TABLE IF NOT EXISTS `final_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `judge` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `criteria` (`criteria`),
  KEY `judge` (`judge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
CREATE TABLE IF NOT EXISTS `judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `judge`
--

INSERT INTO `judge` (`id`, `lname`, `fname`, `mi`) VALUES
(2, 'Raj', 'Venus', ''),
(4, 'Aquino', 'Ninoy', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE IF NOT EXISTS `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,3) NOT NULL,
  `judge` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `criteria` (`criteria`),
  KEY `judge` (`judge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

DROP TABLE IF EXISTS `sub_criteria`;
CREATE TABLE IF NOT EXISTS `sub_criteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `percentage` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `segment` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `segment` (`segment`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`id`, `name`, `percentage`, `sort`, `segment`) VALUES
(1, 'Beauty of the Face', 30, 1, 'Production Performance'),
(2, 'Poise And Bearing', 20, 2, 'Production Performance'),
(3, 'Stage Presence', 30, 3, 'Production Performance'),
(4, 'Overall Impact', 20, 4, 'Production Performance'),
(5, 'Beauty', 30, 1, 'Sportswear'),
(6, 'Poise & Bearing', 20, 2, 'Sportswear'),
(7, 'Stage Presence', 30, 3, 'Sportswear'),
(8, 'Originality', 10, 4, 'Sportswear'),
(9, 'Overall Impact', 10, 5, 'Sportswear'),
(10, 'Beauty of the Face', 30, 1, 'School Uniform'),
(11, 'Poise & Bearing', 20, 2, 'School Uniform'),
(12, 'Stage Presence', 30, 3, 'School Uniform'),
(13, 'Overall Impact', 20, 4, 'School Uniform'),
(14, 'Beauty of the Face', 30, 1, 'Evening Gown And Formal Attire'),
(15, 'Poise  & Bearing', 20, 2, 'Evening Gown And Formal Attire'),
(16, 'Stage Presence', 30, 3, 'Evening Gown And Formal Attire'),
(17, 'Overall Impact', 20, 4, 'Evening Gown And Formal Attire'),
(18, 'Beauty Of The Face', 50, 1, 'Preliminary Question Answer'),
(19, 'Intelligence', 50, 2, 'Preliminary Question Answer');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria_score`
--

DROP TABLE IF EXISTS `sub_criteria_score`;
CREATE TABLE IF NOT EXISTS `sub_criteria_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_criteria_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `judge_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcandidate`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vcandidate`;
CREATE TABLE IF NOT EXISTS `vcandidate` (
`id` int(11)
,`lname` varchar(100)
,`fname` varchar(100)
,`mi` char(2)
,`type` enum('Mr','Ms','Mrs')
,`number` int(11)
,`is_active` enum('Yes','No')
,`full_name` varchar(204)
,`finalist` enum('Yes','No')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vfinal_score`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vfinal_score`;
CREATE TABLE IF NOT EXISTS `vfinal_score` (
`id` int(11)
,`candidate_id` int(11)
,`criteria` varchar(200)
,`score` decimal(8,2)
,`judge` int(11)
,`c_full_name` varchar(204)
,`j_full_name` varchar(204)
,`c_id` int(11)
,`c_number` int(11)
,`c_type` enum('Mr','Ms','Mrs')
,`c_is_active` enum('Yes','No')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vscore`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vscore`;
CREATE TABLE IF NOT EXISTS `vscore` (
`sort` int(11)
,`id` int(11)
,`candidate_id` int(11)
,`criteria` varchar(200)
,`score` decimal(8,3)
,`judge` int(11)
,`c_is_active` enum('Yes','No')
,`candidate_full_name` varchar(204)
,`c_type` enum('Mr','Ms','Mrs')
,`c_number` int(11)
,`judge_full_name` varchar(202)
);

-- --------------------------------------------------------

--
-- Structure for view `vcandidate`
--
DROP TABLE IF EXISTS `vcandidate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcandidate`  AS  select `candidate`.`id` AS `id`,`candidate`.`lname` AS `lname`,`candidate`.`fname` AS `fname`,`candidate`.`mi` AS `mi`,`candidate`.`type` AS `type`,`candidate`.`number` AS `number`,`candidate`.`is_active` AS `is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `full_name`,`candidate`.`finalist` AS `finalist` from `candidate` ;

-- --------------------------------------------------------

--
-- Structure for view `vfinal_score`
--
DROP TABLE IF EXISTS `vfinal_score`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vfinal_score`  AS  select `final_score`.`id` AS `id`,`final_score`.`candidate_id` AS `candidate_id`,`final_score`.`criteria` AS `criteria`,`final_score`.`score` AS `score`,`final_score`.`judge` AS `judge`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `c_full_name`,concat(`judge`.`fname`,' ',`judge`.`mi`,' ',`judge`.`lname`) AS `j_full_name`,`candidate`.`id` AS `c_id`,`candidate`.`number` AS `c_number`,`candidate`.`type` AS `c_type`,`candidate`.`is_active` AS `c_is_active` from ((`final_score` join `candidate`) join `judge`) where ((`final_score`.`candidate_id` = `candidate`.`id`) and (`final_score`.`judge` = `judge`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vscore`
--
DROP TABLE IF EXISTS `vscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscore`  AS  select `criteria`.`sort` AS `sort`,`score`.`id` AS `id`,`score`.`candidate_id` AS `candidate_id`,`score`.`criteria` AS `criteria`,`score`.`score` AS `score`,`score`.`judge` AS `judge`,`candidate`.`is_active` AS `c_is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `candidate_full_name`,`candidate`.`type` AS `c_type`,`candidate`.`number` AS `c_number`,concat(`judge`.`lname`,', ',`judge`.`fname`) AS `judge_full_name` from (((`score` join `candidate`) join `criteria`) join `judge`) where ((`score`.`candidate_id` = `candidate`.`id`) and (`score`.`criteria` = `criteria`.`name`) and (`score`.`judge` = `judge`.`id`)) order by `criteria`.`sort` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `final_score`
--
ALTER TABLE `final_score`
  ADD CONSTRAINT `final_score_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `final_score_ibfk_2` FOREIGN KEY (`criteria`) REFERENCES `final_criteria` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `final_score_ibfk_3` FOREIGN KEY (`judge`) REFERENCES `judge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`judge`) REFERENCES `judge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `score_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`criteria`) REFERENCES `criteria` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD CONSTRAINT `sub_criteria_ibfk_1` FOREIGN KEY (`segment`) REFERENCES `criteria` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
