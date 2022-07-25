-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 09:27 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hydroex`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `cont_num` varchar(11) DEFAULT NULL,
  `pwd` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `prof_img` varchar(100) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `fname`, `lname`, `address`, `cont_num`, `pwd`, `email`, `prof_img`, `create_datetime`) VALUES
(1, 'loji', 'jffh', 'fhfhf', '7676', '04e70ac3e001a87ae5cd73199372f57c', 'titit@papa.com', 'P8.gif', '2022-01-21 10:44:58'),
(2, 'Chauncey', 'Dupdup', 'Hiragis, CDOC', '3300778', '81dc9bdb52d04dc20036dbd8313ed055', 'sev@daliza.com', 'P4.png', '2022-01-26 21:18:10'),
(3, 'Brey', 'Banaag', 'Sitio Sto. Niño, Lapasan', '09750835431', '7c51796981066ad39135f86bfcc1d8fe', 'breybanaag@gmail.com', 'P5.png', '2022-01-27 09:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delv_id` int(11) NOT NULL,
  `trans_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delv_id`, `trans_id`, `cust_id`, `address`) VALUES
(5, 12, 1, NULL),
(6, 25, 2, NULL),
(7, 39, 3, NULL),
(8, 41, 3, NULL),
(9, 42, 3, NULL),
(10, 43, 3, NULL),
(11, 44, 3, NULL),
(12, 45, 3, NULL),
(13, 46, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_approved`
--

CREATE TABLE `order_approved` (
  `OrderID` int(100) NOT NULL,
  `TransactionID` int(100) NOT NULL,
  `Total` int(100) NOT NULL,
  `AquaBest` int(100) NOT NULL,
  `NatureSpring` int(100) NOT NULL,
  `HavensDwell` int(100) NOT NULL,
  `PalmFresh` int(100) NOT NULL,
  `Viel` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_approved`
--

INSERT INTO `order_approved` (`OrderID`, `TransactionID`, `Total`, `AquaBest`, `NatureSpring`, `HavensDwell`, `PalmFresh`, `Viel`) VALUES
(46, 82, 2059, 325, 58, 1112, 147, 398),
(7, 12, 168, 0, 0, 0, 0, 0),
(8, 25, 197, 0, 0, 0, 0, 0),
(12, 43, 78, 0, 0, 0, 0, 0),
(45, 81, 2059, 325, 0, 0, 147, 0),
(32, 63, 827, 0, 0, 0, 0, 0),
(33, 64, 827, 0, 0, 0, 0, 0),
(34, 65, 827, 0, 0, 0, 0, 0),
(35, 66, 827, 0, 0, 0, 0, 0),
(36, 67, 827, 0, 0, 0, 0, 0),
(44, 80, 2059, 325, 0, 0, 147, 0),
(43, 79, 846, 113, 0, 0, 714, 0),
(42, 73, 827, 113, 0, 0, 714, 0),
(41, 72, 827, 45, 0, 0, 158, 0),
(40, 71, 827, 0, 0, 0, 158, 0),
(39, 70, 827, 0, 0, 0, 0, 0),
(38, 69, 827, 0, 0, 0, 0, 0),
(37, 68, 827, 0, 0, 0, 0, 0),
(31, 62, 827, 0, 0, 0, 0, 0),
(30, 61, 102, 0, 0, 0, 0, 0),
(29, 60, 102, 0, 0, 0, 0, 0),
(28, 59, 102, 0, 0, 0, 0, 0),
(53, 46, 48, 0, 29, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `trans_id` int(11) DEFAULT NULL,
  `order_total` float DEFAULT NULL,
  `aqb_tot` float DEFAULT NULL,
  `ns_tot` float DEFAULT NULL,
  `hd_tot` float DEFAULT NULL,
  `pf_tot` float DEFAULT NULL,
  `v_tot` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `trans_id`, `order_total`, `aqb_tot`, `ns_tot`, `hd_tot`, `pf_tot`, `v_tot`) VALUES
(47, 39, 78, 0, 29, 30, 0, 0),
(48, 41, 48, 0, 29, 0, 0, 0),
(49, 42, 48, 0, 29, 0, 0, 0),
(50, 43, 48, 0, 29, 0, 0, 0),
(51, 44, 48, 0, 29, 0, 0, 0),
(52, 45, 48, 0, 29, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `trans_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amt_paid` float DEFAULT NULL,
  `date_paid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `desc`, `img`) VALUES
(1, 'Palm Fresh Purified Water', 'Purified, 18.9L', 'WI1.png'),
(2, 'Nature\'s Spring Purified Water', 'Purified, 18.9L', 'WI1.png'),
(3, 'Aquabest Purified Water', 'Purified, 18.9L', 'WI1.png'),
(4, 'Haven\'s Dwelling Purified Water', 'Purified, 18.9L', 'WI1.png'),
(5, 'Palm Fresh Distilled Water', 'Distilled, 10.0L', 'WI4.png'),
(6, 'Nature\'s Spring Distilled Water', 'Distilled, 10.0L', 'WI4.png'),
(7, 'Aquabest Distilled Water', 'Distilled, 10.0L', 'WI4.png'),
(8, 'Haven\'s Dwelling Distilled Water', 'Distilled, 10.0L', 'WI4.png'),
(9, 'Palm Fresh Alkaline Water', 'Alkaline, 3.2 L', 'WI3.png'),
(10, 'Nature\'s Spring Alkaline Water', 'Alkaline, 3.2 L', 'WI3.png'),
(11, 'Aquabest Alkaline Water', 'Alkaline, 3.2 L', 'WI3.png'),
(12, 'Haven\'s Dwelling Alkaline Water', 'Alkaline, 3.2 L', 'WI3.png'),
(13, 'Palm Fresh Bottled Water', 'Bottled, 600mL x 16', 'WI2.png'),
(14, 'Nature\'s Spring Bottled Water', 'Bottled, 600mL x 16', 'WI2.png'),
(15, 'Aquabest Bottled Water', 'Bottled, 600mL x 16', 'WI2.png'),
(16, 'Haven\'s Dwelling Bottled Water', 'Bottled, 600mL x 16', 'WI2.png'),
(17, 'Viel Sparkling Water', 'Others, 1.2L', 'WI6.png'),
(18, 'Viel Sparkling Water', 'Others, 1.2L', 'WI7.png'),
(19, 'Viel Sparkling Water', 'Others, 1.2L', 'WI8.png'),
(20, 'Viel Sparkling Water', 'Others, 3.1L', 'WI6.png');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `trns_date` date DEFAULT NULL,
  `trns_type` varchar(50) DEFAULT NULL,
  `OR_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `customer_id`, `trns_date`, `trns_type`, `OR_num`) VALUES
(12, 1, '2022-01-26', NULL, NULL),
(13, 1, '2022-01-26', NULL, NULL),
(14, 1, '2022-01-26', NULL, NULL),
(15, 1, '2022-01-26', NULL, NULL),
(16, 1, '2022-01-26', NULL, NULL),
(17, 1, '2022-01-26', NULL, NULL),
(18, 1, '2022-01-26', NULL, NULL),
(19, 1, '2022-01-26', NULL, NULL),
(20, 1, '2022-01-26', NULL, NULL),
(21, 1, '2022-01-26', NULL, NULL),
(22, 1, '2022-01-26', NULL, NULL),
(23, 1, '2022-01-26', NULL, NULL),
(24, 1, '2022-01-26', NULL, NULL),
(25, 2, '2022-01-26', NULL, NULL),
(26, 2, '2022-01-26', NULL, NULL),
(27, 2, '2022-01-26', NULL, NULL),
(28, 2, '2022-01-26', NULL, NULL),
(29, 2, '2022-01-26', NULL, NULL),
(30, 2, '2022-01-26', NULL, NULL),
(31, 2, '2022-01-26', NULL, NULL),
(32, 2, '2022-01-26', NULL, NULL),
(33, 2, '2022-01-26', NULL, NULL),
(34, 1, '2022-01-26', NULL, NULL),
(35, 1, '2022-01-26', NULL, NULL),
(36, 1, '2022-01-26', NULL, NULL),
(37, 1, '2022-01-26', NULL, NULL),
(38, 3, '2022-01-27', NULL, NULL),
(39, 3, '2022-01-27', NULL, NULL),
(40, 3, '2022-01-27', NULL, NULL),
(41, 3, '2022-01-27', NULL, NULL),
(42, 3, '2022-01-27', NULL, NULL),
(43, 3, '2022-01-27', NULL, NULL),
(44, 3, '2022-01-27', NULL, NULL),
(45, 3, '2022-01-27', NULL, NULL),
(46, 3, '2022-01-27', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `water_stations`
--

CREATE TABLE `water_stations` (
  `station_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL DEFAULT '',
  `street` varchar(500) NOT NULL DEFAULT '',
  `brgy` varchar(500) NOT NULL DEFAULT '',
  `city` varchar(500) NOT NULL DEFAULT '',
  `province` varchar(500) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `water_stations`
--

INSERT INTO `water_stations` (`station_id`, `name`, `street`, `brgy`, `city`, `province`) VALUES
(1, 'Aquabest', '', '', '', ''),
(2, 'Havens Dwelling', '', '', '', ''),
(3, 'Natures Spring', '', '', '', ''),
(4, 'Palm Fresh', '', '', '', ''),
(5, 'Viel', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `water_station_product`
--

CREATE TABLE `water_station_product` (
  `wsid` int(11) NOT NULL,
  `station_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `water_station_product`
--

INSERT INTO `water_station_product` (`wsid`, `station_id`, `product_id`, `price`) VALUES
(1, 4, 1, 39),
(2, 3, 2, 29),
(3, 1, 3, 34),
(4, 2, 4, 30),
(5, 4, 5, 79),
(6, 3, 6, 75),
(7, 1, 7, 65),
(8, 2, 8, 59),
(9, 4, 9, 49),
(10, 3, 10, 39),
(11, 1, 11, 45),
(12, 2, 12, 40),
(13, 4, 13, 139),
(14, 3, 14, 129),
(15, 1, 15, 134),
(16, 2, 16, 139),
(17, 5, 17, 79),
(18, 5, 18, 79),
(19, 5, 19, 79),
(20, 5, 20, 199);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `cont_num` (`cont_num`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delv_id`),
  ADD KEY `cust_id_fk` (`cust_id`),
  ADD KEY `trans_id_fk3` (`trans_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `trans_id_fk` (`trans_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `trans_id_fk2` (`trans_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `customer_id_fk` (`customer_id`);

--
-- Indexes for table `water_stations`
--
ALTER TABLE `water_stations`
  ADD PRIMARY KEY (`station_id`);

--
-- Indexes for table `water_station_product`
--
ALTER TABLE `water_station_product`
  ADD PRIMARY KEY (`wsid`),
  ADD KEY `station_id_fk` (`station_id`),
  ADD KEY `product_id_fk` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `water_stations`
--
ALTER TABLE `water_stations`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `water_station_product`
--
ALTER TABLE `water_station_product`
  MODIFY `wsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `cust_id_fk` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trans_id_fk3` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `trans_id_fk` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `trans_id_fk2` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `water_station_product`
--
ALTER TABLE `water_station_product`
  ADD CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `station_id_fk` FOREIGN KEY (`station_id`) REFERENCES `water_stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
