-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2018 at 02:49 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
(26, 'SAREMO', 'LOVE KUHREEN', 'B.', 'Ms', 1, 'Yes', 'Yes'),
(27, 'NODA', 'MARISOL', 'D.', 'Ms', 2, 'Yes', 'Yes'),
(28, 'MIDAY', 'SALVACION', 'D.', 'Ms', 3, 'Yes', 'Yes'),
(29, 'CERDON', 'DANICA', 'A.', 'Ms', 4, 'Yes', 'No'),
(30, 'BARCELA', 'ZAIRAH SHANE', 'J', 'Ms', 5, 'Yes', 'No'),
(31, 'RELLEVE', 'KASANDRA', 'R.', 'Ms', 6, 'Yes', 'No'),
(32, 'BALGEMINO', 'IMARI LENE', 'A.', 'Ms', 7, 'Yes', 'No'),
(33, 'GUEVARRA', 'KAYE ANGELIQUE', 'A.', 'Ms', 8, 'Yes', 'No'),
(34, 'SALES', 'KRYSTEL', 'A.', 'Ms', 9, 'Yes', 'No'),
(35, 'CHAVEZ', 'JAMAECA KIM', 'B.', 'Ms', 10, 'Yes', 'No'),
(36, 'FAJARDO', 'CARMINA', 'S.', 'Ms', 11, 'Yes', 'No'),
(37, 'ABAY', 'ANCELA KARLA', 'G.', 'Ms', 12, 'Yes', 'No'),
(38, 'LLORIN', 'MAISIE MAUREEN', 'S.', 'Ms', 13, 'Yes', 'No'),
(39, 'CLORADO', 'JANDEL', 'S.', 'Ms', 14, 'Yes', 'No'),
(41, 'SOLIMAN', 'JANE ASHLEY', 'S.', 'Ms', 15, 'Yes', 'No'),
(42, 'BULACAN', 'RIZA', 'D.', 'Ms', 16, 'Yes', 'No'),
(43, 'COLLAO', 'RICAMAE', 'P.', 'Ms', 17, 'Yes', 'No'),
(47, 'SOLTES', 'MELANIE CHARLENE', 'R.', 'Ms', 18, 'Yes', 'No'),
(48, 'CORDIAL', 'JEMINA NICOLE', 'B.', 'Ms', 19, 'Yes', 'No'),
(49, 'PLOTADO', 'PRINCESS JANE', 'B.', 'Ms', 20, 'Yes', 'No'),
(50, 'CORALDE', 'JAMIE', 'M.', 'Ms', 21, 'Yes', 'No'),
(51, 'CARTUJANO', 'DARA SOFIA', 'A.', 'Ms', 22, 'Yes', 'No'),
(52, 'SABADO', 'LEA JOY', 'M.', 'Ms', 23, 'Yes', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
