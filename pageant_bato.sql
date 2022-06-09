--
-- Database: `pageant_bato`
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

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `lname`, `fname`, `mi`, `type`, `number`, `is_active`, `finalist`) VALUES
(21, 'REGASPI', 'PRINCESS ', 'G.', 'Ms', 1, 'Yes', 'Yes'),
(22, 'IRISH', 'FAJARDO', 'D.', 'Ms', 2, 'Yes', 'No'),
(23, 'SACUEZA', 'LIEZEL', '', 'Ms', 3, 'Yes', 'No'),
(24, 'BALBUENO', 'MA. CRISTINE', 'T.', 'Ms', 4, 'Yes', 'No'),
(25, 'GAMAYAN', 'MA. SHEAREIGN DAINCHYLLES', 'L.', 'Ms', 5, 'Yes', 'No'),
(26, 'PERRAS ', 'JESSA ', 'L.', 'Ms', 6, 'Yes', 'No'),
(27, 'MAGISTRADO ', 'ZYRA MAE', 'S.', 'Ms', 7, 'Yes', 'No'),
(28, 'CLORADO ', 'JANDEL ', 'S.', 'Ms', 8, 'Yes', 'No'),
(29, 'BUENA ', 'BEA BIANCA', 'R.', 'Ms', 9, 'Yes', 'No'),
(30, 'LANUZO', 'TRISHIA', '', 'Ms', 10, 'Yes', 'No'),
(31, 'MARTERIZ ', 'DIANNE ROSE', '', 'Ms', 11, 'Yes', 'No'),
(32, 'LANUZGA', 'JANNA ELOISA', 'G.', 'Ms', 12, 'Yes', 'No'),
(33, 'ARGARIN', 'MARY JOY ', 'C.', 'Ms', 13, 'Yes', 'No'),
(34, 'LABIS', 'MELVIE JOYCE', 'L.', 'Ms', 14, 'Yes', 'No'),
(35, 'BALLESTER ', 'MENCHIE ', 'P.', 'Ms', 15, 'Yes', 'No'),
(36, 'TOLDANES ', 'PRINCESS CHINNE', 'A.', 'Ms', 16, 'Yes', 'No'),
(37, 'RAMOS', 'DANICA', 'T.', 'Ms', 17, 'Yes', 'No'),
(38, 'BATACAN', 'ARA CHRISTINE', 'C.', 'Ms', 18, 'Yes', 'No');

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
('Evening Gown', 10, 4),
('Preliminary', 5, 5),
('Production Attire', 50, 1),
('Production Performance', 20, 2),
('Swimsuit', 20, 3);

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
('MISS BATO 2022', '', 'Yes', '10.00', '5.00', 'Yes', 'Active');

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
('Final', 100, 1);

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
(2, 'LAGRIMAS', 'NIKKI', ''),
(4, 'ABENION', 'LORENZ', 'S.'),
(6, 'GONGONA', 'RYAN', 'V.'),
(7, 'CALLEJA', 'BENEDICT', ''),
(8, 'AREVALO', 'MARGIE', ''),
(9, 'PEREZ ', 'KIM ', ''),
(10, 'PONTILLAS ', 'MARLON ', 'S.'),
(11, 'BAGASALA', 'RICHARD', 'M.'),
(12, 'BUSTILLA ', 'GILDA', 'P.'),
(13, 'SAMIENGO-BO', 'MERCY', ''),
(14, 'NAMORO', 'NICK', 'B.');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `criteria` varchar(200) NOT NULL,
  `score` decimal(8,3) NOT NULL,
  `judge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `candidate_id`, `criteria`, `score`, `judge`) VALUES
(1, 21, 'Production Attire', '7.900', 2),
(2, 22, 'Production Attire', '7.000', 2),
(3, 23, 'Production Attire', '8.800', 2),
(4, 24, 'Production Attire', '5.000', 2),
(5, 25, 'Production Attire', '5.000', 2),
(6, 26, 'Production Attire', '5.000', 2),
(7, 27, 'Production Attire', '5.000', 2),
(8, 28, 'Production Attire', '5.000', 2),
(9, 29, 'Production Attire', '5.000', 2),
(10, 30, 'Production Attire', '5.000', 2),
(11, 31, 'Production Attire', '5.000', 2),
(12, 32, 'Production Attire', '5.000', 2),
(13, 33, 'Production Attire', '5.000', 2),
(14, 34, 'Production Attire', '5.000', 2),
(15, 35, 'Production Attire', '5.000', 2),
(16, 36, 'Production Attire', '5.000', 2),
(17, 37, 'Production Attire', '5.000', 2),
(18, 38, 'Production Attire', '5.000', 2),
(19, 21, 'Production Attire', '9.200', 4),
(20, 22, 'Production Attire', '9.100', 4),
(21, 23, 'Production Attire', '5.000', 4),
(22, 24, 'Production Attire', '5.000', 4),
(23, 25, 'Production Attire', '5.000', 4),
(24, 26, 'Production Attire', '5.000', 4),
(25, 27, 'Production Attire', '5.000', 4),
(26, 28, 'Production Attire', '5.000', 4),
(27, 29, 'Production Attire', '5.000', 4),
(28, 30, 'Production Attire', '5.000', 4),
(29, 31, 'Production Attire', '5.000', 4),
(30, 32, 'Production Attire', '5.000', 4),
(31, 33, 'Production Attire', '5.000', 4),
(32, 34, 'Production Attire', '5.000', 4),
(33, 35, 'Production Attire', '5.000', 4),
(34, 36, 'Production Attire', '5.000', 4),
(35, 37, 'Production Attire', '5.000', 4),
(36, 38, 'Production Attire', '5.000', 4),
(37, 21, 'Production Attire', '9.500', 6),
(38, 22, 'Production Attire', '9.400', 6),
(39, 23, 'Production Attire', '5.000', 6),
(40, 24, 'Production Attire', '5.000', 6),
(41, 25, 'Production Attire', '5.000', 6),
(42, 26, 'Production Attire', '5.000', 6),
(43, 27, 'Production Attire', '5.000', 6),
(44, 28, 'Production Attire', '5.000', 6),
(45, 29, 'Production Attire', '5.000', 6),
(46, 30, 'Production Attire', '5.000', 6),
(47, 31, 'Production Attire', '5.000', 6),
(48, 32, 'Production Attire', '5.000', 6),
(49, 33, 'Production Attire', '5.000', 6),
(50, 34, 'Production Attire', '5.000', 6),
(51, 35, 'Production Attire', '5.000', 6),
(52, 36, 'Production Attire', '5.000', 6),
(53, 37, 'Production Attire', '5.000', 6),
(54, 38, 'Production Attire', '5.000', 6),
(55, 21, 'Production Performance', '9.700', 6),
(56, 22, 'Production Performance', '5.000', 6),
(57, 23, 'Production Performance', '5.000', 6),
(58, 24, 'Production Performance', '5.000', 6),
(59, 25, 'Production Performance', '5.000', 6),
(60, 26, 'Production Performance', '5.000', 6),
(61, 27, 'Production Performance', '5.000', 6),
(62, 28, 'Production Performance', '5.000', 6),
(63, 29, 'Production Performance', '5.000', 6),
(64, 30, 'Production Performance', '5.000', 6),
(65, 31, 'Production Performance', '5.000', 6),
(66, 32, 'Production Performance', '5.000', 6),
(67, 33, 'Production Performance', '5.000', 6),
(68, 34, 'Production Performance', '5.000', 6),
(69, 35, 'Production Performance', '5.000', 6),
(70, 36, 'Production Performance', '5.000', 6),
(71, 37, 'Production Performance', '5.000', 6),
(72, 38, 'Production Performance', '5.000', 6),
(73, 21, 'Production Attire', '10.000', 7),
(74, 22, 'Production Attire', '9.300', 7),
(75, 23, 'Production Attire', '9.600', 7),
(76, 24, 'Production Attire', '5.000', 7),
(77, 25, 'Production Attire', '5.000', 7),
(78, 26, 'Production Attire', '5.000', 7),
(79, 27, 'Production Attire', '5.000', 7),
(80, 28, 'Production Attire', '5.000', 7),
(81, 29, 'Production Attire', '5.000', 7),
(82, 30, 'Production Attire', '5.000', 7),
(83, 31, 'Production Attire', '5.000', 7),
(84, 32, 'Production Attire', '5.000', 7),
(85, 33, 'Production Attire', '5.000', 7),
(86, 34, 'Production Attire', '5.000', 7),
(87, 35, 'Production Attire', '5.000', 7),
(88, 36, 'Production Attire', '5.000', 7),
(89, 37, 'Production Attire', '5.000', 7),
(90, 38, 'Production Attire', '5.000', 7),
(91, 21, 'Production Performance', '9.500', 7),
(92, 22, 'Production Performance', '5.000', 7),
(93, 23, 'Production Performance', '5.000', 7),
(94, 24, 'Production Performance', '5.000', 7),
(95, 25, 'Production Performance', '5.000', 7),
(96, 26, 'Production Performance', '5.000', 7),
(97, 27, 'Production Performance', '5.000', 7),
(98, 28, 'Production Performance', '5.000', 7),
(99, 29, 'Production Performance', '5.000', 7),
(100, 30, 'Production Performance', '5.000', 7),
(101, 31, 'Production Performance', '5.000', 7),
(102, 32, 'Production Performance', '5.000', 7),
(103, 33, 'Production Performance', '5.000', 7),
(104, 34, 'Production Performance', '5.000', 7),
(105, 35, 'Production Performance', '5.000', 7),
(106, 36, 'Production Performance', '5.000', 7),
(107, 37, 'Production Performance', '5.000', 7),
(108, 38, 'Production Performance', '5.000', 7),
(109, 21, 'Production Attire', '9.400', 14),
(110, 22, 'Production Attire', '9.400', 14),
(111, 23, 'Production Attire', '8.000', 14),
(112, 24, 'Production Attire', '5.000', 14),
(113, 25, 'Production Attire', '5.000', 14),
(114, 26, 'Production Attire', '5.000', 14),
(115, 27, 'Production Attire', '5.000', 14),
(116, 28, 'Production Attire', '5.000', 14),
(117, 29, 'Production Attire', '5.000', 14),
(118, 30, 'Production Attire', '5.000', 14),
(119, 31, 'Production Attire', '5.000', 14),
(120, 32, 'Production Attire', '5.000', 14),
(121, 33, 'Production Attire', '5.000', 14),
(122, 34, 'Production Attire', '5.000', 14),
(123, 35, 'Production Attire', '5.000', 14),
(124, 36, 'Production Attire', '5.000', 14),
(125, 37, 'Production Attire', '5.000', 14),
(126, 38, 'Production Attire', '5.000', 14),
(127, 21, 'Production Performance', '8.300', 14),
(128, 22, 'Production Performance', '9.350', 14),
(129, 23, 'Production Performance', '7.900', 14),
(130, 24, 'Production Performance', '5.000', 14),
(131, 25, 'Production Performance', '5.000', 14),
(132, 26, 'Production Performance', '5.000', 14),
(133, 27, 'Production Performance', '5.000', 14),
(134, 28, 'Production Performance', '5.000', 14),
(135, 29, 'Production Performance', '5.000', 14),
(136, 30, 'Production Performance', '5.000', 14),
(137, 31, 'Production Performance', '5.000', 14),
(138, 32, 'Production Performance', '5.000', 14),
(139, 33, 'Production Performance', '5.000', 14),
(140, 34, 'Production Performance', '5.000', 14),
(141, 35, 'Production Performance', '5.000', 14),
(142, 36, 'Production Performance', '5.000', 14),
(143, 37, 'Production Performance', '5.000', 14),
(144, 38, 'Production Performance', '5.000', 14),
(145, 21, 'Production Attire', '9.500', 9),
(146, 22, 'Production Attire', '9.600', 9),
(147, 23, 'Production Attire', '5.000', 9),
(148, 24, 'Production Attire', '5.000', 9),
(149, 25, 'Production Attire', '5.000', 9),
(150, 26, 'Production Attire', '5.000', 9),
(151, 27, 'Production Attire', '5.000', 9),
(152, 28, 'Production Attire', '5.000', 9),
(153, 29, 'Production Attire', '5.000', 9),
(154, 30, 'Production Attire', '5.000', 9),
(155, 31, 'Production Attire', '5.000', 9),
(156, 32, 'Production Attire', '5.000', 9),
(157, 33, 'Production Attire', '5.000', 9),
(158, 34, 'Production Attire', '5.000', 9),
(159, 35, 'Production Attire', '5.000', 9),
(160, 36, 'Production Attire', '5.000', 9),
(161, 37, 'Production Attire', '5.000', 9),
(162, 38, 'Production Attire', '5.000', 9),
(163, 21, 'Production Performance', '9.550', 9),
(164, 22, 'Production Performance', '8.750', 9),
(165, 23, 'Production Performance', '5.000', 9),
(166, 24, 'Production Performance', '5.000', 9),
(167, 25, 'Production Performance', '5.000', 9),
(168, 26, 'Production Performance', '5.000', 9),
(169, 27, 'Production Performance', '5.000', 9),
(170, 28, 'Production Performance', '5.000', 9),
(171, 29, 'Production Performance', '5.000', 9),
(172, 30, 'Production Performance', '5.000', 9),
(173, 31, 'Production Performance', '5.000', 9),
(174, 32, 'Production Performance', '5.000', 9),
(175, 33, 'Production Performance', '5.000', 9),
(176, 34, 'Production Performance', '5.000', 9),
(177, 35, 'Production Performance', '5.000', 9),
(178, 36, 'Production Performance', '5.000', 9),
(179, 37, 'Production Performance', '5.000', 9),
(180, 38, 'Production Performance', '5.000', 9),
(181, 21, 'Production Attire', '9.200', 8),
(182, 22, 'Production Attire', '8.800', 8),
(183, 23, 'Production Attire', '5.000', 8),
(184, 24, 'Production Attire', '5.000', 8),
(185, 25, 'Production Attire', '5.000', 8),
(186, 26, 'Production Attire', '5.000', 8),
(187, 27, 'Production Attire', '5.000', 8),
(188, 28, 'Production Attire', '5.000', 8),
(189, 29, 'Production Attire', '5.000', 8),
(190, 30, 'Production Attire', '5.000', 8),
(191, 31, 'Production Attire', '5.000', 8),
(192, 32, 'Production Attire', '5.000', 8),
(193, 33, 'Production Attire', '5.000', 8),
(194, 34, 'Production Attire', '5.000', 8),
(195, 35, 'Production Attire', '5.000', 8),
(196, 36, 'Production Attire', '5.000', 8),
(197, 37, 'Production Attire', '5.000', 8),
(198, 38, 'Production Attire', '5.000', 8),
(199, 21, 'Swimsuit', '8.500', 8),
(200, 22, 'Swimsuit', '8.700', 8),
(201, 23, 'Swimsuit', '5.000', 8),
(202, 24, 'Swimsuit', '5.000', 8),
(203, 25, 'Swimsuit', '5.000', 8),
(204, 26, 'Swimsuit', '5.000', 8),
(205, 27, 'Swimsuit', '5.000', 8),
(206, 28, 'Swimsuit', '5.000', 8),
(207, 29, 'Swimsuit', '5.000', 8),
(208, 30, 'Swimsuit', '5.000', 8),
(209, 31, 'Swimsuit', '5.000', 8),
(210, 32, 'Swimsuit', '5.000', 8),
(211, 33, 'Swimsuit', '5.000', 8),
(212, 34, 'Swimsuit', '5.000', 8),
(213, 35, 'Swimsuit', '5.000', 8),
(214, 36, 'Swimsuit', '5.000', 8),
(215, 37, 'Swimsuit', '5.000', 8),
(216, 38, 'Swimsuit', '5.000', 8),
(217, 21, 'Production Performance', '8.900', 10),
(218, 22, 'Production Performance', '8.950', 10),
(219, 23, 'Production Performance', '5.000', 10),
(220, 24, 'Production Performance', '5.000', 10),
(221, 25, 'Production Performance', '5.000', 10),
(222, 26, 'Production Performance', '5.000', 10),
(223, 27, 'Production Performance', '5.000', 10),
(224, 28, 'Production Performance', '5.000', 10),
(225, 29, 'Production Performance', '5.000', 10),
(226, 30, 'Production Performance', '5.000', 10),
(227, 31, 'Production Performance', '5.000', 10),
(228, 32, 'Production Performance', '5.000', 10),
(229, 33, 'Production Performance', '5.000', 10),
(230, 34, 'Production Performance', '5.000', 10),
(231, 35, 'Production Performance', '5.000', 10),
(232, 36, 'Production Performance', '5.000', 10),
(233, 37, 'Production Performance', '5.000', 10),
(234, 38, 'Production Performance', '5.000', 10),
(235, 21, 'Production Attire', '8.900', 10),
(236, 22, 'Production Attire', '9.100', 10),
(237, 23, 'Production Attire', '5.000', 10),
(238, 24, 'Production Attire', '5.000', 10),
(239, 25, 'Production Attire', '5.000', 10),
(240, 26, 'Production Attire', '5.000', 10),
(241, 27, 'Production Attire', '5.000', 10),
(242, 28, 'Production Attire', '5.000', 10),
(243, 29, 'Production Attire', '5.000', 10),
(244, 30, 'Production Attire', '5.000', 10),
(245, 31, 'Production Attire', '5.000', 10),
(246, 32, 'Production Attire', '5.000', 10),
(247, 33, 'Production Attire', '5.000', 10),
(248, 34, 'Production Attire', '5.000', 10),
(249, 35, 'Production Attire', '5.000', 10),
(250, 36, 'Production Attire', '5.000', 10),
(251, 37, 'Production Attire', '5.000', 10),
(252, 38, 'Production Attire', '5.000', 10),
(253, 21, 'Production Attire', '7.600', 11),
(254, 22, 'Production Attire', '7.600', 11),
(255, 23, 'Production Attire', '5.000', 11),
(256, 24, 'Production Attire', '5.000', 11),
(257, 25, 'Production Attire', '5.000', 11),
(258, 26, 'Production Attire', '5.000', 11),
(259, 27, 'Production Attire', '5.000', 11),
(260, 28, 'Production Attire', '5.000', 11),
(261, 29, 'Production Attire', '5.000', 11),
(262, 30, 'Production Attire', '5.000', 11),
(263, 31, 'Production Attire', '5.000', 11),
(264, 32, 'Production Attire', '5.000', 11),
(265, 33, 'Production Attire', '5.000', 11),
(266, 34, 'Production Attire', '5.000', 11),
(267, 35, 'Production Attire', '5.000', 11),
(268, 36, 'Production Attire', '5.000', 11),
(269, 37, 'Production Attire', '5.000', 11),
(270, 38, 'Production Attire', '5.000', 11),
(271, 21, 'Production Performance', '8.800', 11),
(272, 22, 'Production Performance', '9.700', 11),
(273, 23, 'Production Performance', '5.000', 11),
(274, 24, 'Production Performance', '5.000', 11),
(275, 25, 'Production Performance', '5.000', 11),
(276, 26, 'Production Performance', '5.000', 11),
(277, 27, 'Production Performance', '5.000', 11),
(278, 28, 'Production Performance', '5.000', 11),
(279, 29, 'Production Performance', '5.000', 11),
(280, 30, 'Production Performance', '5.000', 11),
(281, 31, 'Production Performance', '5.000', 11),
(282, 32, 'Production Performance', '5.000', 11),
(283, 33, 'Production Performance', '5.000', 11),
(284, 34, 'Production Performance', '5.000', 11),
(285, 35, 'Production Performance', '5.000', 11),
(286, 36, 'Production Performance', '5.000', 11),
(287, 37, 'Production Performance', '5.000', 11),
(288, 38, 'Production Performance', '5.000', 11),
(289, 21, 'Production Attire', '9.200', 12),
(290, 22, 'Production Attire', '10.000', 12),
(291, 23, 'Production Attire', '5.000', 12),
(292, 24, 'Production Attire', '5.000', 12),
(293, 25, 'Production Attire', '5.000', 12),
(294, 26, 'Production Attire', '5.000', 12),
(295, 27, 'Production Attire', '5.000', 12),
(296, 28, 'Production Attire', '5.000', 12),
(297, 29, 'Production Attire', '5.000', 12),
(298, 30, 'Production Attire', '5.000', 12),
(299, 31, 'Production Attire', '5.000', 12),
(300, 32, 'Production Attire', '5.000', 12),
(301, 33, 'Production Attire', '5.000', 12),
(302, 34, 'Production Attire', '5.000', 12),
(303, 35, 'Production Attire', '5.000', 12),
(304, 36, 'Production Attire', '5.000', 12),
(305, 37, 'Production Attire', '5.000', 12),
(306, 38, 'Production Attire', '5.000', 12),
(307, 21, 'Production Performance', '9.950', 12),
(308, 22, 'Production Performance', '9.700', 12),
(309, 23, 'Production Performance', '5.000', 12),
(310, 24, 'Production Performance', '5.000', 12),
(311, 25, 'Production Performance', '5.000', 12),
(312, 26, 'Production Performance', '5.000', 12),
(313, 27, 'Production Performance', '5.000', 12),
(314, 28, 'Production Performance', '5.000', 12),
(315, 29, 'Production Performance', '5.000', 12),
(316, 30, 'Production Performance', '5.000', 12),
(317, 31, 'Production Performance', '5.000', 12),
(318, 32, 'Production Performance', '5.000', 12),
(319, 33, 'Production Performance', '5.000', 12),
(320, 34, 'Production Performance', '5.000', 12),
(321, 35, 'Production Performance', '5.000', 12),
(322, 36, 'Production Performance', '5.000', 12),
(323, 37, 'Production Performance', '5.000', 12),
(324, 38, 'Production Performance', '5.000', 12),
(325, 21, 'Production Attire', '9.500', 13),
(326, 22, 'Production Attire', '9.000', 13),
(327, 23, 'Production Attire', '5.000', 13),
(328, 24, 'Production Attire', '5.000', 13),
(329, 25, 'Production Attire', '5.000', 13),
(330, 26, 'Production Attire', '5.000', 13),
(331, 27, 'Production Attire', '5.000', 13),
(332, 28, 'Production Attire', '5.000', 13),
(333, 29, 'Production Attire', '5.000', 13),
(334, 30, 'Production Attire', '5.000', 13),
(335, 31, 'Production Attire', '5.000', 13),
(336, 32, 'Production Attire', '5.000', 13),
(337, 33, 'Production Attire', '5.000', 13),
(338, 34, 'Production Attire', '5.000', 13),
(339, 35, 'Production Attire', '5.000', 13),
(340, 36, 'Production Attire', '5.000', 13),
(341, 37, 'Production Attire', '5.000', 13),
(342, 38, 'Production Attire', '5.000', 13),
(343, 21, 'Production Performance', '9.850', 13),
(344, 22, 'Production Performance', '9.350', 13),
(345, 23, 'Production Performance', '5.000', 13),
(346, 24, 'Production Performance', '5.000', 13),
(347, 25, 'Production Performance', '5.000', 13),
(348, 26, 'Production Performance', '5.000', 13),
(349, 27, 'Production Performance', '5.000', 13),
(350, 28, 'Production Performance', '5.000', 13),
(351, 29, 'Production Performance', '5.000', 13),
(352, 30, 'Production Performance', '5.000', 13),
(353, 31, 'Production Performance', '5.000', 13),
(354, 32, 'Production Performance', '5.000', 13),
(355, 33, 'Production Performance', '5.000', 13),
(356, 34, 'Production Performance', '5.000', 13),
(357, 35, 'Production Performance', '5.000', 13),
(358, 36, 'Production Performance', '5.000', 13),
(359, 37, 'Production Performance', '5.000', 13),
(360, 38, 'Production Performance', '5.000', 13),
(361, 21, 'Preliminary', '7.130', 2),
(362, 22, 'Preliminary', '7.100', 2),
(363, 23, 'Preliminary', '7.350', 2),
(364, 24, 'Preliminary', '7.380', 2),
(365, 25, 'Preliminary', '8.800', 2),
(366, 26, 'Preliminary', '8.650', 2),
(367, 27, 'Preliminary', '7.850', 2),
(368, 28, 'Preliminary', '7.580', 2),
(369, 29, 'Preliminary', '7.200', 2),
(370, 30, 'Preliminary', '7.050', 2),
(371, 31, 'Preliminary', '7.530', 2),
(372, 32, 'Preliminary', '7.700', 2),
(373, 33, 'Preliminary', '5.000', 2),
(374, 34, 'Preliminary', '5.000', 2),
(375, 35, 'Preliminary', '5.000', 2),
(376, 36, 'Preliminary', '5.000', 2),
(377, 37, 'Preliminary', '5.000', 2),
(378, 38, 'Preliminary', '5.000', 2),
(379, 21, 'Production Performance', '9.850', 8),
(380, 22, 'Production Performance', '9.200', 8),
(381, 23, 'Production Performance', '9.650', 8),
(382, 24, 'Production Performance', '9.500', 8),
(383, 25, 'Production Performance', '9.150', 8),
(384, 26, 'Production Performance', '9.350', 8),
(385, 27, 'Production Performance', '9.250', 8),
(386, 28, 'Production Performance', '6.600', 8),
(387, 29, 'Production Performance', '9.350', 8),
(388, 30, 'Production Performance', '8.800', 8),
(389, 31, 'Production Performance', '9.350', 8),
(390, 32, 'Production Performance', '8.600', 8),
(391, 33, 'Production Performance', '9.250', 8),
(392, 34, 'Production Performance', '8.150', 8),
(393, 35, 'Production Performance', '5.000', 8),
(394, 36, 'Production Performance', '5.000', 8),
(395, 37, 'Production Performance', '5.000', 8),
(396, 38, 'Production Performance', '5.000', 8),
(397, 21, 'Preliminary', '9.030', 8),
(398, 22, 'Preliminary', '9.170', 8),
(399, 23, 'Preliminary', '9.000', 8),
(400, 24, 'Preliminary', '9.000', 8),
(401, 25, 'Preliminary', '9.750', 8),
(402, 26, 'Preliminary', '9.030', 8),
(403, 27, 'Preliminary', '9.430', 8),
(404, 28, 'Preliminary', '9.200', 8),
(405, 29, 'Preliminary', '9.230', 8),
(406, 30, 'Preliminary', '9.050', 8),
(407, 31, 'Preliminary', '5.000', 8),
(408, 32, 'Preliminary', '5.000', 8),
(409, 33, 'Preliminary', '5.000', 8),
(410, 34, 'Preliminary', '5.000', 8),
(411, 35, 'Preliminary', '5.000', 8),
(412, 36, 'Preliminary', '5.000', 8),
(413, 37, 'Preliminary', '5.000', 8),
(414, 38, 'Preliminary', '5.000', 8),
(415, 21, 'Production Performance', '7.400', 4),
(416, 22, 'Production Performance', '7.550', 4),
(417, 23, 'Production Performance', '8.300', 4),
(418, 24, 'Production Performance', '7.900', 4),
(419, 25, 'Production Performance', '7.500', 4),
(420, 26, 'Production Performance', '8.750', 4),
(421, 27, 'Production Performance', '8.650', 4),
(422, 28, 'Production Performance', '8.750', 4),
(423, 29, 'Production Performance', '8.600', 4),
(424, 30, 'Production Performance', '9.700', 4),
(425, 31, 'Production Performance', '5.000', 4),
(426, 32, 'Production Performance', '5.000', 4),
(427, 33, 'Production Performance', '5.000', 4),
(428, 34, 'Production Performance', '5.000', 4),
(429, 35, 'Production Performance', '5.000', 4),
(430, 36, 'Production Performance', '5.000', 4),
(431, 37, 'Production Performance', '5.000', 4),
(432, 38, 'Production Performance', '5.000', 4),
(433, 21, 'Preliminary', '8.650', 6),
(434, 22, 'Preliminary', '7.770', 6),
(435, 23, 'Preliminary', '8.850', 6),
(436, 24, 'Preliminary', '8.650', 6),
(437, 25, 'Preliminary', '8.850', 6),
(438, 26, 'Preliminary', '9.170', 6),
(439, 27, 'Preliminary', '8.980', 6),
(440, 28, 'Preliminary', '8.700', 6),
(441, 29, 'Preliminary', '8.830', 6),
(442, 30, 'Preliminary', '8.700', 6),
(443, 31, 'Preliminary', '5.000', 6),
(444, 32, 'Preliminary', '5.000', 6),
(445, 33, 'Preliminary', '5.000', 6),
(446, 34, 'Preliminary', '5.000', 6),
(447, 35, 'Preliminary', '5.000', 6),
(448, 36, 'Preliminary', '5.000', 6),
(449, 37, 'Preliminary', '5.000', 6),
(450, 38, 'Preliminary', '5.000', 6),
(451, 21, 'Preliminary', '9.430', 4),
(452, 22, 'Preliminary', '9.050', 4),
(453, 23, 'Preliminary', '8.550', 4),
(454, 24, 'Preliminary', '9.130', 4),
(455, 25, 'Preliminary', '8.880', 4),
(456, 26, 'Preliminary', '9.000', 4),
(457, 27, 'Preliminary', '8.900', 4),
(458, 28, 'Preliminary', '9.500', 4),
(459, 29, 'Preliminary', '9.530', 4),
(460, 30, 'Preliminary', '9.450', 4),
(461, 31, 'Preliminary', '5.000', 4),
(462, 32, 'Preliminary', '5.000', 4),
(463, 33, 'Preliminary', '5.000', 4),
(464, 34, 'Preliminary', '5.000', 4),
(465, 35, 'Preliminary', '5.000', 4),
(466, 36, 'Preliminary', '5.000', 4),
(467, 37, 'Preliminary', '5.000', 4),
(468, 38, 'Preliminary', '5.000', 4),
(469, 21, 'Preliminary', '9.430', 7),
(470, 22, 'Preliminary', '8.980', 7),
(471, 23, 'Preliminary', '9.330', 7),
(472, 24, 'Preliminary', '9.350', 7),
(473, 25, 'Preliminary', '6.600', 7),
(474, 26, 'Preliminary', '5.900', 7),
(475, 27, 'Preliminary', '7.600', 7),
(476, 28, 'Preliminary', '7.450', 7),
(477, 29, 'Preliminary', '8.580', 7),
(478, 30, 'Preliminary', '8.480', 7),
(479, 31, 'Preliminary', '5.000', 7),
(480, 32, 'Preliminary', '5.000', 7),
(481, 33, 'Preliminary', '5.000', 7),
(482, 34, 'Preliminary', '5.000', 7),
(483, 35, 'Preliminary', '5.000', 7),
(484, 36, 'Preliminary', '5.000', 7),
(485, 37, 'Preliminary', '5.000', 7),
(486, 38, 'Preliminary', '5.000', 7),
(487, 21, 'Preliminary', '9.100', 14),
(488, 22, 'Preliminary', '9.250', 14),
(489, 23, 'Preliminary', '9.300', 14),
(490, 24, 'Preliminary', '9.050', 14),
(491, 25, 'Preliminary', '8.650', 14),
(492, 26, 'Preliminary', '8.480', 14),
(493, 27, 'Preliminary', '8.750', 14),
(494, 28, 'Preliminary', '9.430', 14),
(495, 29, 'Preliminary', '8.600', 14),
(496, 30, 'Preliminary', '9.420', 14),
(497, 31, 'Preliminary', '5.000', 14),
(498, 32, 'Preliminary', '5.000', 14),
(499, 33, 'Preliminary', '5.000', 14),
(500, 34, 'Preliminary', '5.000', 14),
(501, 35, 'Preliminary', '5.000', 14),
(502, 36, 'Preliminary', '5.000', 14),
(503, 37, 'Preliminary', '5.000', 14),
(504, 38, 'Preliminary', '5.000', 14),
(505, 21, 'Preliminary', '6.650', 9),
(506, 22, 'Preliminary', '8.950', 9),
(507, 23, 'Preliminary', '8.480', 9),
(508, 24, 'Preliminary', '8.080', 9),
(509, 25, 'Preliminary', '8.480', 9),
(510, 26, 'Preliminary', '8.400', 9),
(511, 27, 'Preliminary', '7.950', 9),
(512, 28, 'Preliminary', '8.780', 9),
(513, 29, 'Preliminary', '8.600', 9),
(514, 30, 'Preliminary', '8.330', 9),
(515, 31, 'Preliminary', '5.000', 9),
(516, 32, 'Preliminary', '5.000', 9),
(517, 33, 'Preliminary', '5.000', 9),
(518, 34, 'Preliminary', '5.000', 9),
(519, 35, 'Preliminary', '5.000', 9),
(520, 36, 'Preliminary', '5.000', 9),
(521, 37, 'Preliminary', '5.000', 9),
(522, 38, 'Preliminary', '5.000', 9),
(523, 21, 'Preliminary', '8.100', 10),
(524, 22, 'Preliminary', '8.650', 10),
(525, 23, 'Preliminary', '8.550', 10),
(526, 24, 'Preliminary', '8.280', 10),
(527, 25, 'Preliminary', '8.600', 10),
(528, 26, 'Preliminary', '7.650', 10),
(529, 27, 'Preliminary', '7.650', 10),
(530, 28, 'Preliminary', '8.750', 10),
(531, 29, 'Preliminary', '8.530', 10),
(532, 30, 'Preliminary', '8.600', 10),
(533, 31, 'Preliminary', '5.000', 10),
(534, 32, 'Preliminary', '5.000', 10),
(535, 33, 'Preliminary', '5.000', 10),
(536, 34, 'Preliminary', '5.000', 10),
(537, 35, 'Preliminary', '5.000', 10),
(538, 36, 'Preliminary', '5.000', 10),
(539, 37, 'Preliminary', '5.000', 10),
(540, 38, 'Preliminary', '5.000', 10),
(541, 21, 'Preliminary', '8.800', 13),
(542, 22, 'Preliminary', '9.380', 13),
(543, 23, 'Preliminary', '8.230', 13),
(544, 24, 'Preliminary', '9.300', 13),
(545, 25, 'Preliminary', '8.530', 13),
(546, 26, 'Preliminary', '9.100', 13),
(547, 27, 'Preliminary', '9.170', 13),
(548, 28, 'Preliminary', '9.550', 13),
(549, 29, 'Preliminary', '9.400', 13),
(550, 30, 'Preliminary', '8.980', 13),
(551, 31, 'Preliminary', '5.000', 13),
(552, 32, 'Preliminary', '5.000', 13),
(553, 33, 'Preliminary', '5.000', 13),
(554, 34, 'Preliminary', '5.000', 13),
(555, 35, 'Preliminary', '5.000', 13),
(556, 36, 'Preliminary', '5.000', 13),
(557, 37, 'Preliminary', '5.000', 13),
(558, 38, 'Preliminary', '5.000', 13),
(559, 21, 'Preliminary', '8.100', 11),
(560, 22, 'Preliminary', '8.150', 11),
(561, 23, 'Preliminary', '7.980', 11),
(562, 24, 'Preliminary', '7.780', 11),
(563, 25, 'Preliminary', '8.150', 11),
(564, 26, 'Preliminary', '8.100', 11),
(565, 27, 'Preliminary', '8.950', 11),
(566, 28, 'Preliminary', '6.430', 11),
(567, 29, 'Preliminary', '7.000', 11),
(568, 30, 'Preliminary', '7.550', 11),
(569, 31, 'Preliminary', '5.000', 11),
(570, 32, 'Preliminary', '5.000', 11),
(571, 33, 'Preliminary', '5.000', 11),
(572, 34, 'Preliminary', '5.000', 11),
(573, 35, 'Preliminary', '5.000', 11),
(574, 36, 'Preliminary', '5.000', 11),
(575, 37, 'Preliminary', '5.000', 11),
(576, 38, 'Preliminary', '5.000', 11),
(577, 21, 'Preliminary', '7.980', 12),
(578, 22, 'Preliminary', '6.780', 12),
(579, 23, 'Preliminary', '7.500', 12),
(580, 24, 'Preliminary', '8.030', 12),
(581, 25, 'Preliminary', '8.300', 12),
(582, 26, 'Preliminary', '8.300', 12),
(583, 27, 'Preliminary', '7.500', 12),
(584, 28, 'Preliminary', '8.450', 12),
(585, 29, 'Preliminary', '7.980', 12),
(586, 30, 'Preliminary', '8.530', 12),
(587, 31, 'Preliminary', '5.000', 12),
(588, 32, 'Preliminary', '5.000', 12),
(589, 33, 'Preliminary', '5.000', 12),
(590, 34, 'Preliminary', '5.000', 12),
(591, 35, 'Preliminary', '5.000', 12),
(592, 36, 'Preliminary', '5.000', 12),
(593, 37, 'Preliminary', '5.000', 12),
(594, 38, 'Preliminary', '5.000', 12),
(595, 21, 'Preliminary', '8.980', 12),
(596, 22, 'Preliminary', '9.400', 12),
(597, 23, 'Preliminary', '9.330', 12),
(598, 24, 'Preliminary', '8.800', 12),
(599, 25, 'Preliminary', '9.200', 12),
(600, 26, 'Preliminary', '9.480', 12),
(601, 27, 'Preliminary', '9.230', 12),
(602, 28, 'Preliminary', '9.480', 12),
(603, 29, 'Preliminary', '8.730', 12),
(604, 30, 'Preliminary', '9.000', 12),
(605, 31, 'Preliminary', '5.000', 12),
(606, 32, 'Preliminary', '5.000', 12),
(607, 33, 'Preliminary', '5.000', 12),
(608, 34, 'Preliminary', '5.000', 12),
(609, 35, 'Preliminary', '5.000', 12),
(610, 36, 'Preliminary', '5.000', 12),
(611, 37, 'Preliminary', '5.000', 12),
(612, 38, 'Preliminary', '5.000', 12);

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria`
--

CREATE TABLE `sub_criteria` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `percentage` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `segment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_criteria`
--

INSERT INTO `sub_criteria` (`id`, `name`, `percentage`, `sort`, `segment`) VALUES
(10, 'Beauty of the face and figure', 40, 1, 'Production Attire'),
(11, 'Poise and Carriage', 40, 2, 'Production Attire'),
(12, 'Over All Impact', 20, 3, 'Production Attire'),
(13, 'Beauty of the face and figure', 30, 1, 'Production Performance'),
(14, 'Mastery and Coordination', 30, 2, 'Production Performance'),
(15, 'Projection', 30, 3, 'Production Performance'),
(16, 'Over All Impact', 10, 4, 'Production Performance'),
(17, 'Beauty of the face', 30, 1, 'Swimsuit'),
(18, 'Beauty of the body and figure', 30, 2, 'Swimsuit'),
(19, 'Poise and Carriage', 30, 3, 'Swimsuit'),
(20, 'Over all Impact', 10, 4, 'Swimsuit'),
(21, 'Beauty of the Face and Figure', 30, 1, 'Evening Gown'),
(22, 'Appropriateness and Elegance', 30, 2, 'Evening Gown'),
(23, 'Pois and Carriage', 30, 3, 'Evening Gown'),
(24, 'Over All Impact', 10, 4, 'Evening Gown'),
(33, 'Beauty of the Face and Figure', 25, 1, 'Preliminary'),
(34, 'Poise, Elegance, and Personality', 25, 2, 'Preliminary'),
(35, 'Intelligence', 40, 3, 'Preliminary'),
(36, 'Over All Impact', 10, 4, 'Preliminary');

-- --------------------------------------------------------

--
-- Table structure for table `sub_criteria_score`
--

CREATE TABLE `sub_criteria_score` (
  `id` int(11) NOT NULL,
  `sub_criteria_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `judge_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Indexes for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segment` (`segment`);

--
-- Indexes for table `sub_criteria_score`
--
ALTER TABLE `sub_criteria_score`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `final_score`
--
ALTER TABLE `final_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `judge`
--
ALTER TABLE `judge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;
--
-- AUTO_INCREMENT for table `sub_criteria`
--
ALTER TABLE `sub_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sub_criteria_score`
--
ALTER TABLE `sub_criteria_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
