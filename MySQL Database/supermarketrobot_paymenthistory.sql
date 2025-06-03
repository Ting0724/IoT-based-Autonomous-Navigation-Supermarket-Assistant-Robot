-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supermarketrobot
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `paymenthistory`
--

DROP TABLE IF EXISTS `paymenthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenthistory` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `Toothpaste` int DEFAULT NULL,
  `Shampoo` int DEFAULT NULL,
  `Soap` int DEFAULT NULL,
  `Toilet paper` int DEFAULT NULL,
  `Laundry detergent` int DEFAULT NULL,
  `Dishwashing liquid` int DEFAULT NULL,
  `Facial tissues` int DEFAULT NULL,
  `Trash bags` int DEFAULT NULL,
  `Aluminum foil` int DEFAULT NULL,
  `Plastic wrap` int DEFAULT NULL,
  `Cleaning spray` int DEFAULT NULL,
  `Hand sanitizer` int DEFAULT NULL,
  `Total price` decimal(65,0) DEFAULT NULL,
  `Useremail` varchar(225) DEFAULT NULL,
  `Sendaction` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenthistory`
--

LOCK TABLES `paymenthistory` WRITE;
/*!40000 ALTER TABLE `paymenthistory` DISABLE KEYS */;
INSERT INTO `paymenthistory` VALUES (1,'2024-05-22 16:15:55',1,0,3,1,1,0,1,0,0,0,0,0,45,'1001954392@ucsiuniversity.edu.my',0),(2,'2024-05-22 19:33:13',3,1,1,0,0,2,2,0,2,0,2,0,83,'1001954392@ucsiuniversity.edu.my',0),(3,'2024-05-22 20:01:13',6,0,0,0,0,0,0,0,0,0,0,0,30,'1001954392@ucsiuniversity.edu.my',0),(4,'2024-05-22 20:03:18',0,0,8,0,0,0,0,0,0,0,0,0,32,'1001954392@ucsiuniversity.edu.my',0),(5,'2024-05-22 20:04:13',0,0,1,1,1,0,0,0,0,0,0,0,27,'1001954392@ucsiuniversity.edu.my',0),(6,'2024-05-22 20:06:23',0,0,0,0,1,0,1,1,0,1,0,0,36,'1001954392@ucsiuniversity.edu.my',0),(7,'2024-05-22 20:07:27',0,0,0,0,0,0,0,0,7,0,0,0,56,'1001954392@ucsiuniversity.edu.my',0),(8,'2024-05-22 20:08:23',0,0,8,0,0,0,0,0,0,0,0,0,32,'1001954392@ucsiuniversity.edu.my',0),(9,'2024-05-22 20:10:15',0,0,1,0,0,0,0,0,0,0,0,0,4,'1001954392@ucsiuniversity.edu.my',0),(10,'2024-05-23 05:52:32',0,0,0,2,2,0,2,1,0,0,0,0,66,'ychuintan@gmail.com',0),(11,'2024-05-23 06:07:47',7,0,0,0,0,0,0,0,0,0,0,0,35,'1001954392@ucsiuniversity.edu.my',0),(12,'2024-05-23 06:18:20',4,0,0,0,0,0,0,0,0,0,0,0,20,'1001954392@ucsiuniversity.edu.my',0),(13,'2024-05-23 06:59:37',1,1,1,1,2,0,1,0,0,0,0,0,62,'1001954392@ucsiuniversity.edu.my',0),(14,'2024-05-23 07:05:35',1,1,1,2,1,0,0,0,0,0,0,0,50,'1001954392@ucsiuniversity.edu.my',0),(15,'2024-05-23 07:09:47',2,0,0,0,1,1,0,1,0,1,0,1,57,'1001954392@ucsiuniversity.edu.my',0),(16,'2024-05-23 07:25:08',0,0,0,1,1,0,1,0,0,0,0,0,28,'1001954392@ucsiuniversity.edu.my',0),(17,'2024-05-23 07:26:35',0,0,0,2,2,0,0,0,0,0,0,0,46,'1001954392@ucsiuniversity.edu.my',0),(18,'2024-05-23 07:28:55',0,0,0,2,0,0,0,0,0,1,0,2,40,'1001954392@ucsiuniversity.edu.my',0),(19,'2024-05-23 07:29:22',0,0,0,2,0,0,0,0,0,0,1,2,41,'1001954392@ucsiuniversity.edu.my',0),(20,'2024-05-23 07:29:58',0,0,0,0,0,0,0,1,1,0,2,0,32,'1001954392@ucsiuniversity.edu.my',0),(21,'2024-05-23 07:30:22',0,0,0,0,0,0,0,0,1,0,0,0,8,'1001954392@ucsiuniversity.edu.my',0),(22,'2024-05-23 07:30:45',0,0,0,0,0,0,0,0,1,0,0,0,8,'1001954392@ucsiuniversity.edu.my',0),(23,'2024-05-23 07:31:20',0,0,0,1,0,0,0,0,0,0,0,0,8,'1001954392@ucsiuniversity.edu.my',0),(24,'2024-05-23 11:20:00',0,1,0,1,3,0,0,1,1,0,1,0,88,'1002057802@ucsiuniversity.edu.my ',0),(25,'2024-05-25 11:18:29',2,1,0,0,0,0,1,0,0,0,0,0,25,'1001954392@ucsiuniversity.edu.my',0),(26,'2024-05-25 13:24:18',0,1,1,0,1,1,1,0,3,0,0,0,65,'1001954392@ucsiuniversity.edu.my',0),(27,'2024-05-25 13:29:50',0,0,3,0,0,0,0,0,3,0,0,0,36,'1001954392@ucsiuniversity.edu.my',0),(28,'2024-07-08 04:37:59',0,0,0,1,2,0,2,0,0,0,1,0,55,'1001954392@ucsiuniversity.edu.my',0),(29,'2024-07-12 08:12:30',3,0,0,0,1,1,0,0,0,0,0,0,37,'ychuintan@gmail.com',0),(30,'2024-07-12 08:14:20',1,0,1,0,1,0,0,0,0,0,0,0,24,'you08312001@hotmail.my',0),(31,'2024-07-12 09:23:38',0,2,0,0,1,0,0,0,0,0,0,0,35,'zailah@ucsiuniversity.edu.my',0),(32,'2024-07-25 15:10:47',1,0,0,0,1,0,0,1,1,0,0,0,38,'ychuintan@gmail.com',0),(33,'2024-08-07 09:30:12',1,1,1,0,0,0,1,0,0,0,0,0,24,'joinsheng1313@gmail.com',0),(34,'2024-08-07 09:51:57',4,0,0,0,0,0,0,0,0,0,0,0,20,'1001954392@ucsiuniversity.edu.my',0),(35,'2024-08-11 08:34:15',0,0,0,2,0,2,1,0,1,1,0,0,49,'1001954392@ucsiuniversity.edu.my',0),(36,'2024-08-11 08:44:28',0,0,0,6,0,0,0,0,0,0,0,0,48,'1001954392@ucsiuniversity.edu.my',0),(37,'2024-08-12 01:53:30',0,0,0,0,0,0,0,3,0,0,1,0,37,'1001954392@ucsiuniversity.edu.my',0),(38,'2024-08-12 03:37:16',0,0,0,0,5,0,0,0,0,0,0,0,75,'1001956465@ucsiuniversity.edu.my',0),(39,'2024-08-12 03:39:24',0,1,0,0,0,1,2,0,0,0,0,1,36,'1001954392@ucsiuniversity.edu.my',0),(40,'2024-08-12 04:09:33',0,0,0,0,0,0,0,0,0,0,7,0,49,'1001954392@ucsiuniversity.edu.my',0);
/*!40000 ALTER TABLE `paymenthistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25 13:48:41
