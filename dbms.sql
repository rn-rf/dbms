-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: bms
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `Account` VALUES (101,'Shanivar Peth',26000.00),(102,'Lokmanya Nagar',5500.00),(103,'Charni Road',16000.00),(104,'Kalyani Nagar',31000.00),(105,'Seawoods',9500.00);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrower`
--

DROP TABLE IF EXISTS `Borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `Borrower` VALUES ('Aryan Rathod',201),('Palash Yadav',202),('Mitali Desai',203),('Tejas Gokhale',204),('Krupa Joshi',205);
/*!40000 ALTER TABLE `Borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branch` (
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL DEFAULT 'Pune',
  `assets` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branch`
--

LOCK TABLES `Branch` WRITE;
/*!40000 ALTER TABLE `Branch` DISABLE KEYS */;
INSERT INTO `Branch` VALUES ('Charni Road','Mumbai',7600000.00),('Kalyani Nagar','Pune',6300000.00),('Lokmanya Nagar','Nagpur',5800000.00),('Seawoods','Navi Mumbai',8400000.00),('Shanivar Peth','Pune',9200000.00);
/*!40000 ALTER TABLE `Branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `Customer` VALUES ('Aryan Rathod','Sinhagad Road','Pune'),('Krupa Joshi','Sector 29','Navi Mumbai'),('Mitali Desai','JM Road','Pune'),('Palash Yadav','Gandhibagh','Nagpur'),('Tejas Gokhale','Marine Lines','Mumbai');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Depositor`
--

DROP TABLE IF EXISTS `Depositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `Depositor` VALUES ('Aryan Rathod',101),('Palash Yadav',102),('Tejas Gokhale',103),('Mitali Desai',104),('Krupa Joshi',105);
/*!40000 ALTER TABLE `Depositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `Loan` VALUES (201,'Shanivar Peth',140000.00),(202,'Lokmanya Nagar',99000.00),(203,'Kalyani Nagar',128000.00),(204,'Charni Road',108000.00),(205,'Seawoods',133000.00);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `View1`
--

DROP TABLE IF EXISTS `View1`;
/*!50001 DROP VIEW IF EXISTS `View1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View1` AS SELECT 
 1 AS `cust_name`,
 1 AS `cust_street`,
 1 AS `cust_city`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View2`
--

DROP TABLE IF EXISTS `View2`;
/*!50001 DROP VIEW IF EXISTS `View2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View2` AS SELECT 
 1 AS `branch_name`,
 1 AS `assets`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `View3`
--

DROP TABLE IF EXISTS `View3`;
/*!50001 DROP VIEW IF EXISTS `View3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `View3` AS SELECT 
 1 AS `acc_no`,
 1 AS `loan_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `View1`
--

/*!50001 DROP VIEW IF EXISTS `View1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `View1` AS select distinct `c`.`cust_name` AS `cust_name`,`c`.`cust_street` AS `cust_street`,`c`.`cust_city` AS `cust_city` from ((`Customer` `c` join `Borrower` `b` on((`c`.`cust_name` = `b`.`cust_name`))) join `Loan` `l` on((`b`.`loan_no` = `l`.`loan_no`))) where (`l`.`branch_name` = 'Kalyani Nagar') order by `c`.`cust_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View2`
--

/*!50001 DROP VIEW IF EXISTS `View2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `View2` AS select `Branch`.`branch_name` AS `branch_name`,`Branch`.`assets` AS `assets` from `Branch` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `View3`
--

/*!50001 DROP VIEW IF EXISTS `View3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `View3` AS select `Depositor`.`acc_no` AS `acc_no`,`Borrower`.`loan_no` AS `loan_no` from (`Depositor` join `Borrower` on((`Depositor`.`cust_name` = `Borrower`.`cust_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 12:08:27
