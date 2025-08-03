/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: DBMS
-- ------------------------------------------------------
-- Server version	8.4.5-5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `acc_no` int NOT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`acc_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Account` VALUES
(101,'Shanivar Peth',26000.00),
(102,'Lokmanya Nagar',5500.00),
(103,'Charni Road',16000.00),
(104,'Kalyani Nagar',31000.00),
(105,'Seawoods',9500.00);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `Borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrower` (
  `cust_name` varchar(50) NOT NULL,
  `loan_no` int NOT NULL,
  PRIMARY KEY (`cust_name`,`loan_no`),
  KEY `loan_no` (`loan_no`),
  CONSTRAINT `Borrower_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Borrower_ibfk_2` FOREIGN KEY (`loan_no`) REFERENCES `Loan` (`loan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrower`
--

LOCK TABLES `Borrower` WRITE;
/*!40000 ALTER TABLE `Borrower` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Borrower` VALUES
('Aryan Rathod',201),
('Palash Yadav',202),
('Mitali Desai',203),
('Tejas Gokhale',204),
('Krupa Joshi',205);
/*!40000 ALTER TABLE `Borrower` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL,
  `assets` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Branch` VALUES
('Charni Road','Mumbai',7600000.00),
('Kalyani Nagar','Pune',6300000.00),
('Lokmanya Nagar','Nagpur',5800000.00),
('Seawoods','Navi Mumbai',8400000.00),
('Shanivar Peth','Pune',9200000.00);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `cust_name` varchar(50) NOT NULL,
  `cust_street` varchar(100) NOT NULL,
  `cust_city` varchar(50) NOT NULL,
  PRIMARY KEY (`cust_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Customer` VALUES
('Aryan Rathod','Sinhagad Road','Pune'),
('Krupa Joshi','Sector 29','Navi Mumbai'),
('Mitali Desai','JM Road','Pune'),
('Palash Yadav','Gandhibagh','Nagpur'),
('Tejas Gokhale','Marine Lines','Mumbai');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Depositor` (
  `cust_name` varchar(50) NOT NULL,
  `acc_no` int NOT NULL,
  PRIMARY KEY (`cust_name`,`acc_no`),
  KEY `acc_no` (`acc_no`),
  CONSTRAINT `Depositor_ibfk_1` FOREIGN KEY (`cust_name`) REFERENCES `Customer` (`cust_name`),
  CONSTRAINT `Depositor_ibfk_2` FOREIGN KEY (`acc_no`) REFERENCES `Account` (`acc_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Depositor`
--

LOCK TABLES `Depositor` WRITE;
/*!40000 ALTER TABLE `Depositor` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Depositor` VALUES
('Aryan Rathod',101),
('Palash Yadav',102),
('Tejas Gokhale',103),
('Mitali Desai',104),
('Krupa Joshi',105);
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan` (
  `loan_no` int NOT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`loan_no`),
  KEY `branch_name` (`branch_name`),
  CONSTRAINT `Loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `Branch` (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Loan` VALUES
(201,'Shanivar Peth',140000.00),
(202,'Lokmanya Nagar',99000.00),
(203,'Kalyani Nagar',128000.00),
(204,'Charni Road',108000.00),
(205,'Seawoods',133000.00);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-08-04  2:36:27
