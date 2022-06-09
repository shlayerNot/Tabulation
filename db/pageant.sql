-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2017 at 09:50 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pageant`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
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

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL,
  `type` enum('Mr','Ms','Mrs') NOT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `is_active` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `finalist` enum('Yes','No') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `name` varchar(200) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`name`, `percentage`, `sort`) VALUES
('Evening Gown & Modern Barong', 25, 5),
('Preliminary Q and A', 30, 3),
('Production Number', 10, 1),
('School Uniform', 10, 2),
('Sportswear', 25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_name` varchar(200) NOT NULL,
  `tagline` text NOT NULL,
  `percentage_onOff` enum('Yes','No') NOT NULL DEFAULT 'No',
  `max_c_score` decimal(8,2) NOT NULL DEFAULT '10.00',
  `min_c_score` decimal(8,2) NOT NULL DEFAULT '5.00',
  `decimal_allowed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `topCandidates` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_name`, `tagline`, `percentage_onOff`, `max_c_score`, `min_c_score`, `decimal_allowed`, `topCandidates`) VALUES
('Search for VBHS Mr. & Ms. Intrams 2017', 'Orayt', 'Yes', '10.00', '5.00', 'Yes', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `final_criteria`
--

CREATE TABLE `final_criteria` (
  `name` varchar(200) NOT NULL,
  `percentage` int(11) DEFAULT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `final_criteria`
--

INSERT INTO `final_criteria` (`name`, `percentage`, `sort`) VALUES
('Beauty of the face', NULL, 1),
('Intelligence', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `final_score`
--

CREATE TABLE `final_score` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `judge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `judge`
--

CREATE TABLE `judge` (
  `id` int(11) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `mi` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `judge`
--

INSERT INTO `judge` (`id`, `lname`, `fname`, `mi`) VALUES
(1, 'Cuadrante', 'Rosemarie', ''),
(2, 'Simbulan', 'Fergie', ''),
(3, 'Bagasala', 'Richard', ''),
(4, 'Armillos', 'Ruffa Mae', ''),
(5, 'Lusan', 'Rechyl', '');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,2) NOT NULL,
  `judge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcandidate`
--
CREATE TABLE `vcandidate` (
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
--
CREATE TABLE `vfinal_score` (
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
--
CREATE TABLE `vscore` (
`id` int(11)
,`candidate_id` int(11)
,`criteria` varchar(200)
,`score` decimal(8,2)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscore`  AS  select `score`.`id` AS `id`,`score`.`candidate_id` AS `candidate_id`,`score`.`criteria` AS `criteria`,`score`.`score` AS `score`,`score`.`judge` AS `judge`,`candidate`.`is_active` AS `c_is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `candidate_full_name`,`candidate`.`type` AS `c_type`,`candidate`.`number` AS `c_number`,concat(`judge`.`lname`,', ',`judge`.`fname`) AS `judge_full_name` from (((`score` join `candidate`) join `criteria`) join `judge`) where ((`score`.`candidate_id` = `candidate`.`id`) and (`score`.`criteria` = `criteria`.`name`) and (`score`.`judge` = `judge`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_name`);

--
-- Indexes for table `final_criteria`
--
ALTER TABLE `final_criteria`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `final_score`
--
ALTER TABLE `final_score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `criteria` (`criteria`),
  ADD KEY `judge` (`judge`);

--
-- Indexes for table `judge`
--
ALTER TABLE `judge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `criteria` (`criteria`),
  ADD KEY `judge` (`judge`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `final_score`
--
ALTER TABLE `final_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `judge`
--
ALTER TABLE `judge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1851;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
