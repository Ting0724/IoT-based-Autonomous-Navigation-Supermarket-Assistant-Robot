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
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` decimal(65,0) NOT NULL,
  `PromoCode` varchar(45) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Quantityleft` int DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtype`
--

LOCK TABLES `itemtype` WRITE;
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` VALUES (1,'Toothpaste',5,NULL,'A dental care product used for cleaning teeth and maintaining oral hygiene. Typically comes in a tube and contains ingredients such as fluoride to prevent cavities and freshen breath.',10,'(2,1,R1)'),(2,'Shampoo',10,'10% OFF','A hair care product used for cleansing the scalp and hair. It helps remove dirt, oil, and other impurities, while also nourishing and moisturizing the hair strands.',8,'(3,1,R1)'),(3,'Soap',4,NULL,'A cleansing agent used for personal hygiene and washing hands or body. Soap bars are typically made from fats or oils mixed with an alkali substance and may contain fragrance or moisturizing agents.',8,'(4,1,R1)'),(4,'Toilet paper',8,'20% OFF','A sanitary paper product used for personal hygiene after using the toilet. It consists of thin, soft paper sheets rolled into a cylindrical shape for easy dispensing.',10,'(2,1,R1)'),(5,'Laundry detergent',15,NULL,'A cleaning agent used for washing clothes and removing dirt, stains, and odors. It comes in liquid or powder form and contains surfactants and other ingredients to break down dirt and stains.',4,'(3,1,R1)'),(6,'Dishwashing liquid',7,NULL,'A cleaning agent used for washing dishes and utensils. It helps to remove grease, food residue, and stains from dishes and cutlery, often with a pleasant scent.',7,'(4,1,R1)'),(7,'Facial tissues',5,NULL,'Soft paper tissues used for wiping or blowing the nose, removing makeup, or general facial hygiene. They are disposable and come in convenient pocket-sized packs.',6,'(2,1,R2)'),(8,'Trash bags',10,'30% OFF','Bags made of plastic or other materials used for containing and disposing of household waste. They come in various sizes and strengths to accommodate different types of waste.',6,'(3,1,R2)'),(9,'Aluminum foil',8,'40% OFF','A thin, flexible sheet made of aluminum metal used for wrapping, covering, and cooking food. It helps to retain moisture and heat during cooking and can also be used for storage and insulation.',8,'(4,1,R2)'),(10,'Plastic wrap',6,'50% OFF','A thin, transparent plastic film used for covering and sealing food containers, plates, or bowls. It helps to keep food fresh and prevent spillage or contamination.',9,'(2,1,R2)'),(11,'Cleaning spray',7,NULL,'A cleaning solution in spray form used for cleaning and disinfecting various surfaces such as countertops, glass, and appliances. It typically contains chemicals that help dissolve dirt and kill bacteria.',2,'(3,1,R2)'),(12,'Hand sanitizer',9,NULL,'A gel or liquid product used for disinfecting hands when soap and water are not available. It typically contains alcohol as the active ingredient to kill germs and bacteria on the skin.',9,'(4,1,R2)');
/*!40000 ALTER TABLE `itemtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25 13:48:42
