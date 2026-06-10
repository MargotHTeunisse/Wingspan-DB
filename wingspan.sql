-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: wingspan
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bird`
--

DROP TABLE IF EXISTS `bird`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bird` (
  `bird_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `scientific_name` varchar(30) DEFAULT NULL,
  `nl_name` varchar(30) DEFAULT NULL,
  `victory_points` smallint unsigned NOT NULL,
  `lives_in_forest` tinyint(1) DEFAULT '0',
  `lives_in_plains` tinyint(1) DEFAULT '0',
  `lives_in_wetlands` tinyint(1) DEFAULT '0',
  `nest_type` enum('BOWL','PLTF','CVTY','GRND','STAR') DEFAULT NULL,
  `nest_capacity` smallint unsigned NOT NULL,
  `wingspan` smallint unsigned NOT NULL,
  `expansion` enum('SW','EE','OE','A','AM') DEFAULT NULL,
  `power_id` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`bird_id`),
  UNIQUE KEY `scientific_name` (`scientific_name`),
  UNIQUE KEY `nl_name` (`nl_name`),
  KEY `fk_bird_per_power` (`power_id`),
  CONSTRAINT `fk_bird_per_power` FOREIGN KEY (`power_id`) REFERENCES `power` (`power_id`),
  CONSTRAINT `bird_chk_1` CHECK ((`nest_type` in (_utf8mb4'BOWL',_utf8mb4'CVTY',_utf8mb4'PLTF',_utf8mb4'GRND',_utf8mb4'STAR'))),
  CONSTRAINT `bird_chk_3` CHECK ((`expansion` in (_utf8mb4'SW',_utf8mb4'NA',_utf8mb4'EE',_utf8mb4'OE',_utf8mb4'AS',_utf8mb4'AM'))),
  CONSTRAINT `empty_nest` CHECK ((((`nest_type` is not null) and (`nest_capacity` > 0)) or ((`nest_type` is null) and (`nest_capacity` = 0)))),
  CONSTRAINT `lives_somewhere` CHECK (((0 <> `lives_in_forest`) or (0 <> `lives_in_wetlands`) or (0 <> `lives_in_plains`)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird`
--

LOCK TABLES `bird` WRITE;
/*!40000 ALTER TABLE `bird` DISABLE KEYS */;
INSERT INTO `bird` VALUES (1,'Aythya valisineria','Grote tafeleend',4,0,0,1,'STAR',4,82,'SW',1),(2,'Setophaga ruticilla','Amerikaanse roodstaart',4,1,0,0,'BOWL',2,20,'SW',2),(3,'Archillocus alexandri','Zwartkinkolibrie',4,1,1,1,'BOWL',2,8,'SW',3),(4,'Chaetura vauxi','Vaux\' gierzwaluw',2,1,0,0,'CVTY',3,31,'SW',4),(5,'Mergus serrator','Middelste zaagbek',3,0,0,1,'GRND',4,78,'SW',5),(6,'Callipepla squamata','Geschubde kwartel',0,0,1,0,'GRND',6,36,'SW',6),(7,'Myioborus pictus','Roodbuikzanger',1,1,0,0,'GRND',3,22,'SW',7),(8,'Aeronautes saxatalis','Bonte gierzwaluw',2,0,1,0,'CVTY',2,38,'SW',8),(9,'Branta bernicla','Rotgans',3,0,0,1,'GRND',2,114,'SW',9),(10,'Buteo platypterus','Breedvleugelbuizerd',4,1,0,0,'PLTF',2,85,'SW',10);
/*!40000 ALTER TABLE `bird` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_costs`
--

DROP TABLE IF EXISTS `food_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_costs` (
  `bird_id` smallint unsigned NOT NULL,
  `worms` smallint unsigned NOT NULL DEFAULT '0',
  `grains` smallint unsigned NOT NULL DEFAULT '0',
  `berries` smallint unsigned NOT NULL DEFAULT '0',
  `fish` smallint unsigned NOT NULL DEFAULT '0',
  `rats` smallint unsigned NOT NULL DEFAULT '0',
  `wild` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bird_id`,`worms`,`grains`,`berries`,`fish`,`rats`,`wild`),
  CONSTRAINT `fk_costs_per_bird` FOREIGN KEY (`bird_id`) REFERENCES `bird` (`bird_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_costs`
--

LOCK TABLES `food_costs` WRITE;
/*!40000 ALTER TABLE `food_costs` DISABLE KEYS */;
INSERT INTO `food_costs` VALUES (1,0,1,0,0,0,1),(2,1,0,1,0,0,0),(3,0,0,0,0,0,1),(4,1,0,0,0,0,0),(5,1,0,0,1,0,0),(6,0,1,0,0,0,0),(7,1,0,0,0,0,0),(8,1,0,0,0,0,0),(9,0,1,0,0,0,1),(10,0,0,0,1,0,0);
/*!40000 ALTER TABLE `food_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power`
--

DROP TABLE IF EXISTS `power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power` (
  `power_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `color` enum('WH','BR','PK') NOT NULL,
  `type` enum('DICE','CARD','FOOD','SWRM','HUNT','EGGS') DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power`
--

LOCK TABLES `power` WRITE;
/*!40000 ALTER TABLE `power` DISABLE KEYS */;
INSERT INTO `power` VALUES (1,'BR','CARD','alle spelers trekken 1 [kaart] uit de voorraad'),(2,'BR','DICE','pak 1 [dobbelsteen] uit het vogelhuisje'),(3,'BR','FOOD','iedere speler pakt 1 [voedseltype] uit de voorraad'),(4,'BR','SWRM','stop 1 [kaart] uit je hand onder deze vogel weg. Doe je dat, pak dan 1 [voedseltype] uit de voorraad'),(5,'BR','CARD','trek 2 [kaart]. Doe je dat, leg dan aan het einde van je beurt 1 [kaart] af'),(6,'BR','EGGS','leg 1 [ei] op deze vogel'),(7,'BR','FOOD','pak 1 [voedseltype] uit de voorraad'),(8,'BR','SWRM','stop 1 [kaart] uit je hand onder deze vogel weg. Doe je dat, leg dan 1 [ei] op een vogel naar keuze'),(9,'WH','CARD','trek de 3 open [kaart] in de voorraad'),(10,'BR','HUNT','werp alle [rat/vis] die niet in het vogelhuisje liggen. Gooi je tenminste 1 [rat/vis], pak dan 1 [rat/vis] en bewaar die op deze vogel');
/*!40000 ALTER TABLE `power` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10 14:56:45
