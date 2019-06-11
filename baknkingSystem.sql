-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.16 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for banking_system
CREATE DATABASE IF NOT EXISTS `banking_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banking_system`;

-- Dumping structure for table banking_system.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  ` ac_num` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  ` balance` decimal(10,4) NOT NULL DEFAULT '0.0000',
  ` ac_type` varchar(50) NOT NULL DEFAULT '0',
  ` ac_branch` varchar(50) NOT NULL DEFAULT '0',
  ` ifsc` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (` ac_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.branch
CREATE TABLE IF NOT EXISTS `branch` (
  `br_ name` varchar(50) NOT NULL,
  `br_ city` varchar(50) DEFAULT NULL,
  ` assets` decimal(10,4) DEFAULT NULL,
  ` num_employees` int(11) DEFAULT NULL,
  PRIMARY KEY (`br_ name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.customer
CREATE TABLE IF NOT EXISTS `customer` (
  ` account_num` bigint(20) unsigned NOT NULL,
  ` customer_full_name` varchar(50) NOT NULL,
  ` gender` varchar(50) NOT NULL,
  ` address` varchar(50) NOT NULL,
  ` age` int(11) NOT NULL,
  PRIMARY KEY (` customer_full_name`),
  KEY `FK_customer_account` (` account_num`),
  CONSTRAINT `FK_customer_account` FOREIGN KEY (` account_num`) REFERENCES `accounts` (` ac_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.deposit
CREATE TABLE IF NOT EXISTS `deposit` (
  `   acc_num` bigint(20) unsigned NOT NULL,
  ` date` datetime NOT NULL,
  ` dep_amount` decimal(10,4) NOT NULL,
  KEY `FK_deposit_account` (`   acc_num`),
  CONSTRAINT `FK_deposit_account` FOREIGN KEY (`   acc_num`) REFERENCES `accounts` (` ac_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_name` varchar(50) DEFAULT NULL,
  ` br_name` varchar(50) DEFAULT NULL,
  ` salary` decimal(10,4) DEFAULT NULL,
  ` emp_id` int(11) NOT NULL AUTO_INCREMENT,
  KEY ` emp_id` (` emp_id`),
  KEY `FK_employee_branch` (` br_name`),
  CONSTRAINT `FK_employee_branch` FOREIGN KEY (` br_name`) REFERENCES `branch` (`br_ name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.loan
CREATE TABLE IF NOT EXISTS `loan` (
  ` cust_name` varchar(50) NOT NULL,
  ` loan_num` bigint(20) NOT NULL AUTO_INCREMENT,
  ` loan_amount` decimal(10,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (` loan_num`),
  KEY `FK_loan_customer` (` cust_name`),
  KEY ` loan_num` (` loan_num`),
  CONSTRAINT `FK_loan_customer` FOREIGN KEY (` cust_name`) REFERENCES `customer` (` customer_full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.loan_return
CREATE TABLE IF NOT EXISTS `loan_return` (
  ` loan_num` bigint(20) DEFAULT NULL,
  ` status` varchar(50) DEFAULT NULL,
  ` pending_amount` decimal(10,4) DEFAULT NULL,
  KEY `FK_loan_return_loan` (` loan_num`),
  CONSTRAINT `FK_loan_return_loan` FOREIGN KEY (` loan_num`) REFERENCES `loan` (` loan_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
-- Dumping structure for table banking_system.withdraw
CREATE TABLE IF NOT EXISTS `withdraw` (
  ` acc_num` bigint(20) unsigned NOT NULL,
  ` date` datetime NOT NULL,
  `wd_amount` decimal(10,4) NOT NULL,
  KEY `FK_withdraw_account` (` acc_num`),
  CONSTRAINT `FK_withdraw_account` FOREIGN KEY (` acc_num`) REFERENCES `accounts` (` ac_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
