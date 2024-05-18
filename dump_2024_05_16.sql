-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: rekruters
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activitiesID` int NOT NULL AUTO_INCREMENT,
  `nameActivities` varchar(200) DEFAULT NULL,
  `employerID` int NOT NULL,
  PRIMARY KEY (`activitiesID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'',1),(2,'',1),(3,'',1),(4,'5',1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additionalservicesemployer`
--

DROP TABLE IF EXISTS `additionalservicesemployer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additionalservicesemployer` (
  `additionalServicesForEmployerID` int NOT NULL AUTO_INCREMENT,
  `nameAdditionalServicesEmployer` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`additionalServicesForEmployerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additionalservicesemployer`
--

LOCK TABLES `additionalservicesemployer` WRITE;
/*!40000 ALTER TABLE `additionalservicesemployer` DISABLE KEYS */;
INSERT INTO `additionalservicesemployer` VALUES (1,'За размещение',3000),(2,'Проведение ассессмент центра',6000);
/*!40000 ALTER TABLE `additionalservicesemployer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additionalservicesoiskatel`
--

DROP TABLE IF EXISTS `additionalservicesoiskatel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additionalservicesoiskatel` (
  `soiskatelID` int DEFAULT NULL,
  `serviceSoiskatelID` int DEFAULT NULL,
  `rekruterID` int DEFAULT NULL,
  `summa` float DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additionalservicesoiskatel`
--

LOCK TABLES `additionalservicesoiskatel` WRITE;
/*!40000 ALTER TABLE `additionalservicesoiskatel` DISABLE KEYS */;
INSERT INTO `additionalservicesoiskatel` VALUES (1,2,1,100,NULL);
/*!40000 ALTER TABLE `additionalservicesoiskatel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicationsforjob`
--

DROP TABLE IF EXISTS `applicationsforjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicationsforjob` (
  `applicationsForJobID` int NOT NULL AUTO_INCREMENT,
  `soiskatelID` int DEFAULT NULL,
  `employerID` int DEFAULT NULL,
  `jobID` int DEFAULT NULL,
  `rekruterID` int DEFAULT NULL,
  `applicationsStatusID` int DEFAULT NULL,
  `dateOfCreation` datetime DEFAULT NULL,
  `dateOfClosing` datetime DEFAULT NULL,
  `serviceSoiskatelID` int DEFAULT NULL,
  PRIMARY KEY (`applicationsForJobID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationsforjob`
--

LOCK TABLES `applicationsforjob` WRITE;
/*!40000 ALTER TABLE `applicationsforjob` DISABLE KEYS */;
INSERT INTO `applicationsforjob` VALUES (1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `applicationsforjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicationsforjobpostings`
--

DROP TABLE IF EXISTS `applicationsforjobpostings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicationsforjobpostings` (
  `applicationsForJobPostingsID` int NOT NULL AUTO_INCREMENT,
  `employerID` int DEFAULT NULL,
  `rekruterID` int DEFAULT NULL,
  `nameJob` varchar(100) DEFAULT NULL,
  `jobDescription` varchar(200) DEFAULT NULL,
  `typeOfEmploymentID` int DEFAULT NULL,
  `requirementToSoiskatel` varchar(250) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `activitiesID` int DEFAULT NULL,
  `dateOfPosting` date DEFAULT NULL,
  PRIMARY KEY (`applicationsForJobPostingsID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationsforjobpostings`
--

LOCK TABLES `applicationsforjobpostings` WRITE;
/*!40000 ALTER TABLE `applicationsforjobpostings` DISABLE KEYS */;
INSERT INTO `applicationsforjobpostings` VALUES (1,1,1,'Программист','хорошая зп',1,'молодец',3000,1,'2024-01-24'),(2,1,1,'','',1,'',121,NULL,'2024-04-26'),(3,1,1,'Токарт','нет',1,'нет',12,1,'2024-04-26'),(4,1,1,'Уборщица','нет',1,'нет',12900,1,'2024-04-26'),(5,1,1,'не','не',1,'не',111,1,'2024-04-26'),(6,1,1,'3','123',1,'не',1,1,'2024-04-28'),(7,1,1,'не','123',0,'не',1,0,'2024-04-28'),(8,1,1,'не','не',1,'не',123,0,'2024-04-28'),(9,1,1,'не','не',1,'не',1,1,'2024-04-28'),(10,1,1,'34','34',1,'34',34,1,'2024-04-28'),(11,1,1,'не','не',1,'123',109,3,'2024-04-30'),(12,1,1,'ut','не',1,'не',9000,3,'2024-05-02'),(13,1,1,'Программист','Нет',0,'рар',978987,2,'2024-05-02'),(14,1,1,'мем','123',1,'342',6000,2,'2024-05-09'),(15,1,1,'ркре','к',1,'к',6000,2,'2024-05-13'),(16,1,1,'312','321',1,'432',6000,1,'2024-05-13'),(17,1,1,'к','цуц',1,'кц',9000,1,'2024-05-13'),(18,1,1,'gdf','dfgdf',1,'ret',9000,4,'2024-05-13'),(19,1,1,'рер','крке',0,'нкенек',6000,2,'2024-05-15');
/*!40000 ALTER TABLE `applicationsforjobpostings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicationsstatus`
--

DROP TABLE IF EXISTS `applicationsstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicationsstatus` (
  `applicationsStatusID` int NOT NULL AUTO_INCREMENT,
  `applicationsStatus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`applicationsStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicationsstatus`
--

LOCK TABLES `applicationsstatus` WRITE;
/*!40000 ALTER TABLE `applicationsstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `applicationsstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `employerID` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `messengerID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`employerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,'42','3',1,1),(2,'123','79221645494',1,2);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jobID` int NOT NULL AUTO_INCREMENT,
  `applicationsForJobPostingsID` int DEFAULT NULL,
  `employerID` int DEFAULT NULL,
  `nameJob` varchar(100) DEFAULT NULL,
  `jobDescription` varchar(250) DEFAULT NULL,
  `typeOfEmploymentID` int DEFAULT NULL,
  `requirementToSoiskatel` varchar(250) DEFAULT NULL,
  `jobStatusID` int DEFAULT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,NULL,NULL,'Программист','нету',NULL,NULL,NULL),(2,NULL,NULL,'Разработчик','хорош',NULL,NULL,NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobstatus`
--

DROP TABLE IF EXISTS `jobstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobstatus` (
  `jobStatusID` int NOT NULL AUTO_INCREMENT,
  `jobStatus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`jobStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobstatus`
--

LOCK TABLES `jobstatus` WRITE;
/*!40000 ALTER TABLE `jobstatus` DISABLE KEYS */;
INSERT INTO `jobstatus` VALUES (1,'Активна');
/*!40000 ALTER TABLE `jobstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyskills`
--

DROP TABLE IF EXISTS `keyskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyskills` (
  `keySkillsID` int NOT NULL AUTO_INCREMENT,
  `skills` varchar(100) DEFAULT NULL,
  `keySkillsDescription` varchar(500) DEFAULT NULL,
  `soiskatelID` int NOT NULL,
  PRIMARY KEY (`keySkillsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyskills`
--

LOCK TABLES `keyskills` WRITE;
/*!40000 ALTER TABLE `keyskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listofserviceemployer`
--

DROP TABLE IF EXISTS `listofserviceemployer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listofserviceemployer` (
  `additionalServicesForEmployerID` int NOT NULL,
  `employerID` int NOT NULL,
  `applicationsForJobPostingsID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listofserviceemployer`
--

LOCK TABLES `listofserviceemployer` WRITE;
/*!40000 ALTER TABLE `listofserviceemployer` DISABLE KEYS */;
INSERT INTO `listofserviceemployer` VALUES (2,1,16),(1,1,17),(2,1,17),(2,1,18),(1,1,18),(2,1,19);
/*!40000 ALTER TABLE `listofserviceemployer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger`
--

DROP TABLE IF EXISTS `messenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger` (
  `messengerID` int NOT NULL AUTO_INCREMENT,
  `nameMessenger` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger`
--

LOCK TABLES `messenger` WRITE;
/*!40000 ALTER TABLE `messenger` DISABLE KEYS */;
INSERT INTO `messenger` VALUES (1,'WhatsApp');
/*!40000 ALTER TABLE `messenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport`
--

DROP TABLE IF EXISTS `passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passport` (
  `passportID` int NOT NULL AUTO_INCREMENT,
  `series` varchar(4) DEFAULT NULL,
  `number` varchar(6) DEFAULT NULL,
  `issuedBy` varchar(200) DEFAULT NULL,
  `dateOfIssue` date DEFAULT NULL,
  `departmentCode` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`passportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport`
--

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placeofwork`
--

DROP TABLE IF EXISTS `placeofwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placeofwork` (
  `placeOfWorkID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `dateOfStart` date DEFAULT NULL,
  `dateOfEnd` date DEFAULT NULL,
  `soiskatelID` int NOT NULL,
  PRIMARY KEY (`placeOfWorkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placeofwork`
--

LOCK TABLES `placeofwork` WRITE;
/*!40000 ALTER TABLE `placeofwork` DISABLE KEYS */;
/*!40000 ALTER TABLE `placeofwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positionatwork`
--

DROP TABLE IF EXISTS `positionatwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positionatwork` (
  `positionAtWorkID` int NOT NULL AUTO_INCREMENT,
  `namePositionAtWork` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`positionAtWorkID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positionatwork`
--

LOCK TABLES `positionatwork` WRITE;
/*!40000 ALTER TABLE `positionatwork` DISABLE KEYS */;
INSERT INTO `positionatwork` VALUES (1,'Технический рекрутер'),(2,'Корпоративный рекрутер');
/*!40000 ALTER TABLE `positionatwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekruter`
--

DROP TABLE IF EXISTS `rekruter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rekruter` (
  `rekruterID` int NOT NULL AUTO_INCREMENT,
  `Surname` varchar(150) DEFAULT NULL,
  `positionAtWorkID` int DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `messengerID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `Lastname` varchar(150) NOT NULL,
  PRIMARY KEY (`rekruterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekruter`
--

LOCK TABLES `rekruter` WRITE;
/*!40000 ALTER TABLE `rekruter` DISABLE KEYS */;
INSERT INTO `rekruter` VALUES (1,'Мега',1,'4234234',1,1,'',''),(2,'Олег',1,'12312',1,8,'','');
/*!40000 ALTER TABLE `rekruter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `nameRole` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Соискатель'),(2,'Работодатель'),(3,'Рекрутер'),(4,'Руководитель');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicesoiskatel`
--

DROP TABLE IF EXISTS `servicesoiskatel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicesoiskatel` (
  `serviceSoiskatelID` int NOT NULL AUTO_INCREMENT,
  `nameServiceSoiskatel` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`serviceSoiskatelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicesoiskatel`
--

LOCK TABLES `servicesoiskatel` WRITE;
/*!40000 ALTER TABLE `servicesoiskatel` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicesoiskatel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soiskatel`
--

DROP TABLE IF EXISTS `soiskatel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soiskatel` (
  `soiskatelID` int NOT NULL AUTO_INCREMENT,
  `Surname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `passportID` int DEFAULT NULL,
  `workExperience` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `messengerID` int NOT NULL,
  `userID` int NOT NULL,
  `TypeOfDocumentsID` int NOT NULL,
  PRIMARY KEY (`soiskatelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soiskatel`
--

LOCK TABLES `soiskatel` WRITE;
/*!40000 ALTER TABLE `soiskatel` DISABLE KEYS */;
/*!40000 ALTER TABLE `soiskatel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeofdocuments`
--

DROP TABLE IF EXISTS `typeofdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeofdocuments` (
  `TypeOfDocumentsID` int NOT NULL AUTO_INCREMENT,
  `TypeOfDocumentsName` varchar(45) NOT NULL,
  PRIMARY KEY (`TypeOfDocumentsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofdocuments`
--

LOCK TABLES `typeofdocuments` WRITE;
/*!40000 ALTER TABLE `typeofdocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeofdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeofemployment`
--

DROP TABLE IF EXISTS `typeofemployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeofemployment` (
  `typeOfEmploymentID` int NOT NULL AUTO_INCREMENT,
  `nameTypeOfEmployment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`typeOfEmploymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofemployment`
--

LOCK TABLES `typeofemployment` WRITE;
/*!40000 ALTER TABLE `typeofemployment` DISABLE KEYS */;
INSERT INTO `typeofemployment` VALUES (1,'Полный рабочий день');
/*!40000 ALTER TABLE `typeofemployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typesofeducation`
--

DROP TABLE IF EXISTS `typesofeducation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typesofeducation` (
  `educationID` int NOT NULL AUTO_INCREMENT,
  `nameEducation` varchar(200) DEFAULT NULL,
  `soiskatelID` int NOT NULL,
  PRIMARY KEY (`educationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typesofeducation`
--

LOCK TABLES `typesofeducation` WRITE;
/*!40000 ALTER TABLE `typesofeducation` DISABLE KEYS */;
/*!40000 ALTER TABLE `typesofeducation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userPassword` varchar(200) DEFAULT NULL,
  `userLogin` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `roleID` int DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'не','не','2',3),(2,'123','kek','123',2),(3,'123','rer','123',1),(4,'123','re','123',2),(5,'123','keks','123',1),(6,'123','kik','123',2),(7,'1','admin','123',4),(8,'1','rekruter','123',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 22:32:49
