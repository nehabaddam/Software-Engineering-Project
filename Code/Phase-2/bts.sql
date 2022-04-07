-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 22, 2022 at 05:53 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bts`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `EmailId` varchar(150) NOT NULL,
  `ContactNumber` bigint(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `AdminName`, `EmailId`, `ContactNumber`, `password`, `updationDate`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', 1234567890, 'f925916e2754e5e03f75dd58a5733251', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(11, 2, 'in process', 'Assigned ', '2022-03-13 08:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `id` int(11) NOT NULL,
  `priorityType` varchar(255) DEFAULT NULL,
  `Description` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `priorityType`, `Description`, `postingDate`, `updationDate`) VALUES
(1, 'Low', '', NULL, NULL),
(2, 'Medium', '', NULL, NULL),
(3, 'High', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(4, 2, 1, 'dvs', ' Complaint', 'High', 'test', 'test', '', '2022-03-11 06:56:47', NULL, NULL),
(5, 2, 0, '', ' Complaint', 'High', 'test', 'test', '', '2022-03-11 06:57:27', NULL, NULL),
(6, 3, 0, '', ' Complaint', 'High', 'abc', 'abc', '', '2022-03-13 08:12:55', NULL, NULL),
(7, 2, 0, '', ' Complaint', 'High', 'dgsdgsdgsdz', 'dgsd', '', '2022-03-22 16:45:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblforwardhistory`
--

CREATE TABLE `tblforwardhistory` (
  `id` int(11) NOT NULL,
  `ComplaintNumber` bigint(12) DEFAULT NULL,
  `ForwardFrom` int(6) DEFAULT NULL,
  `ForwardTo` int(6) DEFAULT NULL,
  `ForwadDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblforwardhistory`
--

INSERT INTO `tblforwardhistory` (`id`, `ComplaintNumber`, `ForwardFrom`, `ForwardTo`, `ForwadDate`) VALUES
(1, 1, 1, 2, '2020-06-28 13:22:58'),
(2, 2, 1, 1, '2022-03-09 11:02:30'),
(3, 3, 1, 1, '2022-03-10 21:00:09'),
(4, 6, 2, 1, '2022-03-13 08:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadmin`
--

CREATE TABLE `tblsubadmin` (
  `id` int(11) NOT NULL,
  `SubAdminName` varchar(150) DEFAULT NULL,
  `Department` varchar(150) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `ContactNumber` bigint(12) DEFAULT NULL,
  `UserName` varchar(12) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadmin`
--

INSERT INTO `tblsubadmin` (`id`, `SubAdminName`, `Department`, `EmailId`, `ContactNumber`, `UserName`, `Password`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(1, 'Anuj kumar', 'Information Technology', 'test@gmail.com', 1234567890, 'anujk30', '5c428d8875d2948607f3e3fe134d71b4', '2020-06-28 13:00:51', '2020-06-28 13:01:20', 1),
(2, 'Test subadmin', 'Finace', 'testsa@gmail.com', 1234567890, 'testsa', 'f925916e2754e5e03f75dd58a5733251', '2020-06-28 13:22:17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadminremark`
--

CREATE TABLE `tblsubadminremark` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `ComplainStatus` varchar(20) DEFAULT NULL,
  `ComplainRemark` mediumtext DEFAULT NULL,
  `RemarkBy` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadminremark`
--

INSERT INTO `tblsubadminremark` (`id`, `ComplainNumber`, `ComplainStatus`, `ComplainRemark`, `RemarkBy`, `PostingDate`) VALUES
(1, 1, 'closed', 'Complaint closed.', 2, '2020-06-28 13:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(3, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 13:19:32', '28-06-2020 06:51:17 PM', 1),
(4, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 14:12:03', '', 1),
(5, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-09 10:52:47', '09-03-2022 04:27:33 PM', 1),
(6, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-09 11:01:22', '', 1),
(7, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-10 20:58:53', '11-03-2022 02:37:09 AM', 1),
(8, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-11 06:32:00', '', 1),
(9, 3, 'test1@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-13 07:51:22', '13-03-2022 01:41:29 PM', 1),
(10, 3, 'test1@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-13 08:11:48', '13-03-2022 01:52:54 PM', 1),
(11, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-13 08:23:10', '13-03-2022 01:56:58 PM', 1),
(12, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-13 08:28:47', '', 1),
(13, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2022-03-22 16:43:42', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Anuj kumar', 'phptest@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567890, NULL, NULL, NULL, NULL, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-27 19:14:17', NULL, 1),
(2, 'Test user', 'testuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567899, 'New Delhi', 'Delhi', 'India', 110091, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-28 13:19:15', NULL, 1),
(3, 'Test', 'test1@gmail.com', '900150983cd24fb0d6963f7d28e17f72', 123, 'abc', 'abc', 'abc', 241, NULL, '2022-03-13 07:50:59', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
