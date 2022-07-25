-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hydroex
CREATE DATABASE IF NOT EXISTS `hydroex` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `hydroex`;

-- Dumping structure for table hydroex.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `cont_num` varchar(11) DEFAULT NULL,
  `pwd` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `prof_img` varchar(100) DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cont_num` (`cont_num`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.customer: ~3 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`cust_id`, `fname`, `lname`, `address`, `cont_num`, `pwd`, `email`, `prof_img`, `create_datetime`) VALUES
	(1, 'loji', 'jffh', 'fhfhf', '7676', '04e70ac3e001a87ae5cd73199372f57c', 'titit@papa.com', 'P8.gif', '2022-01-21 10:44:58'),
	(2, 'Chauncey', 'Dupdup', 'Hiragis, CDOC', '3300778', '81dc9bdb52d04dc20036dbd8313ed055', 'sev@daliza.com', 'P4.png', '2022-01-26 21:18:10'),
	(3, 'Brey', 'Banaag', 'Sitio Sto. Niño, Lapasan', '09750835431', '7c51796981066ad39135f86bfcc1d8fe', 'breybanaag@gmail.com', 'P5.png', '2022-01-27 09:19:24'),
	(5, NULL, NULL, NULL, NULL, 'aabb2100033f0352fe7458e412495148', 'admin@hydroex.com', NULL, NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table hydroex.deliveries
CREATE TABLE IF NOT EXISTS `deliveries` (
  `delv_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`delv_id`),
  KEY `cust_id_fk` (`cust_id`),
  KEY `trans_id_fk3` (`trans_id`),
  CONSTRAINT `cust_id_fk` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trans_id_fk3` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.deliveries: ~0 rows (approximately)
DELETE FROM `deliveries`;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` (`delv_id`, `trans_id`, `cust_id`, `address`) VALUES
	(5, 12, 1, NULL),
	(6, 25, 2, NULL),
	(7, 39, 3, NULL),
	(8, 41, 3, NULL),
	(9, 42, 3, NULL),
	(10, 43, 3, NULL),
	(11, 44, 3, NULL),
	(12, 45, 3, NULL),
	(13, 46, 3, NULL),
	(14, 47, 1, NULL),
	(15, 48, 1, NULL);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;

-- Dumping structure for table hydroex.order_approved
CREATE TABLE IF NOT EXISTS `order_approved` (
  `OrderID` int(100) NOT NULL,
  `TransactionID` int(100) NOT NULL,
  `Total` int(100) NOT NULL,
  `AquaBest` int(100) NOT NULL,
  `NatureSpring` int(100) NOT NULL,
  `HavensDwell` int(100) NOT NULL,
  `PalmFresh` int(100) NOT NULL,
  `Viel` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.order_approved: ~23 rows (approximately)
DELETE FROM `order_approved`;
/*!40000 ALTER TABLE `order_approved` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `order_approved` ENABLE KEYS */;

-- Dumping structure for table hydroex.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` int(11) DEFAULT NULL,
  `order_total` float DEFAULT NULL,
  `aqb_tot` float DEFAULT NULL,
  `ns_tot` float DEFAULT NULL,
  `hd_tot` float DEFAULT NULL,
  `pf_tot` float DEFAULT NULL,
  `v_tot` float DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `trans_id_fk` (`trans_id`),
  CONSTRAINT `trans_id_fk` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.order_details: ~0 rows (approximately)
DELETE FROM `order_details`;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`order_id`, `trans_id`, `order_total`, `aqb_tot`, `ns_tot`, `hd_tot`, `pf_tot`, `v_tot`) VALUES
	(47, 39, 78, 0, 29, 30, 0, 0),
	(48, 41, 48, 0, 29, 0, 0, 0),
	(49, 42, 48, 0, 29, 0, 0, 0),
	(50, 43, 48, 0, 29, 0, 0, 0),
	(51, 44, 48, 0, 29, 0, 0, 0),
	(52, 45, 48, 0, 29, 0, 0, 0),
	(54, 47, 304, 135, 150, 0, 0, 0),
	(55, 48, 245, 68, 0, 0, 158, 0);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table hydroex.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amt_paid` float DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `trans_id_fk2` (`trans_id`),
  CONSTRAINT `trans_id_fk2` FOREIGN KEY (`trans_id`) REFERENCES `transaction` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.payment: ~0 rows (approximately)
DELETE FROM `payment`;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- Dumping structure for table hydroex.product
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.product: ~20 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table hydroex.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `trns_date` date DEFAULT NULL,
  `trns_type` varchar(50) DEFAULT NULL,
  `OR_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `customer_id_fk` (`customer_id`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.transaction: ~0 rows (approximately)
DELETE FROM `transaction`;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
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
	(46, 3, '2022-01-27', NULL, NULL),
	(47, 1, '2022-01-28', NULL, NULL),
	(48, 1, '2022-01-28', NULL, NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- Dumping structure for table hydroex.water_stations
CREATE TABLE IF NOT EXISTS `water_stations` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  `street` varchar(500) NOT NULL DEFAULT '',
  `brgy` varchar(500) NOT NULL DEFAULT '',
  `city` varchar(500) NOT NULL DEFAULT '',
  `province` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.water_stations: ~5 rows (approximately)
DELETE FROM `water_stations`;
/*!40000 ALTER TABLE `water_stations` DISABLE KEYS */;
INSERT INTO `water_stations` (`station_id`, `name`, `street`, `brgy`, `city`, `province`) VALUES
	(1, 'Aquabest', '', '', '', ''),
	(2, 'Havens Dwelling', '', '', '', ''),
	(3, 'Natures Spring', '', '', '', ''),
	(4, 'Palm Fresh', '', '', '', ''),
	(5, 'Viel', '', '', '', '');
/*!40000 ALTER TABLE `water_stations` ENABLE KEYS */;

-- Dumping structure for table hydroex.water_station_product
CREATE TABLE IF NOT EXISTS `water_station_product` (
  `wsid` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`wsid`),
  KEY `station_id_fk` (`station_id`),
  KEY `product_id_fk` (`product_id`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `station_id_fk` FOREIGN KEY (`station_id`) REFERENCES `water_stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table hydroex.water_station_product: ~0 rows (approximately)
DELETE FROM `water_station_product`;
/*!40000 ALTER TABLE `water_station_product` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `water_station_product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
