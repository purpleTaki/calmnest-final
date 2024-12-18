-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 04:00 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calmnest`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `ID` int(12) NOT NULL,
  `appointer_name` varchar(255) NOT NULL,
  `studID` int(12) NOT NULL,
  `counselorID` int(12) NOT NULL,
  `Date` date NOT NULL,
  `Time` time(4) NOT NULL,
  `fromTime` time NOT NULL,
  `toTime` time NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(20) NOT NULL DEFAULT 'Pending' COMMENT '0 - pending / 1 - approved / 2 - denied\r\n',
  `DateStatus` datetime NOT NULL,
  `appointer` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - student / 1 - counselor',
  `Remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`ID`, `appointer_name`, `studID`, `counselorID`, `Date`, `Time`, `fromTime`, `toTime`, `DateAdded`, `Status`, `DateStatus`, `appointer`, `Remarks`) VALUES
(1, 'Apple Joy Montebon', 32, 30, '2024-12-14', '00:00:00.0000', '13:00:00', '14:00:00', '2024-12-12 15:45:36', '2', '0000-00-00 00:00:00', 0, ' '),
(2, 'Ramel Castillo', 32, 30, '2024-12-28', '00:00:00.0000', '08:00:00', '09:00:00', '2024-12-12 23:50:57', '2', '0000-00-00 00:00:00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `archivedarticles`
--

CREATE TABLE `archivedarticles` (
  `Title` varchar(255) NOT NULL,
  `ShortDec` varchar(255) NOT NULL,
  `Link` varchar(255) NOT NULL,
  `articleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_article`
--

CREATE TABLE `tbl_article` (
  `Title` varchar(255) NOT NULL,
  `ShortDes` varchar(255) NOT NULL,
  `Link` varchar(255) NOT NULL,
  `ID` int(11) NOT NULL,
  `archived` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_article`
--

INSERT INTO `tbl_article` (`Title`, `ShortDes`, `Link`, `ID`, `archived`, `date_added`) VALUES
('date', 'date', 'tdate', 13, '0', '2024-12-16 00:00:00'),
('4', '4', '4', 14, '', '2024-12-09 00:00:00'),
('ANNOUNCEMENT', 'ANNOUNCMENT', 'ANNOUNCEMENT', 15, '', '2024-12-18 10:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mood_base`
--

CREATE TABLE `tbl_mood_base` (
  `ID` int(11) NOT NULL,
  `Mood` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_mood_base`
--

INSERT INTO `tbl_mood_base` (`ID`, `Mood`) VALUES
(1, 'Happy'),
(2, 'Normal'),
(3, 'Sad'),
(4, 'Depressed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `locker` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `yearSection` varchar(255) DEFAULT NULL,
  `contact_num` varchar(11) DEFAULT NULL,
  `dpt` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `cnum` varchar(50) NOT NULL,
  `usertype` tinyint(2) NOT NULL COMMENT '0-student 1-counselor 2-admin',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1- active 0-disabled',
  `notif` int(10) NOT NULL DEFAULT 1 COMMENT '1-acknowledge / 0-threshold met / 2-acknowledged'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `username`, `password`, `locker`, `email`, `sex`, `yearSection`, `contact_num`, `dpt`, `fname`, `mname`, `lname`, `cnum`, `usertype`, `date_created`, `active`, `notif`) VALUES
(5, '1920577', '123', '', 'cCydil@gmail.com', 'Croissant ', 'Grade 1', NULL, 'CET', 'Cydillll', 'De', 'Cursed', '012345678', 0, '2023-11-14 19:41:03', 1, 1),
(8, 'admin', 'd5f9267f4cb33187531a9fff4f94f4927312f4e6', 'iuwI8ABj.5i<ppi*nN\\v@1?8SDlTzKMnO\\Vqs916lH%<Ijr$*F', '123@123', 'male', 'Admin', NULL, 'Staff', 'Admin', '', 'System', '', 2, '2023-11-14 19:41:03', 1, 1),
(9, 'Counselor', 'de2b4b536d18608d448945eaa7b7fed3862a97ca', 'XAFUnu1I^qv7HvY./lz6%zLKKnLrp0GGn7yQ%X!Nww8W?ht?ZJ', 'counselor@gmail.com', 'Male', NULL, NULL, 'Staff', 'Counselor', 'of', 'Counselees', '123456789', 1, '2023-11-14 19:41:03', 1, 2),
(10, '1920501', 'd8f54d59db3479d49ce76a59bffe42c29f7dc98b', 'nYR31)tl1RzLbajqDHA1yC?brOr3%/iZowipa~c4k1w!s68pV$', 'o@l', 'male', 'BSIT1D', NULL, 'CET', 'Oompaa', 'Loompa', 'Villee', '', 0, '2023-11-14 21:28:52', 1, 0),
(26, 'counselor', '737b9d2e8e22a633bf73e73353eb64a23dcadcaf', 'a$4@^GMCi6SqQeKQ#GhSRiUE>qiiZ1w^%gy$xPKO%P)QoYT8$i', 'email@email', 'male', 'Counselor', NULL, 'Staff', 'Doctor', 'D', 'Quack', '', 1, '2023-11-16 19:58:04', 1, 1),
(27, '1920088', '57053fd3448fd5492dc12087fad2572550d61732', 'z0I>!O1&u3LsS^c4#^@j@3P<(NnW6nr.Rzfj0WY)ZyVTj$IizG', 'njordu@gmail.com', 'male', 'BSIT-8A', NULL, 'CET', 'Njord', 'A', 'Johansen', '', 0, '2023-11-29 20:08:16', 1, 1),
(28, 'secalob', 'b5e5fdcbdc561f22e69b01c499314a235586111b', '>wtTn2*1Mmf)GGg9O2k7(a9fhg95ytCqBFlLf^(J?OYe<pYR^W', 'e2@e', 'female', 'Secretary', '12312312312', 'Staff', 's', 's', 's', '', 3, '2023-12-15 14:19:00', 1, 1),
(29, 'testkol', '230249499583e455b3708fa822cc40d5e5a4ffdb', 'SIF!39etn^lMGqje2r(ks1PRYUhwL6XGB#~r1v?Ib*)PWsxBq<', 'e@eeewew', 'male', 'POSPOD', '09091231231', 'CET', 'TESTETEST', 'TESTESTSE', 'ESTESTSET', '', 0, '2023-12-15 18:49:50', 1, 1),
(30, '1921777', '56f84b022e37ae8fe6def42e8e167e3cba65e370', 'Ygct1o(UQ!C$hFOV$iKgcjV%/B4%ut7zl\\$t#4spM1OytiRh<7', 's1921777@usls.edu.ph', 'male', 'Counselor', NULL, 'Staff', 'Ramel', 'P', 'Castillo', '', 1, '2024-04-23 09:22:35', 1, 2),
(31, 'secccc', '2b4455041ff75e3f0bf32acbd9bf5fe1c8323f5d', '75ed8I9pCrkghVFANh~ZFT~9VMss$c9cg)>z/ul^#wNomxE)<L', 'sec@gmail.com', 'female', 'Secretary', NULL, 'Staff', 'sec', 'sec', 'sec', '', 3, '2024-10-09 18:12:47', 0, 1),
(32, 'apol', '3b0a4be01e891e1e0c37acc3182aea0a5e47374b', '1~CyNXXCA9OFY~$O#@#P<yM/I\\0@DW)kaN4$Sc#D!Bvs@~Uj#X', 's1921874@usls.edu.ph', 'female', 'BSIT4C', NULL, 'CET', 'Apple Joy', 'D', 'Montebon', '', 0, '2024-11-09 14:32:48', 1, 1),
(33, 'test', 'bdb55959de93f009af4475c4cef09c5dd7213000', 'B<zQ8tI3YOj$)mxg1/u5edxqtvtzycK9<eLXo/bq><Qr7g^5Ux', 'test@testmail.com', 'male', 'Test', NULL, 'CAS', 'test user', 'user', 'test', 'testtest', 0, '2024-11-30 20:35:55', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_mood`
--

CREATE TABLE `tbl_user_mood` (
  `ID` int(11) NOT NULL,
  `User` varchar(20) NOT NULL,
  `Mood` int(4) NOT NULL,
  `Points` int(5) NOT NULL,
  `DateAdded` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user_mood`
--

INSERT INTO `tbl_user_mood` (`ID`, `User`, `Mood`, `Points`, `DateAdded`) VALUES
(1, '10', 4, 2, '2023-11-20 21:47:04'),
(2, '10', 3, 1, '2023-11-20 21:52:27'),
(3, '10', 4, 2, '2023-11-20 22:19:06'),
(4, '10', 3, 1, '2023-11-20 23:30:15'),
(5, '10', 4, 2, '2023-11-21 00:08:06'),
(6, '10', 4, 2, '2023-11-21 00:08:11'),
(7, '10', 4, 2, '2023-11-21 00:08:21'),
(8, '10', 4, 2, '2023-11-21 00:08:32'),
(9, '10', 4, 2, '2023-11-21 00:08:36'),
(10, '10', 1, -2, '2023-11-21 15:55:27'),
(11, '10', 1, -2, '2023-11-25 23:41:25'),
(12, '10', 4, 2, '0000-00-00 00:00:00'),
(13, '10', 4, 2, '0000-00-00 00:00:00'),
(14, '10', 4, 2, '0000-00-00 00:00:00'),
(15, '10', 4, 2, '0000-00-00 00:00:00'),
(16, '10', 4, 2, '0000-00-00 00:00:00'),
(17, '10', 1, -2, '0000-00-00 00:00:00'),
(18, '10', 4, 2, '0000-00-00 00:00:00'),
(19, '10', 4, 2, '0000-00-00 00:00:00'),
(20, '10', 4, 2, '0000-00-00 00:00:00'),
(21, '10', 4, 2, '0000-00-00 00:00:00'),
(22, '10', 4, 2, '0000-00-00 00:00:00'),
(23, '10', 4, 2, '0000-00-00 00:00:00'),
(24, '10', 1, -2, '0000-00-00 00:00:00'),
(25, '10', 3, 1, '0000-00-00 00:00:00'),
(26, '10', 1, -2, '0000-00-00 00:00:00'),
(27, '10', 4, 2, '2024-01-11 00:00:10'),
(28, '10', 3, 1, '2024-01-11 00:01:13'),
(29, '10', 3, 1, '2024-01-11 00:02:12'),
(30, '10', 4, 2, '2024-01-11 00:50:23'),
(31, '10', 4, 2, '2024-01-11 00:50:31'),
(32, '10', 3, 1, '2024-01-11 00:56:53'),
(33, '10', 1, -2, '2024-01-11 01:03:57'),
(34, '10', 4, 2, '2024-01-11 01:05:02'),
(35, '10', 4, 2, '2024-01-11 01:05:07'),
(36, '10', 4, 2, '2024-01-11 01:07:02'),
(37, '10', 3, 1, '2024-01-11 01:07:07'),
(38, '10', 4, 2, '2024-01-11 01:07:13'),
(39, '10', 4, 2, '2024-01-11 01:07:16'),
(40, '10', 4, 2, '2024-01-11 01:07:20'),
(41, '10', 3, 1, '2024-01-11 01:07:56'),
(42, '10', 4, 2, '2024-01-11 02:05:08'),
(43, '30', 1, -2, '2024-04-23 10:25:28'),
(44, '30', 4, 2, '2024-04-23 10:25:31'),
(45, '30', 4, 2, '2024-04-23 10:27:25'),
(46, '30', 4, 2, '2024-04-23 10:27:27'),
(47, '30', 4, 2, '2024-04-23 10:27:30'),
(48, '30', 4, 2, '2024-04-23 10:27:32'),
(49, '30', 4, 2, '2024-04-23 10:27:36'),
(50, '30', 4, 2, '2024-04-23 10:27:39'),
(51, '30', 4, 2, '2024-04-23 10:27:41'),
(52, '30', 4, 2, '2024-04-23 10:27:43'),
(53, '30', 4, 2, '2024-04-23 10:27:46'),
(54, '30', 4, 2, '2024-04-23 10:27:48'),
(55, '30', 4, 2, '2024-04-23 10:27:51'),
(56, '30', 4, 2, '2024-04-23 10:27:53'),
(57, '30', 4, 2, '2024-04-23 10:27:55'),
(58, '30', 4, 2, '2024-04-23 10:28:09'),
(59, '30', 4, 2, '2024-04-23 10:28:11'),
(60, '30', 4, 2, '2024-04-23 10:28:14'),
(61, '30', 4, 2, '2024-04-23 10:28:16'),
(62, '30', 4, 2, '2024-04-23 10:29:20'),
(63, '30', 1, -2, '2024-04-23 10:30:04'),
(64, '30', 4, 2, '2024-04-23 10:30:46'),
(65, '30', 4, 2, '2024-09-21 20:05:30'),
(66, '30', 1, -2, '2024-09-21 20:05:59'),
(67, '30', 2, -1, '2024-09-21 20:06:12'),
(68, '32', 1, -2, '2024-11-27 01:09:31'),
(69, '32', 4, 2, '2024-11-27 01:13:07'),
(70, '32', 2, -1, '2024-12-05 23:46:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `archivedarticles`
--
ALTER TABLE `archivedarticles`
  ADD PRIMARY KEY (`articleID`);

--
-- Indexes for table `tbl_article`
--
ALTER TABLE `tbl_article`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_mood_base`
--
ALTER TABLE `tbl_mood_base`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_user_mood`
--
ALTER TABLE `tbl_user_mood`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `archivedarticles`
--
ALTER TABLE `archivedarticles`
  MODIFY `articleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_article`
--
ALTER TABLE `tbl_article`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_mood_base`
--
ALTER TABLE `tbl_mood_base`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_user_mood`
--
ALTER TABLE `tbl_user_mood`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
