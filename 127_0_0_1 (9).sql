-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2014 at 12:31 AM
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
  `finalist` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `lname`, `fname`, `mi`, `type`, `number`, `is_active`, `finalist`) VALUES
(1, 'Rivera', 'Marian', 'C.', 'Ms', 1, 'Yes', 'Yes'),
(2, 'Pinto', 'Sam', 'F.', 'Ms', 2, 'Yes', 'No'),
(3, 'Aquino', 'Kris', 'C.', 'Ms', 3, 'Yes', 'Yes'),
(4, 'Gonzaga', 'Toni', '', 'Ms', 4, 'Yes', 'No'),
(5, 'Locsin', 'Angel', 'R.', 'Ms', 5, 'Yes', 'No'),
(6, 'Hermosa', 'Kristine', 'A.', 'Ms', 6, 'Yes', 'No'),
(7, 'Mendiola', 'Jessie', 'B.', 'Ms', 7, 'Yes', 'No'),
(8, 'Costanza', 'Crizzy', 'M.', 'Ms', 8, 'Yes', 'Yes'),
(9, 'Perry', 'Katty', 'O.', 'Ms', 9, 'Yes', 'Yes'),
(10, 'Williams', 'Hayley', 'B.', 'Ms', 10, 'Yes', 'Yes'),
(11, 'Milby', 'Sam', 'G.', 'Mr', 1, 'Yes', 'Yes'),
(12, 'Pascual', 'Piolo', 'L.', 'Mr', 2, 'Yes', 'Yes'),
(13, 'Paddilla', 'Daniel', 'K.', 'Mr', 3, 'Yes', 'Yes'),
(14, 'Anderson', 'Gerald', 'C.', 'Mr', 4, 'Yes', 'No'),
(15, 'Dee', 'Enchong', 'V.', 'Mr', 5, 'Yes', 'No'),
(16, 'Dantes', 'Ding Dong', 'M.', 'Mr', 6, 'Yes', 'No'),
(17, 'Olivares', 'Caezar', 'R.', 'Mr', 7, 'Yes', 'No'),
(18, 'Abunda', 'Boy', 'Y.', 'Mr', 8, 'Yes', 'No'),
(19, 'Navarro', 'Vhong', 'Q.', 'Mr', 9, 'Yes', 'Yes'),
(20, 'Crawford', 'Billy', 'W.', 'Mr', 10, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

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
('Beach Wear', NULL, 2),
('Beauty of the Face and Figure', NULL, 4),
('Intelligence', NULL, 5),
('Long Gown/ Barong Tagalog', NULL, 3),
('Production Performance', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

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
('Search for Mr. & Ms. Intrams 2014', '', 'Yes', '10.00', '5.00', 'Yes', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `final_criteria`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=165 ;

--
-- Dumping data for table `final_score`
--

INSERT INTO `final_score` (`id`, `candidate_id`, `criteria`, `score`, `judge`) VALUES
(25, 11, 'Beauty/Masculinity', '9.50', 2),
(26, 11, 'Intelligence', '9.50', 2),
(27, 12, 'Beauty/Masculinity', '9.00', 2),
(28, 12, 'Intelligence', '9.00', 2),
(29, 13, 'Beauty/Masculinity', '9.00', 2),
(30, 13, 'Intelligence', '8.50', 2),
(31, 19, 'Beauty/Masculinity', '9.50', 2),
(32, 19, 'Intelligence', '9.00', 2),
(33, 20, 'Beauty/Masculinity', '10.00', 2),
(34, 20, 'Intelligence', '9.00', 2),
(35, 1, 'Beauty/Masculinity', '9.00', 2),
(36, 1, 'Intelligence', '8.50', 2),
(37, 3, 'Beauty/Masculinity', '9.00', 2),
(38, 3, 'Intelligence', '9.50', 2),
(39, 8, 'Beauty/Masculinity', '8.50', 2),
(40, 8, 'Intelligence', '9.00', 2),
(41, 9, 'Beauty/Masculinity', '9.00', 2),
(42, 9, 'Intelligence', '9.00', 2),
(43, 10, 'Beauty/Masculinity', '9.50', 2),
(44, 10, 'Intelligence', '9.50', 2),
(45, 11, 'Beauty/Masculinity', '9.00', 4),
(46, 11, 'Intelligence', '8.50', 4),
(47, 12, 'Beauty/Masculinity', '9.50', 4),
(48, 12, 'Intelligence', '9.50', 4),
(49, 13, 'Beauty/Masculinity', '8.50', 4),
(50, 13, 'Intelligence', '8.00', 4),
(51, 19, 'Beauty/Masculinity', '8.00', 4),
(52, 19, 'Intelligence', '7.50', 4),
(53, 20, 'Beauty/Masculinity', '8.00', 4),
(54, 20, 'Intelligence', '8.50', 4),
(55, 1, 'Beauty/Masculinity', '8.50', 4),
(56, 1, 'Intelligence', '8.00', 4),
(57, 3, 'Beauty/Masculinity', '8.50', 4),
(58, 3, 'Intelligence', '8.00', 4),
(59, 8, 'Beauty/Masculinity', '9.00', 4),
(60, 8, 'Intelligence', '7.50', 4),
(61, 9, 'Beauty/Masculinity', '8.00', 4),
(62, 9, 'Intelligence', '9.50', 4),
(63, 10, 'Beauty/Masculinity', '9.50', 4),
(64, 10, 'Intelligence', '8.50', 4),
(105, 11, 'Beauty/Masculinity', '8.00', 3),
(106, 11, 'Intelligence', '10.00', 3),
(107, 12, 'Beauty/Masculinity', '8.50', 3),
(108, 12, 'Intelligence', '7.50', 3),
(109, 13, 'Beauty/Masculinity', '9.00', 3),
(110, 13, 'Intelligence', '8.50', 3),
(111, 19, 'Beauty/Masculinity', '9.00', 3),
(112, 19, 'Intelligence', '9.50', 3),
(113, 20, 'Beauty/Masculinity', '10.00', 3),
(114, 20, 'Intelligence', '9.00', 3),
(115, 1, 'Beauty/Masculinity', '8.00', 3),
(116, 1, 'Intelligence', '8.00', 3),
(117, 3, 'Beauty/Masculinity', '9.00', 3),
(118, 3, 'Intelligence', '9.50', 3),
(119, 8, 'Beauty/Masculinity', '8.50', 3),
(120, 8, 'Intelligence', '8.00', 3),
(121, 9, 'Beauty/Masculinity', '9.50', 3),
(122, 9, 'Intelligence', '8.50', 3),
(123, 10, 'Beauty/Masculinity', '9.50', 3),
(124, 10, 'Intelligence', '7.50', 3),
(125, 11, 'Beauty/Masculinity', '8.50', 1),
(126, 11, 'Intelligence', '7.50', 1),
(127, 12, 'Beauty/Masculinity', '9.00', 1),
(128, 12, 'Intelligence', '8.50', 1),
(129, 13, 'Beauty/Masculinity', '9.50', 1),
(130, 13, 'Intelligence', '9.00', 1),
(131, 19, 'Beauty/Masculinity', '9.00', 1),
(132, 19, 'Intelligence', '9.50', 1),
(133, 20, 'Beauty/Masculinity', '9.00', 1),
(134, 20, 'Intelligence', '8.50', 1),
(135, 1, 'Beauty/Masculinity', '10.00', 1),
(136, 1, 'Intelligence', '10.00', 1),
(137, 3, 'Beauty/Masculinity', '8.00', 1),
(138, 3, 'Intelligence', '9.50', 1),
(139, 8, 'Beauty/Masculinity', '9.50', 1),
(140, 8, 'Intelligence', '8.50', 1),
(141, 9, 'Beauty/Masculinity', '9.00', 1),
(142, 9, 'Intelligence', '9.00', 1),
(143, 10, 'Beauty/Masculinity', '10.00', 1),
(144, 10, 'Intelligence', '8.50', 1),
(145, 11, 'Beauty/Masculinity', '9.00', 6),
(146, 11, 'Intelligence', '9.00', 6),
(147, 12, 'Beauty/Masculinity', '9.50', 6),
(148, 12, 'Intelligence', '9.00', 6),
(149, 13, 'Beauty/Masculinity', '9.50', 6),
(150, 13, 'Intelligence', '9.00', 6),
(151, 19, 'Beauty/Masculinity', '9.50', 6),
(152, 19, 'Intelligence', '9.50', 6),
(153, 20, 'Beauty/Masculinity', '9.00', 6),
(154, 20, 'Intelligence', '9.00', 6),
(155, 1, 'Beauty/Masculinity', '9.50', 6),
(156, 1, 'Intelligence', '9.00', 6),
(157, 3, 'Beauty/Masculinity', '9.50', 6),
(158, 3, 'Intelligence', '9.00', 6),
(159, 8, 'Beauty/Masculinity', '9.50', 6),
(160, 8, 'Intelligence', '9.00', 6),
(161, 9, 'Beauty/Masculinity', '9.00', 6),
(162, 9, 'Intelligence', '9.00', 6),
(163, 10, 'Beauty/Masculinity', '9.50', 6),
(164, 10, 'Intelligence', '9.50', 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `judge`
--

INSERT INTO `judge` (`id`, `lname`, `fname`, `mi`) VALUES
(1, 'Supsup', 'Shamcey', ''),
(2, 'Raj', 'Venus', ''),
(3, 'Salonga', 'Lea', ''),
(4, 'Aquino', 'Ninoy', 'C'),
(6, 'asdf', 'asdf', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1341 ;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `candidate_id`, `criteria`, `score`, `judge`) VALUES
(801, 11, 'Beach Wear', '8.50', 2),
(802, 12, 'Beach Wear', '9.00', 2),
(803, 13, 'Beach Wear', '8.50', 2),
(804, 14, 'Beach Wear', '9.50', 2),
(805, 15, 'Beach Wear', '10.00', 2),
(806, 16, 'Beach Wear', '8.50', 2),
(807, 17, 'Beach Wear', '8.00', 2),
(808, 18, 'Beach Wear', '7.50', 2),
(809, 19, 'Beach Wear', '7.00', 2),
(810, 20, 'Beach Wear', '7.50', 2),
(811, 1, 'Beach Wear', '9.00', 2),
(812, 2, 'Beach Wear', '8.50', 2),
(813, 3, 'Beach Wear', '8.00', 2),
(814, 4, 'Beach Wear', '8.50', 2),
(815, 5, 'Beach Wear', '9.50', 2),
(816, 6, 'Beach Wear', '9.00', 2),
(817, 7, 'Beach Wear', '10.00', 2),
(818, 8, 'Beach Wear', '9.50', 2),
(819, 9, 'Beach Wear', '9.00', 2),
(820, 10, 'Beach Wear', '8.50', 2),
(821, 11, 'Intelligence', '9.50', 2),
(822, 12, 'Intelligence', '9.00', 2),
(823, 13, 'Intelligence', '8.50', 2),
(824, 14, 'Intelligence', '9.00', 2),
(825, 15, 'Intelligence', '9.50', 2),
(826, 16, 'Intelligence', '10.00', 2),
(827, 17, 'Intelligence', '9.50', 2),
(828, 18, 'Intelligence', '9.00', 2),
(829, 19, 'Intelligence', '8.50', 2),
(830, 20, 'Intelligence', '9.00', 2),
(831, 1, 'Intelligence', '7.50', 2),
(832, 2, 'Intelligence', '7.50', 2),
(833, 3, 'Intelligence', '7.00', 2),
(834, 4, 'Intelligence', '8.00', 2),
(835, 5, 'Intelligence', '9.00', 2),
(836, 6, 'Intelligence', '8.00', 2),
(837, 7, 'Intelligence', '9.00', 2),
(838, 8, 'Intelligence', '9.00', 2),
(839, 9, 'Intelligence', '9.00', 2),
(840, 10, 'Intelligence', '10.00', 2),
(841, 11, 'Production Performance', '8.00', 2),
(842, 12, 'Production Performance', '9.00', 2),
(843, 13, 'Production Performance', '8.50', 2),
(844, 14, 'Production Performance', '8.50', 2),
(845, 15, 'Production Performance', '8.00', 2),
(846, 16, 'Production Performance', '9.00', 2),
(847, 17, 'Production Performance', '7.50', 2),
(848, 18, 'Production Performance', '10.00', 2),
(849, 19, 'Production Performance', '9.50', 2),
(850, 20, 'Production Performance', '10.00', 2),
(851, 1, 'Production Performance', '10.00', 2),
(852, 2, 'Production Performance', '9.50', 2),
(853, 3, 'Production Performance', '9.00', 2),
(854, 4, 'Production Performance', '8.00', 2),
(855, 5, 'Production Performance', '9.00', 2),
(856, 6, 'Production Performance', '9.50', 2),
(857, 7, 'Production Performance', '8.50', 2),
(858, 8, 'Production Performance', '9.00', 2),
(859, 9, 'Production Performance', '8.50', 2),
(860, 10, 'Production Performance', '9.50', 2),
(861, 11, 'Long Gown/ Barong Tagalog', '9.50', 2),
(862, 12, 'Long Gown/ Barong Tagalog', '9.50', 2),
(863, 13, 'Long Gown/ Barong Tagalog', '9.00', 2),
(864, 14, 'Long Gown/ Barong Tagalog', '9.50', 2),
(865, 15, 'Long Gown/ Barong Tagalog', '8.50', 2),
(866, 16, 'Long Gown/ Barong Tagalog', '9.00', 2),
(867, 17, 'Long Gown/ Barong Tagalog', '8.00', 2),
(868, 18, 'Long Gown/ Barong Tagalog', '8.00', 2),
(869, 19, 'Long Gown/ Barong Tagalog', '8.50', 2),
(870, 20, 'Long Gown/ Barong Tagalog', '8.50', 2),
(871, 1, 'Long Gown/ Barong Tagalog', '9.50', 2),
(872, 2, 'Long Gown/ Barong Tagalog', '8.50', 2),
(873, 3, 'Long Gown/ Barong Tagalog', '9.00', 2),
(874, 4, 'Long Gown/ Barong Tagalog', '7.50', 2),
(875, 5, 'Long Gown/ Barong Tagalog', '8.00', 2),
(876, 6, 'Long Gown/ Barong Tagalog', '8.00', 2),
(877, 7, 'Long Gown/ Barong Tagalog', '7.50', 2),
(878, 8, 'Long Gown/ Barong Tagalog', '8.50', 2),
(879, 9, 'Long Gown/ Barong Tagalog', '8.00', 2),
(880, 10, 'Long Gown/ Barong Tagalog', '7.50', 2),
(881, 11, 'Beach Wear', '8.50', 1),
(882, 12, 'Beach Wear', '9.00', 1),
(883, 13, 'Beach Wear', '9.50', 1),
(884, 14, 'Beach Wear', '8.50', 1),
(885, 15, 'Beach Wear', '9.00', 1),
(886, 16, 'Beach Wear', '8.50', 1),
(887, 17, 'Beach Wear', '8.00', 1),
(888, 18, 'Beach Wear', '7.50', 1),
(889, 19, 'Beach Wear', '8.50', 1),
(890, 20, 'Beach Wear', '10.00', 1),
(891, 1, 'Beach Wear', '8.50', 1),
(892, 2, 'Beach Wear', '9.50', 1),
(893, 3, 'Beach Wear', '8.50', 1),
(894, 4, 'Beach Wear', '10.00', 1),
(895, 5, 'Beach Wear', '9.00', 1),
(896, 6, 'Beach Wear', '8.50', 1),
(897, 7, 'Beach Wear', '9.50', 1),
(898, 8, 'Beach Wear', '10.00', 1),
(899, 9, 'Beach Wear', '9.50', 1),
(900, 10, 'Beach Wear', '9.50', 1),
(901, 11, 'Intelligence', '8.50', 1),
(902, 12, 'Intelligence', '9.50', 1),
(903, 13, 'Intelligence', '8.50', 1),
(904, 14, 'Intelligence', '9.00', 1),
(905, 15, 'Intelligence', '8.00', 1),
(906, 16, 'Intelligence', '8.00', 1),
(907, 17, 'Intelligence', '7.00', 1),
(908, 18, 'Intelligence', '8.00', 1),
(909, 19, 'Intelligence', '7.50', 1),
(910, 20, 'Intelligence', '9.50', 1),
(911, 1, 'Intelligence', '10.00', 1),
(912, 2, 'Intelligence', '9.50', 1),
(913, 3, 'Intelligence', '10.00', 1),
(914, 4, 'Intelligence', '9.00', 1),
(915, 5, 'Intelligence', '8.50', 1),
(916, 6, 'Intelligence', '8.50', 1),
(917, 7, 'Intelligence', '9.00', 1),
(918, 8, 'Intelligence', '9.50', 1),
(919, 9, 'Intelligence', '9.00', 1),
(920, 10, 'Intelligence', '10.00', 1),
(921, 11, 'Long Gown/ Barong Tagalog', '10.00', 1),
(922, 12, 'Long Gown/ Barong Tagalog', '9.00', 1),
(923, 13, 'Long Gown/ Barong Tagalog', '9.50', 1),
(924, 14, 'Long Gown/ Barong Tagalog', '9.00', 1),
(925, 15, 'Long Gown/ Barong Tagalog', '8.50', 1),
(926, 16, 'Long Gown/ Barong Tagalog', '8.00', 1),
(927, 17, 'Long Gown/ Barong Tagalog', '7.50', 1),
(928, 18, 'Long Gown/ Barong Tagalog', '8.00', 1),
(929, 19, 'Long Gown/ Barong Tagalog', '8.50', 1),
(930, 20, 'Long Gown/ Barong Tagalog', '8.50', 1),
(931, 1, 'Long Gown/ Barong Tagalog', '8.00', 1),
(932, 2, 'Long Gown/ Barong Tagalog', '9.50', 1),
(933, 3, 'Long Gown/ Barong Tagalog', '9.00', 1),
(934, 4, 'Long Gown/ Barong Tagalog', '8.50', 1),
(935, 5, 'Long Gown/ Barong Tagalog', '10.00', 1),
(936, 6, 'Long Gown/ Barong Tagalog', '10.00', 1),
(937, 7, 'Long Gown/ Barong Tagalog', '9.50', 1),
(938, 8, 'Long Gown/ Barong Tagalog', '9.50', 1),
(939, 9, 'Long Gown/ Barong Tagalog', '9.00', 1),
(940, 10, 'Long Gown/ Barong Tagalog', '9.50', 1),
(941, 11, 'Production Performance', '10.00', 1),
(942, 12, 'Production Performance', '9.50', 1),
(943, 13, 'Production Performance', '10.00', 1),
(944, 14, 'Production Performance', '9.00', 1),
(945, 15, 'Production Performance', '8.50', 1),
(946, 16, 'Production Performance', '9.00', 1),
(947, 17, 'Production Performance', '10.00', 1),
(948, 18, 'Production Performance', '9.00', 1),
(949, 19, 'Production Performance', '9.50', 1),
(950, 20, 'Production Performance', '8.00', 1),
(951, 1, 'Production Performance', '7.50', 1),
(952, 2, 'Production Performance', '8.50', 1),
(953, 3, 'Production Performance', '8.00', 1),
(954, 4, 'Production Performance', '7.50', 1),
(955, 5, 'Production Performance', '7.00', 1),
(956, 6, 'Production Performance', '7.50', 1),
(957, 7, 'Production Performance', '8.50', 1),
(958, 8, 'Production Performance', '8.00', 1),
(959, 9, 'Production Performance', '9.00', 1),
(960, 10, 'Production Performance', '8.00', 1),
(961, 11, 'Beach Wear', '9.50', 3),
(962, 12, 'Beach Wear', '9.00', 3),
(963, 13, 'Beach Wear', '8.50', 3),
(964, 14, 'Beach Wear', '8.50', 3),
(965, 15, 'Beach Wear', '9.00', 3),
(966, 16, 'Beach Wear', '8.00', 3),
(967, 17, 'Beach Wear', '8.50', 3),
(968, 18, 'Beach Wear', '8.00', 3),
(969, 19, 'Beach Wear', '9.00', 3),
(970, 20, 'Beach Wear', '9.50', 3),
(971, 1, 'Beach Wear', '9.50', 3),
(972, 2, 'Beach Wear', '8.50', 3),
(973, 3, 'Beach Wear', '8.00', 3),
(974, 4, 'Beach Wear', '7.00', 3),
(975, 5, 'Beach Wear', '8.00', 3),
(976, 6, 'Beach Wear', '7.50', 3),
(977, 7, 'Beach Wear', '7.50', 3),
(978, 8, 'Beach Wear', '8.00', 3),
(979, 9, 'Beach Wear', '9.00', 3),
(980, 10, 'Beach Wear', '8.50', 3),
(981, 11, 'Intelligence', '9.00', 3),
(982, 12, 'Intelligence', '8.50', 3),
(983, 13, 'Intelligence', '8.50', 3),
(984, 14, 'Intelligence', '9.00', 3),
(985, 15, 'Intelligence', '9.50', 3),
(986, 16, 'Intelligence', '10.00', 3),
(987, 17, 'Intelligence', '8.00', 3),
(988, 18, 'Intelligence', '9.00', 3),
(989, 19, 'Intelligence', '10.00', 3),
(990, 20, 'Intelligence', '8.00', 3),
(991, 1, 'Intelligence', '10.00', 3),
(992, 2, 'Intelligence', '9.00', 3),
(993, 3, 'Intelligence', '10.00', 3),
(994, 4, 'Intelligence', '9.00', 3),
(995, 5, 'Intelligence', '8.50', 3),
(996, 6, 'Intelligence', '9.50', 3),
(997, 7, 'Intelligence', '8.00', 3),
(998, 8, 'Intelligence', '9.00', 3),
(999, 9, 'Intelligence', '8.50', 3),
(1000, 10, 'Intelligence', '8.00', 3),
(1001, 11, 'Production Performance', '10.00', 3),
(1002, 12, 'Production Performance', '9.50', 3),
(1003, 13, 'Production Performance', '9.50', 3),
(1004, 14, 'Production Performance', '8.50', 3),
(1005, 15, 'Production Performance', '8.50', 3),
(1006, 16, 'Production Performance', '8.00', 3),
(1007, 17, 'Production Performance', '7.00', 3),
(1008, 18, 'Production Performance', '9.00', 3),
(1009, 19, 'Production Performance', '8.00', 3),
(1010, 20, 'Production Performance', '9.50', 3),
(1011, 1, 'Production Performance', '8.50', 3),
(1012, 2, 'Production Performance', '7.50', 3),
(1013, 3, 'Production Performance', '10.00', 3),
(1014, 4, 'Production Performance', '9.50', 3),
(1015, 5, 'Production Performance', '9.00', 3),
(1016, 6, 'Production Performance', '8.50', 3),
(1017, 7, 'Production Performance', '9.50', 3),
(1018, 8, 'Production Performance', '8.50', 3),
(1019, 9, 'Production Performance', '9.50', 3),
(1020, 10, 'Production Performance', '10.00', 3),
(1021, 11, 'Long Gown/ Barong Tagalog', '8.50', 3),
(1022, 12, 'Long Gown/ Barong Tagalog', '8.00', 3),
(1023, 13, 'Long Gown/ Barong Tagalog', '10.00', 3),
(1024, 14, 'Long Gown/ Barong Tagalog', '7.50', 3),
(1025, 15, 'Long Gown/ Barong Tagalog', '9.50', 3),
(1026, 16, 'Long Gown/ Barong Tagalog', '10.00', 3),
(1027, 17, 'Long Gown/ Barong Tagalog', '8.50', 3),
(1028, 18, 'Long Gown/ Barong Tagalog', '9.00', 3),
(1029, 19, 'Long Gown/ Barong Tagalog', '7.50', 3),
(1030, 20, 'Long Gown/ Barong Tagalog', '6.50', 3),
(1031, 1, 'Long Gown/ Barong Tagalog', '10.00', 3),
(1032, 2, 'Long Gown/ Barong Tagalog', '9.00', 3),
(1033, 3, 'Long Gown/ Barong Tagalog', '9.00', 3),
(1034, 4, 'Long Gown/ Barong Tagalog', '8.00', 3),
(1035, 5, 'Long Gown/ Barong Tagalog', '9.50', 3),
(1036, 6, 'Long Gown/ Barong Tagalog', '7.00', 3),
(1037, 7, 'Long Gown/ Barong Tagalog', '10.00', 3),
(1038, 8, 'Long Gown/ Barong Tagalog', '8.50', 3),
(1039, 9, 'Long Gown/ Barong Tagalog', '9.00', 3),
(1040, 10, 'Long Gown/ Barong Tagalog', '7.50', 3),
(1041, 11, 'Beauty of the Face and Figure', '8.50', 3),
(1042, 12, 'Beauty of the Face and Figure', '8.00', 3),
(1043, 13, 'Beauty of the Face and Figure', '9.50', 3),
(1044, 14, 'Beauty of the Face and Figure', '7.50', 3),
(1045, 15, 'Beauty of the Face and Figure', '8.50', 3),
(1046, 16, 'Beauty of the Face and Figure', '10.00', 3),
(1047, 17, 'Beauty of the Face and Figure', '7.50', 3),
(1048, 18, 'Beauty of the Face and Figure', '9.00', 3),
(1049, 19, 'Beauty of the Face and Figure', '8.50', 3),
(1050, 20, 'Beauty of the Face and Figure', '7.00', 3),
(1051, 1, 'Beauty of the Face and Figure', '8.00', 3),
(1052, 2, 'Beauty of the Face and Figure', '7.00', 3),
(1053, 3, 'Beauty of the Face and Figure', '10.00', 3),
(1054, 4, 'Beauty of the Face and Figure', '8.00', 3),
(1055, 5, 'Beauty of the Face and Figure', '9.00', 3),
(1056, 6, 'Beauty of the Face and Figure', '8.50', 3),
(1057, 7, 'Beauty of the Face and Figure', '7.50', 3),
(1058, 8, 'Beauty of the Face and Figure', '9.00', 3),
(1059, 9, 'Beauty of the Face and Figure', '8.50', 3),
(1060, 10, 'Beauty of the Face and Figure', '9.50', 3),
(1061, 11, 'Beauty of the Face and Figure', '8.00', 2),
(1062, 12, 'Beauty of the Face and Figure', '8.50', 2),
(1063, 13, 'Beauty of the Face and Figure', '7.00', 2),
(1064, 14, 'Beauty of the Face and Figure', '8.00', 2),
(1065, 15, 'Beauty of the Face and Figure', '7.00', 2),
(1066, 16, 'Beauty of the Face and Figure', '9.00', 2),
(1067, 17, 'Beauty of the Face and Figure', '8.50', 2),
(1068, 18, 'Beauty of the Face and Figure', '9.50', 2),
(1069, 19, 'Beauty of the Face and Figure', '10.00', 2),
(1070, 20, 'Beauty of the Face and Figure', '8.50', 2),
(1071, 1, 'Beauty of the Face and Figure', '10.00', 2),
(1072, 2, 'Beauty of the Face and Figure', '9.00', 2),
(1073, 3, 'Beauty of the Face and Figure', '8.00', 2),
(1074, 4, 'Beauty of the Face and Figure', '9.00', 2),
(1075, 5, 'Beauty of the Face and Figure', '7.00', 2),
(1076, 6, 'Beauty of the Face and Figure', '9.50', 2),
(1077, 7, 'Beauty of the Face and Figure', '9.00', 2),
(1078, 8, 'Beauty of the Face and Figure', '10.00', 2),
(1079, 9, 'Beauty of the Face and Figure', '8.50', 2),
(1080, 10, 'Beauty of the Face and Figure', '9.50', 2),
(1101, 11, 'Beauty of the Face and Figure', '7.50', 1),
(1102, 12, 'Beauty of the Face and Figure', '10.00', 1),
(1103, 13, 'Beauty of the Face and Figure', '8.50', 1),
(1104, 14, 'Beauty of the Face and Figure', '9.00', 1),
(1105, 15, 'Beauty of the Face and Figure', '9.50', 1),
(1106, 16, 'Beauty of the Face and Figure', '8.00', 1),
(1107, 17, 'Beauty of the Face and Figure', '9.00', 1),
(1108, 18, 'Beauty of the Face and Figure', '8.00', 1),
(1109, 19, 'Beauty of the Face and Figure', '9.00', 1),
(1110, 20, 'Beauty of the Face and Figure', '8.50', 1),
(1111, 1, 'Beauty of the Face and Figure', '9.50', 1),
(1112, 2, 'Beauty of the Face and Figure', '8.50', 1),
(1113, 3, 'Beauty of the Face and Figure', '10.00', 1),
(1114, 4, 'Beauty of the Face and Figure', '9.50', 1),
(1115, 5, 'Beauty of the Face and Figure', '8.50', 1),
(1116, 6, 'Beauty of the Face and Figure', '9.50', 1),
(1117, 7, 'Beauty of the Face and Figure', '9.00', 1),
(1118, 8, 'Beauty of the Face and Figure', '8.00', 1),
(1119, 9, 'Beauty of the Face and Figure', '9.50', 1),
(1120, 10, 'Beauty of the Face and Figure', '9.00', 1),
(1121, 11, 'Beach Wear', '9.50', 4),
(1122, 12, 'Beach Wear', '10.00', 4),
(1123, 13, 'Beach Wear', '8.50', 4),
(1124, 14, 'Beach Wear', '8.00', 4),
(1125, 15, 'Beach Wear', '9.00', 4),
(1126, 16, 'Beach Wear', '5.00', 4),
(1127, 17, 'Beach Wear', '8.00', 4),
(1128, 18, 'Beach Wear', '8.50', 4),
(1129, 19, 'Beach Wear', '8.50', 4),
(1130, 20, 'Beach Wear', '10.00', 4),
(1131, 1, 'Beach Wear', '8.50', 4),
(1132, 2, 'Beach Wear', '9.50', 4),
(1133, 3, 'Beach Wear', '9.00', 4),
(1134, 4, 'Beach Wear', '9.50', 4),
(1135, 5, 'Beach Wear', '8.50', 4),
(1136, 6, 'Beach Wear', '9.00', 4),
(1137, 7, 'Beach Wear', '8.00', 4),
(1138, 8, 'Beach Wear', '9.00', 4),
(1139, 9, 'Beach Wear', '9.50', 4),
(1140, 10, 'Beach Wear', '8.50', 4),
(1141, 11, 'Beauty of the Face and Figure', '10.00', 4),
(1142, 12, 'Beauty of the Face and Figure', '9.00', 4),
(1143, 13, 'Beauty of the Face and Figure', '9.50', 4),
(1144, 14, 'Beauty of the Face and Figure', '9.00', 4),
(1145, 15, 'Beauty of the Face and Figure', '7.50', 4),
(1146, 16, 'Beauty of the Face and Figure', '8.50', 4),
(1147, 17, 'Beauty of the Face and Figure', '8.00', 4),
(1148, 18, 'Beauty of the Face and Figure', '8.50', 4),
(1149, 19, 'Beauty of the Face and Figure', '9.00', 4),
(1150, 20, 'Beauty of the Face and Figure', '10.00', 4),
(1151, 1, 'Beauty of the Face and Figure', '9.50', 4),
(1152, 2, 'Beauty of the Face and Figure', '9.00', 4),
(1153, 3, 'Beauty of the Face and Figure', '8.50', 4),
(1154, 4, 'Beauty of the Face and Figure', '8.00', 4),
(1155, 5, 'Beauty of the Face and Figure', '9.00', 4),
(1156, 6, 'Beauty of the Face and Figure', '10.00', 4),
(1157, 7, 'Beauty of the Face and Figure', '9.00', 4),
(1158, 8, 'Beauty of the Face and Figure', '9.50', 4),
(1159, 9, 'Beauty of the Face and Figure', '9.50', 4),
(1160, 10, 'Beauty of the Face and Figure', '9.00', 4),
(1161, 11, 'Intelligence', '8.50', 4),
(1162, 12, 'Intelligence', '9.00', 4),
(1163, 13, 'Intelligence', '9.50', 4),
(1164, 14, 'Intelligence', '10.00', 4),
(1165, 15, 'Intelligence', '9.50', 4),
(1166, 16, 'Intelligence', '9.00', 4),
(1167, 17, 'Intelligence', '8.50', 4),
(1168, 18, 'Intelligence', '8.50', 4),
(1169, 19, 'Intelligence', '10.00', 4),
(1170, 20, 'Intelligence', '9.00', 4),
(1171, 1, 'Intelligence', '7.50', 4),
(1172, 2, 'Intelligence', '9.00', 4),
(1173, 3, 'Intelligence', '8.50', 4),
(1174, 4, 'Intelligence', '10.00', 4),
(1175, 5, 'Intelligence', '9.50', 4),
(1176, 6, 'Intelligence', '8.50', 4),
(1177, 7, 'Intelligence', '9.00', 4),
(1178, 8, 'Intelligence', '10.00', 4),
(1179, 9, 'Intelligence', '8.00', 4),
(1180, 10, 'Intelligence', '8.50', 4),
(1181, 11, 'Long Gown/ Barong Tagalog', '9.00', 4),
(1182, 12, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1183, 13, 'Long Gown/ Barong Tagalog', '7.00', 4),
(1184, 14, 'Long Gown/ Barong Tagalog', '8.00', 4),
(1185, 15, 'Long Gown/ Barong Tagalog', '8.00', 4),
(1186, 16, 'Long Gown/ Barong Tagalog', '9.00', 4),
(1187, 17, 'Long Gown/ Barong Tagalog', '8.50', 4),
(1188, 18, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1189, 19, 'Long Gown/ Barong Tagalog', '8.50', 4),
(1190, 20, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1191, 1, 'Long Gown/ Barong Tagalog', '10.00', 4),
(1192, 2, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1193, 3, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1194, 4, 'Long Gown/ Barong Tagalog', '10.00', 4),
(1195, 5, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1196, 6, 'Long Gown/ Barong Tagalog', '9.00', 4),
(1197, 7, 'Long Gown/ Barong Tagalog', '8.00', 4),
(1198, 8, 'Long Gown/ Barong Tagalog', '9.00', 4),
(1199, 9, 'Long Gown/ Barong Tagalog', '9.50', 4),
(1200, 10, 'Long Gown/ Barong Tagalog', '8.00', 4),
(1201, 11, 'Production Performance', '9.00', 4),
(1202, 12, 'Production Performance', '7.50', 4),
(1203, 13, 'Production Performance', '9.50', 4),
(1204, 14, 'Production Performance', '5.00', 4),
(1205, 15, 'Production Performance', '9.00', 4),
(1206, 16, 'Production Performance', '9.50', 4),
(1207, 17, 'Production Performance', '8.50', 4),
(1208, 18, 'Production Performance', '9.50', 4),
(1209, 19, 'Production Performance', '10.00', 4),
(1210, 20, 'Production Performance', '9.00', 4),
(1211, 1, 'Production Performance', '8.00', 4),
(1212, 2, 'Production Performance', '9.00', 4),
(1213, 3, 'Production Performance', '10.00', 4),
(1214, 4, 'Production Performance', '10.00', 4),
(1215, 5, 'Production Performance', '8.50', 4),
(1216, 6, 'Production Performance', '9.00', 4),
(1217, 7, 'Production Performance', '8.00', 4),
(1218, 8, 'Production Performance', '8.50', 4),
(1219, 9, 'Production Performance', '9.50', 4),
(1220, 10, 'Production Performance', '9.00', 4),
(1241, 11, 'Beauty of the Face and Figure', '8.50', 6),
(1242, 12, 'Beauty of the Face and Figure', '9.00', 6),
(1243, 13, 'Beauty of the Face and Figure', '9.50', 6),
(1244, 14, 'Beauty of the Face and Figure', '9.00', 6),
(1245, 15, 'Beauty of the Face and Figure', '9.00', 6),
(1246, 16, 'Beauty of the Face and Figure', '10.00', 6),
(1247, 17, 'Beauty of the Face and Figure', '9.50', 6),
(1248, 18, 'Beauty of the Face and Figure', '9.00', 6),
(1249, 19, 'Beauty of the Face and Figure', '9.50', 6),
(1250, 20, 'Beauty of the Face and Figure', '9.00', 6),
(1251, 1, 'Beauty of the Face and Figure', '8.00', 6),
(1252, 2, 'Beauty of the Face and Figure', '9.00', 6),
(1253, 3, 'Beauty of the Face and Figure', '8.00', 6),
(1254, 4, 'Beauty of the Face and Figure', '9.50', 6),
(1255, 5, 'Beauty of the Face and Figure', '8.50', 6),
(1256, 6, 'Beauty of the Face and Figure', '9.00', 6),
(1257, 7, 'Beauty of the Face and Figure', '9.00', 6),
(1258, 8, 'Beauty of the Face and Figure', '9.50', 6),
(1259, 9, 'Beauty of the Face and Figure', '10.00', 6),
(1260, 10, 'Beauty of the Face and Figure', '10.00', 6),
(1261, 11, 'Intelligence', '5.00', 6),
(1262, 12, 'Intelligence', '5.00', 6),
(1263, 13, 'Intelligence', '5.00', 6),
(1264, 14, 'Intelligence', '5.00', 6),
(1265, 15, 'Intelligence', '5.00', 6),
(1266, 16, 'Intelligence', '5.00', 6),
(1267, 17, 'Intelligence', '5.00', 6),
(1268, 18, 'Intelligence', '5.00', 6),
(1269, 19, 'Intelligence', '5.00', 6),
(1270, 20, 'Intelligence', '5.00', 6),
(1271, 1, 'Intelligence', '5.00', 6),
(1272, 2, 'Intelligence', '5.00', 6),
(1273, 3, 'Intelligence', '5.00', 6),
(1274, 4, 'Intelligence', '5.00', 6),
(1275, 5, 'Intelligence', '5.00', 6),
(1276, 6, 'Intelligence', '5.00', 6),
(1277, 7, 'Intelligence', '5.00', 6),
(1278, 8, 'Intelligence', '5.00', 6),
(1279, 9, 'Intelligence', '5.00', 6),
(1280, 10, 'Intelligence', '5.00', 6),
(1281, 11, 'Beach Wear', '9.00', 6),
(1282, 12, 'Beach Wear', '10.00', 6),
(1283, 13, 'Beach Wear', '9.00', 6),
(1284, 14, 'Beach Wear', '9.50', 6),
(1285, 15, 'Beach Wear', '10.00', 6),
(1286, 16, 'Beach Wear', '10.00', 6),
(1287, 17, 'Beach Wear', '9.50', 6),
(1288, 18, 'Beach Wear', '9.50', 6),
(1289, 19, 'Beach Wear', '9.50', 6),
(1290, 20, 'Beach Wear', '9.50', 6),
(1291, 1, 'Beach Wear', '9.50', 6),
(1292, 2, 'Beach Wear', '9.50', 6),
(1293, 3, 'Beach Wear', '9.50', 6),
(1294, 4, 'Beach Wear', '9.50', 6),
(1295, 5, 'Beach Wear', '9.50', 6),
(1296, 6, 'Beach Wear', '9.50', 6),
(1297, 7, 'Beach Wear', '9.50', 6),
(1298, 8, 'Beach Wear', '9.50', 6),
(1299, 9, 'Beach Wear', '9.50', 6),
(1300, 10, 'Beach Wear', '9.50', 6),
(1301, 11, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1302, 12, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1303, 13, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1304, 14, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1305, 15, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1306, 16, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1307, 17, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1308, 18, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1309, 19, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1310, 20, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1311, 1, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1312, 2, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1313, 3, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1314, 4, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1315, 5, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1316, 6, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1317, 7, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1318, 8, 'Long Gown/ Barong Tagalog', '9.50', 6),
(1319, 9, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1320, 10, 'Long Gown/ Barong Tagalog', '9.00', 6),
(1321, 11, 'Production Performance', '10.00', 6),
(1322, 12, 'Production Performance', '10.00', 6),
(1323, 13, 'Production Performance', '9.00', 6),
(1324, 14, 'Production Performance', '9.00', 6),
(1325, 15, 'Production Performance', '9.00', 6),
(1326, 16, 'Production Performance', '9.50', 6),
(1327, 17, 'Production Performance', '9.50', 6),
(1328, 18, 'Production Performance', '9.50', 6),
(1329, 19, 'Production Performance', '9.50', 6),
(1330, 20, 'Production Performance', '9.50', 6),
(1331, 1, 'Production Performance', '9.50', 6),
(1332, 2, 'Production Performance', '9.50', 6),
(1333, 3, 'Production Performance', '9.50', 6),
(1334, 4, 'Production Performance', '9.50', 6),
(1335, 5, 'Production Performance', '9.50', 6),
(1336, 6, 'Production Performance', '10.00', 6),
(1337, 7, 'Production Performance', '9.00', 6),
(1338, 8, 'Production Performance', '9.00', 6),
(1339, 9, 'Production Performance', '9.50', 6),
(1340, 10, 'Production Performance', '9.50', 6);

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
,`finalist` enum('Yes','No')
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vfinal_score`
--
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
--
CREATE TABLE IF NOT EXISTS `vscore` (
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcandidate` AS select `candidate`.`id` AS `id`,`candidate`.`lname` AS `lname`,`candidate`.`fname` AS `fname`,`candidate`.`mi` AS `mi`,`candidate`.`type` AS `type`,`candidate`.`number` AS `number`,`candidate`.`is_active` AS `is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `full_name`,`candidate`.`finalist` AS `finalist` from `candidate`;

-- --------------------------------------------------------

--
-- Structure for view `vfinal_score`
--
DROP TABLE IF EXISTS `vfinal_score`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vfinal_score` AS select `final_score`.`id` AS `id`,`final_score`.`candidate_id` AS `candidate_id`,`final_score`.`criteria` AS `criteria`,`final_score`.`score` AS `score`,`final_score`.`judge` AS `judge`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `c_full_name`,concat(`judge`.`fname`,' ',`judge`.`mi`,' ',`judge`.`lname`) AS `j_full_name`,`candidate`.`id` AS `c_id`,`candidate`.`number` AS `c_number`,`candidate`.`type` AS `c_type`,`candidate`.`is_active` AS `c_is_active` from ((`final_score` join `candidate`) join `judge`) where ((`final_score`.`candidate_id` = `candidate`.`id`) and (`final_score`.`judge` = `judge`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `vscore`
--
DROP TABLE IF EXISTS `vscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscore` AS select `score`.`id` AS `id`,`score`.`candidate_id` AS `candidate_id`,`score`.`criteria` AS `criteria`,`score`.`score` AS `score`,`score`.`judge` AS `judge`,`candidate`.`is_active` AS `c_is_active`,concat(`candidate`.`fname`,' ',`candidate`.`mi`,' ',`candidate`.`lname`) AS `candidate_full_name`,`candidate`.`type` AS `c_type`,`candidate`.`number` AS `c_number`,concat(`judge`.`lname`,', ',`judge`.`fname`) AS `judge_full_name` from (((`score` join `candidate`) join `criteria`) join `judge`) where ((`score`.`candidate_id` = `candidate`.`id`) and (`score`.`criteria` = `criteria`.`name`) and (`score`.`judge` = `judge`.`id`));

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
