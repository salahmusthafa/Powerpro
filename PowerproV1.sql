-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: powerpro
-- ------------------------------------------------------

 CREATE DATABASE IF NOT EXISTS `PowerproV1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `PowerproV1`;

-- Server version	8.0.35

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (101,'user101','pass101','user101@example.com'),(102,'user102','pass102','user102@example.com'),(103,'user103','pass103','user103@example.com'),(104,'user104','pass104','user104@example.com'),(105,'user105','pass105','user105@example.com'),(106,'user106','pass106','user106@example.com'),(107,'user107','pass107','user107@example.com'),(108,'user108','pass108','user108@example.com'),(109,'user109','pass109','user109@example.com'),(110,'user110','pass110','user110@example.com');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `apartment_id` int NOT NULL,
  `apartment_owner_name` varchar(50) DEFAULT NULL,
  `apartment_number` int DEFAULT NULL,
  `building_id` int DEFAULT NULL,
  `apartment_consumption` int DEFAULT NULL,
  PRIMARY KEY (`apartment_id`),
  KEY `fk_apartment_building` (`building_id`),
  CONSTRAINT `fk_apartment_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES (1,'John Doe',101,1,900),(2,'Jane Smith',202,2,850),(3,'Bob Johnson',303,1,920),(4,'Alice Williams',404,3,880),(5,'Charlie Brown',505,2,950),(6,'Eva Davis',606,1,890),(7,'Frank White',707,3,920),(8,'Grace Turner',808,2,870),(9,'David Lee',909,1,930),(10,'Emily Clark',1010,3,900);
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int NOT NULL,
  `building_name` varchar(50) DEFAULT NULL,
  `building_owner_name` varchar(50) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`building_id`),
  KEY `fk_building_Admins` (`admin_id`),
  CONSTRAINT `fk_building_Admins` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Sky Tower','John Smith',101),(2,'Golden Heights','Alice Johnson',102),(3,'Sunset Residences','Robert Davis',103),(4,'City View Apartments','Emily White',104),(5,'Harbor Lights','Michael Brown',105),(6,'Majestic Manor','Sophia Lee',106),(7,'Pinecrest Estates','Daniel Miller',107),(8,'Oceanfront Towers','Olivia Wilson',108),(9,'Parkside Plaza','William Turner',109),(10,'Greenwood Gardens','Ella Moore',110);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `device_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `frequency` int DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `fk_device_Rooms` (`room_id`),
  CONSTRAINT `fk_device_Rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,5),(2,2,8),(3,3,12),(4,4,6);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_data`
--

DROP TABLE IF EXISTS `device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_data` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `value` int DEFAULT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_device_id_device_data` (`device_id`),
  CONSTRAINT `fk_device_id_device_data` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_data`
--

LOCK TABLES `device_data` WRITE;
/*!40000 ALTER TABLE `device_data` DISABLE KEYS */;
INSERT INTO `device_data` VALUES (1,'2023-12-12','12:30:00',26,1),(2,'2023-12-13','14:45:00',19,2),(3,'2023-12-14','08:00:00',22,3),(4,'2023-12-15','10:15:00',30,4);
/*!40000 ALTER TABLE `device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL,
  `apartment_id` int DEFAULT NULL,
  `room_number` int DEFAULT NULL,
  `room_consumption` int DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_Rooms_Apartment` (`apartment_id`),
  CONSTRAINT `fk_Rooms_Apartment` FOREIGN KEY (`apartment_id`) REFERENCES `apartment` (`apartment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,101,300),(2,1,102,250),(3,2,201,280),(4,2,202,320),(5,3,301,270),(6,3,302,310),(7,4,401,290),(8,4,402,260),(9,5,501,330),(10,5,502,290);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `sensor_id` int NOT NULL,
  `sensor_type_id` int DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`sensor_id`),
  KEY `fk_Sensor_Rooms` (`room_id`),
  KEY `fk_sensor_type_id_sensor` (`sensor_type_id`),
  CONSTRAINT `fk_Sensor_Rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `fk_sensor_type_id_sensor` FOREIGN KEY (`sensor_type_id`) REFERENCES `sensor_type` (`sensor_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,1,'Living Room',1),(2,2,'Bedroom',2),(3,3,'Kitchen',3),(4,4,'kidsroom',4),(5,1,'Living Room',5),(6,2,'Bedroom',6),(7,3,'Kitchen',7),(8,1,'Kitchen',8),(9,2,'Living Room',9),(10,3,'Bedroom',10),(11,1,'Living Room',1),(12,2,'Bedroom',2),(13,3,'Kitchen',3),(14,4,'kidsroom',4),(15,1,'Living Room',5),(16,2,'Bedroom',6),(17,3,'Kitchen',7),(18,1,'Kitchen',8),(19,2,'Living Room',9),(20,3,'Bedroom',10);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_data`
--

DROP TABLE IF EXISTS `sensor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor_data` (
  `instance_id` int NOT NULL,
  `sensor_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `value` int DEFAULT NULL,
  PRIMARY KEY (`instance_id`),
  KEY `fk_SensorData_Sensor` (`sensor_id`),
  CONSTRAINT `fk_SensorData_Sensor` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`sensor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_data`
--

LOCK TABLES `sensor_data` WRITE;
/*!40000 ALTER TABLE `sensor_data` DISABLE KEYS */;
INSERT INTO `sensor_data` VALUES (1,1,'2023-02-18','12:30:14',5),(2,2,'2023-10-17','09:30:14',8),(3,8,'2023-11-02','18:45:14',50),(4,6,'2023-10-29','02:12:55',3);
/*!40000 ALTER TABLE `sensor_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_type`
--

DROP TABLE IF EXISTS `sensor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor_type` (
  `sensor_type_id` int NOT NULL,
  `sensor_name` varchar(50) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sensor_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_type`
--

LOCK TABLES `sensor_type` WRITE;
/*!40000 ALTER TABLE `sensor_type` DISABLE KEYS */;
INSERT INTO `sensor_type` VALUES (1,'Temperature','Celsius'),(2,'Motion','Feet'),(3,'Luminisence','Lux'),(4,'Smoke','Obscuration');
/*!40000 ALTER TABLE `sensor_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-16  2:35:46
