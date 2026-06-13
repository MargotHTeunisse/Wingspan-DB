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
  `scientific_name` varchar(50) NOT NULL,
  `nl_name` varchar(50) DEFAULT NULL,
  `victory_points` smallint unsigned NOT NULL,
  `lives_in_forest` tinyint(1) DEFAULT '0',
  `lives_in_plains` tinyint(1) DEFAULT '0',
  `lives_in_wetlands` tinyint(1) DEFAULT '0',
  `nest_type` enum('BOWL','PLTF','CVTY','GRND','STAR') DEFAULT NULL,
  `nest_capacity` smallint unsigned NOT NULL,
  `wingspan` smallint unsigned NOT NULL,
  `expansion` enum('SW','EE','OE','A','AM') DEFAULT NULL,
  `power_id` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`scientific_name`),
  UNIQUE KEY `scientific_name` (`scientific_name`),
  UNIQUE KEY `nl_name` (`nl_name`),
  UNIQUE KEY `nl_name_2` (`nl_name`),
  KEY `fk_bird_per_power` (`power_id`),
  CONSTRAINT `fk_bird_per_power` FOREIGN KEY (`power_id`) REFERENCES `power` (`power_id`),
  CONSTRAINT `bird_chk_1` CHECK ((`nest_type` in (_utf8mb4'BOWL',_utf8mb4'CVTY',_utf8mb4'PLTF',_utf8mb4'GRND',_utf8mb4'STAR'))),
  CONSTRAINT `bird_chk_3` CHECK ((`expansion` in (_utf8mb4'SW',_utf8mb4'NA',_utf8mb4'EE',_utf8mb4'OE',_utf8mb4'AS',_utf8mb4'AM'))),
  CONSTRAINT `empty_nest` CHECK ((((`nest_type` is not null) and (`nest_capacity` > 0)) or ((`nest_type` is null) and (`nest_capacity` = 0)))),
  CONSTRAINT `lives_somewhere` CHECK (((0 <> `lives_in_forest`) or (0 <> `lives_in_wetlands`) or (0 <> `lives_in_plains`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bird`
--

LOCK TABLES `bird` WRITE;
/*!40000 ALTER TABLE `bird` DISABLE KEYS */;
INSERT INTO `bird` VALUES ('Accipiter cooperii','Coopers sperwer',3,1,0,0,'PLTF',2,79,NULL,NULL),('Accipiter gentilis','Havik',5,1,0,0,'PLTF',2,106,'EE',NULL),('Accipiter nisus','Sperwer',4,1,0,0,'PLTF',2,65,'EE',NULL),('Actitis macutarius','Amerikaanse oeverloper',5,0,0,1,'GRND',2,38,NULL,NULL),('Aechmophorus clarkii','Clarks fuut',5,0,0,1,'STAR',2,61,NULL,NULL),('Aegithalos caudatus','Staartmees',0,1,0,0,'STAR',4,18,'EE',NULL),('Aeronautes saxatalis','Bonte gierzwaluw',2,0,1,0,'CVTY',2,38,'SW',8),('Agelaius phoeniceus','Epauletspreeuw',2,0,1,1,'BOWL',3,33,NULL,NULL),('Aguila chrysaetos','Steenarend',8,0,1,1,'PLTF',1,201,NULL,NULL),('Aguila fasciata','Havikarend',8,1,1,1,'PLTF',1,160,'EE',NULL),('Aguila heliaca','Keizerarend',7,0,1,0,'PLTF',2,200,'EE',NULL),('Aix sponsa','Carolina-eend',4,1,1,0,'CVTY',4,76,NULL,NULL),('Alcedo atthis','Ijsvogel',4,0,0,1,'STAR',5,26,'EE',NULL),('Alectoris rufa','Rode patrijs',1,0,1,0,'GRND',6,48,'EE',NULL),('Ammodramus bairdii','Bairds gors',3,0,1,0,'GRND',2,23,NULL,NULL),('Ammodramus savannarum','Sprinkhaangors',2,0,1,0,'GRND',2,20,NULL,NULL),('Anas platyrhynchos','Wilde eend',0,0,0,1,'GRND',4,89,NULL,NULL),('Anhinga anhinga','Amerikaanse slangenvogel',6,0,0,1,'PLTF',2,114,NULL,NULL),('Anser anser','Grauwe gans',7,0,0,1,'GRND',2,164,'EE',NULL),('Anthus spragueii','Prairiepieper',3,0,1,0,'GRND',3,25,NULL,NULL),('Antigone canadesis','Canadese kraanvogel',5,0,1,1,'GRND',1,196,NULL,NULL),('Apus apus','Gierzwaluw',5,0,1,0,'CVTY',2,46,'EE',NULL),('Archillocus alexandri','Zwartkinkolibrie',4,1,1,1,'BOWL',2,8,'SW',3),('Archilochus colubris','Robijnkeelkolibrie',4,1,1,1,'BOWL',2,10,NULL,NULL),('Ardea alba','Grote zilverreiger',7,0,0,1,'PLTF',3,130,NULL,NULL),('Ardea cinerea','Blauwe reiger',3,0,0,1,'PLTF',2,185,'EE',NULL),('Ardea herodias','Amerikaanse blauwe reiger',5,0,0,1,'PLTF',2,183,NULL,NULL),('Ardeola ralloides','Ralreiger',3,0,0,1,'PLTF',2,86,'EE',NULL),('Athene cunicularia','Holenuil',5,0,1,0,'STAR',4,53,NULL,NULL),('Athene noctua','Steenuil',4,1,1,0,'CVTY',2,56,'EE',NULL),('Aythya valisineria','Grote tafeleend',4,0,0,1,'STAR',4,82,'SW',1),('Baelophus bicolor','Tweekleurige mees',2,1,0,0,'CVTY',3,25,NULL,NULL),('Baeolophus ridgwayi','Ridgways mees',4,1,0,0,'CVTY',3,23,NULL,NULL),('Bombycilla cedrorum','Cederpestvogel',3,1,1,0,'BOWL',3,25,NULL,NULL),('Botarus lentiginosus','Noord-Amerikaanse roerdomp',7,0,0,1,'PLTF',2,107,NULL,NULL),('Branta bernicla','Rotgans',3,0,0,1,'GRND',2,114,'SW',9),('Branta canadensis','Grote Canadese gans',3,0,1,1,'GRND',3,132,NULL,NULL),('Bubo scandiacus','Sneeuwuil',4,0,1,1,'GRND',3,138,'EE',NULL),('Bubo virginianus','Amerikaanse oehoe',8,1,0,0,'PLTF',2,112,NULL,NULL),('Bucephala clangula','Brilduiker',2,1,0,1,'CVTY',4,73,'EE',NULL),('Bucephala islandica','Ijslandse brilduiker',5,0,0,1,'CVTY',4,71,NULL,NULL),('Buteo buteo','Buizerd',4,1,1,1,'PLTF',2,123,'EE',NULL),('Buteo jamaicensis','Roodstaartbuizerd',5,1,1,1,'PLTF',2,124,NULL,NULL),('Buteo lineatus','Roodschouderbuizerd',3,1,0,0,'PLTF',2,102,NULL,NULL),('Buteo platypterus','Breedvleugelbuizerd',4,1,0,0,'PLTF',2,85,'SW',10),('Buteo regalis','Rosse ruigpootbuizerd',6,0,1,0,'PLTF',2,142,NULL,NULL),('Buteo swainsoni','Prairiebuizerd',5,0,1,0,'PLTF',2,130,NULL,NULL),('Butorides virescens','Groene reiger',4,0,0,1,'PLTF',3,66,NULL,NULL),('Calcarius arnatus','Roodhalsgors',5,0,1,0,'GRND',4,25,NULL,NULL),('Calidris canutus','Kanoet',7,0,0,1,'GRND',2,50,'EE',NULL),('Calidris pugnax','Kemphaan',2,0,1,1,'GRND',2,56,'EE',NULL),('Callipepla californica','Çalifornische kuifkwartel',3,1,1,0,'GRND',6,36,NULL,NULL),('Callipepla squamata','Geschubde kwartel',0,0,1,0,'GRND',6,36,'SW',6),('Calypte anna','Anna\'s kolibrie',4,1,1,1,'BOWL',2,13,NULL,NULL),('Caracias garrulus','Scharrelaar',3,0,1,0,'CVTY',2,70,'EE',NULL),('Cardinalis cardinalis','Rode kardinaal',3,1,0,0,'BOWL',5,30,NULL,NULL),('Carduelis carduelis','Putter',6,1,1,0,'BOWL',4,23,'EE',NULL),('Cathartes aura','Roodkopgier',1,1,1,1,'CVTY',1,170,NULL,NULL),('Catharus guttatus','Heremietlijster',7,1,0,0,'STAR',2,30,NULL,NULL),('Certhia brachydactyla','Boomkruiper',2,1,0,0,'CVTY',5,20,'EE',NULL),('Cettia cetti','Cetti\'s zanger',4,0,0,1,'BOWL',3,17,'EE',NULL),('Chaetura pelagica','Schoorsteengierzwaluw',3,1,1,1,'STAR',2,36,NULL,NULL),('Chaetura vauxi','Vaux\' gierzwaluw',2,1,0,0,'CVTY',3,31,'SW',4),('Charadrius vociferus','Killdeerplevier',1,0,1,1,'GRND',3,46,NULL,NULL),('Chlidonias niger','Zwarte stern',4,0,0,1,'STAR',2,61,NULL,NULL),('Chordeiles minor','Amerikaanse nachtzwaluw',3,1,1,1,'GRND',2,56,NULL,NULL),('Chroicocephalus ridibundus','Kokmeeuw',3,0,0,1,'GRND',2,102,'EE',NULL),('Ciconia ciconia','Ooievaar',8,0,1,1,'PLTF',2,160,'EE',NULL),('Circlus circlus','Waterspreeuw',3,0,0,1,'CVTY',4,28,'EE',NULL),('Circus cyaneus','Blauwe kiekendief',3,0,1,1,'PLTF',2,109,NULL,NULL),('Circus pygargus','Grauwe kiekendief',4,0,1,0,'GRND',2,113,'EE',NULL),('Coccothraustes coccothraustes','Appelvink',4,1,0,0,'BOWL',2,30,'EE',NULL),('Coccyzus americanus','Geelsnavelkoekoek',5,1,0,0,'PLTF',2,46,NULL,NULL),('Colaptes auratus','Gouden grondspecht',2,1,1,0,'CVTY',4,51,NULL,NULL),('Colinus virginianus','Boomkwartel',5,0,1,0,'GRND',6,33,NULL,NULL),('Columbina inca','Incaduif',2,0,1,0,'PLTF',4,28,NULL,NULL),('Coragyps atratus','Zwarte gier',2,1,0,0,'CVTY',1,150,NULL,NULL),('Corvus assifragus','Viskraai',6,1,1,1,'PLTF',2,91,NULL,NULL),('Corvus brachyrhynchos','Amerikaanse kraai',4,1,1,1,'PLTF',2,99,NULL,NULL),('Corvus corax','Raaf',5,1,1,1,'PLTF',2,135,NULL,NULL),('Corvus cornix','Bonte kraai',3,0,1,1,'PLTF',2,99,'EE',NULL),('Corvus corone','Zwarte kraai',3,0,1,1,'PLTF',2,92,'EE',NULL),('Corvus cryptoleucus','Woestijnraaf',4,0,1,0,'PLTF',3,112,NULL,NULL),('Cuculus canorus','Koekoek',4,1,1,0,NULL,0,57,'EE',NULL),('Cyanocitta cristata','Blauwe gaai',3,1,0,0,'BOWL',2,41,NULL,NULL),('Cyanocitta stelleri','Stellers gaai',5,1,0,0,'BOWL',2,48,NULL,NULL),('Cygnus buccinator','Trompetzwaan',9,0,0,1,'GRND',2,203,NULL,NULL),('Cygnus olor','Knobbelzwaan',4,0,0,1,'GRND',3,220,'EE',NULL),('Dendrocopos leucotos','Witrugspecht',2,1,0,0,'CVTY',2,39,'EE',NULL),('Dendrocygna autumnalis','Zwartbuikfluiteend',2,0,0,1,'CVTY',5,76,NULL,NULL),('Dolichonyx aryzivorus','Bobolink',4,0,1,0,'GRND',3,30,NULL,NULL),('Dryocopus martius','Zwarte specht',4,1,0,0,'CVTY',2,70,'EE',NULL),('Dryocopus pileatus','Noord-Amerikaanse helmspecht',4,1,0,0,'CVTY',2,74,NULL,NULL),('Dumetella carolinensis','Katvogel',5,1,1,1,'BOWL',3,28,NULL,NULL),('Egretta thula','Amerikaanse kleine zilverreiger',4,0,0,1,'PLTF',2,104,NULL,NULL),('Emberiza citrinella','Geelgors',2,1,1,0,'GRND',3,26,'EE',NULL),('Eremophilia alpestris','Strandleeuwerik',5,0,1,0,'GRND',4,30,NULL,NULL),('Erithacus rubecula','Roodborst',4,1,0,0,'BOWL',4,22,'EE',NULL),('Euphagus cyanocephalus','Brewers troepiaal',3,0,1,0,'BOWL',3,41,NULL,NULL),('Falco eleanorae','Eleanora\'s valk',6,0,0,1,'GRND',2,95,'EE',NULL),('Falco peregrinus','Slechtvalk',5,0,1,1,'PLTF',2,104,NULL,NULL),('Falco sparverius','Amerikaanse torenvalk',5,0,1,0,'CVTY',3,56,NULL,NULL),('Falco subbuteo','Boomvalk',4,1,1,1,'PLTF',2,75,'EE',NULL),('Fratercula arctica','Papegaaiduiker',8,0,0,1,'STAR',1,53,NULL,NULL),('Fringilla coelebs','Vink',4,1,1,0,'BOWL',2,27,'EE',NULL),('Fulica americana','Amerikaanse meerkoet',3,0,0,1,'PLTF',5,61,NULL,NULL),('Galerida theklae','Thekla\'s leeuwerik',4,0,1,0,'GRND',3,34,'EE',NULL),('Gallinago delicata','Amerikaanse watersnip',5,0,0,1,'GRND',2,41,NULL,NULL),('Gallinula chloropus','Waterhoen',3,0,0,1,'STAR',6,53,'EE',NULL),('Garrulus glandarius','Gaai',4,1,0,0,'BOWL',3,56,'EE',NULL),('Gavia arctica','Parelduiker',5,0,0,1,'GRND',1,120,'EE',NULL),('Gavia immer','IJsduiker',6,0,0,1,'GRND',1,117,NULL,NULL),('Geococcyx californianus','Grote renkoekoek',7,0,1,0,'PLTF',2,56,NULL,NULL),('Geothlypis trichas','Gewone maskerzanger',1,0,0,1,'BOWL',4,18,NULL,NULL),('Grus americana','Trompetkraanvogel',6,0,0,1,'GRND',1,221,NULL,NULL),('Gymnogyps californianus','Californische condor',1,1,1,1,'GRND',1,277,NULL,NULL),('Gyps fulvus','Vale gier',1,0,1,0,'PLTF',1,252,'EE',NULL),('Haematopus palliatus','Amerikaanse bonte scholekster',5,0,0,1,'GRND',2,81,NULL,NULL),('Haemorhous cassinii','Cassins roodmus',4,1,0,0,'BOWL',3,30,NULL,NULL),('Haemorhous mexicanus','Mexicaanse roodmus',3,1,1,1,'BOWL',6,25,NULL,NULL),('Haliaeetus leucocephalus','Amerikaanse zeearend',9,0,0,1,'PLTF',1,203,NULL,NULL),('Himantopus mexicanus','Amerikaanse steltkluut',4,0,0,1,'GRND',2,74,NULL,NULL),('Hirundo rustica','Boerenzwaluw',1,0,1,1,'STAR',3,38,NULL,NULL),('Ichthyaetus audouinii','Audouins meeuw',1,0,0,1,'GRND',2,132,'EE',NULL),('Icteria virens','Geelborstzanger',5,1,1,1,'BOWL',3,25,NULL,NULL),('Icterus galbula','Baltimoretroepiaal',9,1,0,0,'STAR',2,30,NULL,NULL),('Ictinia mississippiensis','Mississippiwouw',4,1,1,0,'PLTF',1,79,NULL,NULL),('Ixobrychus minutus','Woudaap',2,0,0,1,'PLTF',3,49,'EE',NULL),('Junco hyemalis','Grijze junco',3,1,1,0,'GRND',3,23,NULL,NULL),('Lacustella luscinioides','Snor',1,0,0,1,'BOWL',4,20,'EE',NULL),('Lanius collurio','Grauwe klauwier',5,0,1,0,'BOWL',2,33,'EE',NULL),('Lanius ludovicianus','Amerikaanse klapekster',3,0,1,1,'BOWL',4,30,NULL,NULL),('Laphodytes cucullatus','Kokardezaagbek',5,0,0,1,'CVTY',4,61,NULL,NULL),('Larus delawarensis','Ringsnavelmeeuw',4,0,0,1,'GRND',2,122,NULL,NULL),('Laxia curvirostra','Kruisbek',6,1,0,0,'BOWL',2,28,NULL,NULL),('Laxia pytyopsittacus','Grote kruisbek',6,1,0,0,'BOWL',2,30,'EE',NULL),('Leucophaeus pipixcan','Franklins meeuw',3,0,1,1,'STAR',2,91,NULL,NULL),('Limosa limosa','Grutto',6,0,0,1,'GRND',2,76,'EE',NULL),('Luscinia megarhynchos','Nachtegaal',3,1,1,1,'BOWL',4,23,'EE',NULL),('Luscinia svecica','Blauwborst',7,0,1,1,'GRND',5,22,'EE',NULL),('Malathrus ater','Bruinkopkoevogel',3,0,1,0,NULL,0,30,NULL,NULL),('Marus bassanus','Jan-van-gent',5,0,0,1,'GRND',1,173,'EE',NULL),('Megaceryle alcyon','Bandijsvogel',4,0,0,1,'STAR',4,53,NULL,NULL),('Megascops asia','Oostelijke schreeuwuil',4,1,0,0,'CVTY',2,51,NULL,NULL),('Melanerpes carolinus','Roodbuikspecht',1,1,0,0,'CVTY',3,41,NULL,NULL),('Melanerpes erythrocephalus','Roodkopspecht',4,1,1,1,'CVTY',3,43,NULL,NULL),('Melanerpes farmicivorus','Eikelspecht',5,1,0,0,'CVTY',4,46,NULL,NULL),('Meleagris gallopavo','Kalkoen',8,1,1,0,'GRND',5,135,NULL,NULL),('Melospiza lincolnii','Lincolns gors',3,1,1,1,'GRND',2,20,NULL,NULL),('Melospiza melodia','Zanggors',0,1,1,1,'BOWL',5,20,NULL,NULL),('Mergus merganser','Grote zaagbek',5,0,0,1,'CVTY',4,86,NULL,NULL),('Mergus serrator','Middelste zaagbek',3,0,0,1,'GRND',4,78,'SW',5),('Merops apiaster','Bijeneter',3,0,1,0,'CVTY',3,38,'EE',NULL),('Milvus milvus','Rode wouw',4,1,1,1,'PLTF',2,157,'EE',NULL),('Mimus polyglottos','Spotlijster',2,1,1,1,'BOWL',4,36,NULL,NULL),('Motacilla alba','Witte kwikstaart',2,0,1,1,'BOWL',5,28,'EE',NULL),('Motothrus aeneus','Roodoogkoevogel',5,0,1,0,NULL,0,36,NULL,NULL),('Mycteria americana','Kaalkopooievaar',6,0,0,1,'PLTF',2,155,NULL,NULL),('Myiarchus cinerascens','Grijskeeltiran',4,0,1,0,'CVTY',4,30,NULL,NULL),('Myiarchus crinitus','Grote kuiftiran',5,1,0,0,'CVTY',3,33,NULL,NULL),('Myioborus pictus','Roodbuikzanger',1,1,0,0,'GRND',3,22,'SW',7),('Nucifraga caryocatactes','Notenkraker',5,1,0,0,'BOWL',2,55,'EE',NULL),('Nucifraga columbiana','Grijze notenkraker',5,1,0,0,'PLTF',2,61,NULL,NULL),('Nycticorax nycticorax','Kwak',9,0,0,1,'PLTF',2,112,NULL,NULL),('Oceanites oceanicus','Wilsons stormvogeltje',6,0,0,1,'STAR',1,38,'EE',NULL),('Oriolus oriolus','Wielewaal',4,1,1,0,'STAR',2,46,'EE',NULL),('Oxyura jamaicensis','Rosse stekelstaart',0,0,0,1,'PLTF',5,48,NULL,NULL),('Pandion haliaetus','Visarend',5,0,0,1,'PLTF',2,160,NULL,NULL),('Parus major','Koolmees',4,1,0,0,'CVTY',6,24,'EE',NULL),('Passer domesticus','Huismus',6,0,1,0,'CVTY',5,22,'EE',NULL),('Passer mantanus','Ringmus',3,1,1,0,'CVTY',3,21,'EE',NULL),('Passerculus sandwichensis','Savannahgors',2,0,1,0,'GRND',3,18,NULL,NULL),('Passerina amoena','Lazuligors',4,0,1,0,'BOWL',4,23,NULL,NULL),('Passerina caerulea','Blauwe bisschop',4,1,1,1,'BOWL',3,28,NULL,NULL),('Passerina ciris','Purpergors',5,0,1,0,'BOWL',4,23,NULL,NULL),('Passerina cyanea','Indigogors',5,1,1,0,'BOWL',3,20,NULL,NULL),('Pelecanus erythrorhynchos','Witte pelikaan',5,0,0,1,'GRND',1,274,NULL,NULL),('Pelecanus occidentalis','Bruine pelikaan',4,0,0,1,'PLTF',2,201,NULL,NULL),('Periparus ater','Zwarte mees',2,1,0,0,'CVTY',6,16,'EE',NULL),('Pernis apivorus','Wespendief',4,1,0,0,'PLTF',1,134,'EE',NULL),('Peucaea cassinii','Cassins gors',3,0,1,0,'GRND',2,20,NULL,NULL),('Phalacrocorax auritus','Geoorde aalscholver',3,0,0,1,'PLTF',3,132,NULL,NULL),('Pheucticus ludovicianus','Roodborstkardinaal',6,1,0,0,'BOWL',3,33,NULL,NULL),('Phoenicopterus roseus','Flamingo',3,0,0,1,'GRND',1,152,'EE',NULL),('Phoenicurus achruras','Zwarte roodstaart',0,0,1,0,'STAR',4,24,'EE',NULL),('Phylloscopus collybita','Tjiftjaf',3,1,0,1,'GRND',4,20,'EE',NULL),('Pica hudsonia','Amerikaanse ekster',3,0,1,0,'STAR',3,64,NULL,NULL),('Pica pica','Ekster',1,0,1,0,'PLTF',3,50,'EE',NULL),('Picoides borealis','Kokardespecht',4,1,0,0,'CVTY',2,36,NULL,NULL),('Picoides pubescens','Donsspecht',3,1,0,0,'CVTY',2,30,NULL,NULL),('Picus viridis','Groene specht',4,1,1,0,'CVTY',3,48,'EE',NULL),('Pilpilo maculatus','Gevlekte towie',0,1,1,0,'GRND',4,28,NULL,NULL),('Piranga ludoviciana','Louisianatangare',6,1,0,0,'BOWL',2,30,NULL,NULL),('Platalea ajaja','Rode lepelaar',6,0,0,1,'PLTF',2,127,NULL,NULL),('Plectrophenax nivalis','Sneeuwgors',5,0,1,1,'CVTY',2,35,'EE',NULL),('Plegadis chihi','Witmaskeribis',8,0,0,1,'PLTF',2,91,NULL,NULL),('Podiceps cristatus','Fuut',3,0,0,1,'STAR',2,65,'EE',NULL),('Podilymbus podiceps','Dikbekfuut',0,0,0,1,'PLTF',4,41,NULL,NULL),('Poecile carolinensis','Carolinamees',2,1,0,0,'CVTY',3,20,NULL,NULL),('Poecile gambeli','Gambels mees',2,1,0,0,'CVTY',3,23,NULL,NULL),('Polioptila caerulea','Blauwgrijze muggenvanger',1,1,0,0,'BOWL',3,15,NULL,NULL),('Porphyrio martinicus','Amerikaanse purperhoen',7,0,0,1,'PLTF',4,56,NULL,NULL),('Progne subis','Purperzwaluw',2,0,1,1,'CVTY',3,46,NULL,NULL),('Protonotaria citrea','Citroenzanger',8,1,0,1,'CVTY',4,23,NULL,NULL),('Prunella modularis','Heggenmus',1,1,0,0,'BOWL',4,20,'EE',NULL),('Psaltriparus minimus','Struikmees',2,1,1,1,'STAR',5,15,NULL,NULL),('Pyrrhula pyrrhula','Goudvink',3,1,0,0,'BOWL',4,24,'EE',NULL),('Quiscalus quiscula','Glanstroepiaal',3,1,1,1,'BOWL',3,43,NULL,NULL),('Rallus elegans','Koningsral',4,0,0,1,'PLTF',6,51,NULL,NULL),('Recurvirostra americana','Amerikaanse kluut',6,0,0,1,'GRND',2,79,NULL,NULL),('Regulus calendula','Roodkroonhaan',2,1,0,0,'BOWL',3,20,NULL,NULL),('Regulus regulus','Goudhaan',1,1,0,0,'BOWL',6,15,'EE',NULL),('Rynchops niger','Amerikaanse schaarbek',6,0,0,1,'GRND',2,112,NULL,NULL),('Sayornis phoebe','Phoebe',3,1,1,1,'STAR',4,28,NULL,NULL),('Sayornis saya','Says phoebe',5,0,1,0,'BOWL',3,33,NULL,NULL),('Scolopax minor','Amerikaanse houtsnip',9,1,1,0,'GRND',2,46,NULL,NULL),('Seteophaga citrina','Monnikszanger',7,1,0,0,'BOWL',3,18,NULL,NULL),('Setophaga caronata','Mirtezanger',1,1,0,0,'BOWL',4,23,NULL,NULL),('Setophaga cerulea','Azuurzanger',4,1,0,0,'BOWL',2,20,NULL,NULL),('Setophaga ruticilla','Amerikaanse roodstaart',4,1,0,0,'BOWL',2,20,'SW',2),('Sialia currucoides','Bergsialia',4,0,1,0,'CVTY',5,36,NULL,NULL),('Sialia sialis','Roodkeelsialia',4,0,1,0,'CVTY',5,33,NULL,NULL),('Sitta canadersis','Canadese boomklever',2,1,0,0,'CVTY',3,23,NULL,NULL),('Sitta carolinensis','Witborstboomklever',2,1,0,0,'CVTY',3,28,NULL,NULL),('Sitta europaea','Boomklever',3,1,0,0,'CVTY',3,25,'EE',NULL),('Sitta pygmaea','Dwergboomklever',2,1,0,0,'CVTY',2,20,NULL,NULL),('Sitta whiteheadi','Corsicaanse boomklever',4,1,0,0,'CVTY',4,21,'EE',NULL),('Spatula clypeata','Slobeend',7,0,0,1,'GRND',4,76,NULL,NULL),('Sphyrapicus varius','Geelbuikspecht',3,1,0,0,'CVTY',3,41,NULL,NULL),('Spinus pinus','Dennensijs',3,1,0,0,'BOWL',2,23,NULL,NULL),('Spinus tristis','Goudsijs',3,0,1,0,'BOWL',3,23,NULL,NULL),('Spiza americana','Dickcissel',4,0,1,0,'GRND',3,25,NULL,NULL),('Spizella passerina','Musgors',1,1,1,0,'BOWL',3,23,NULL,NULL),('Sterna forsteri','Forsters stern',4,0,0,1,'STAR',2,79,NULL,NULL),('Streptopelia decaocto','Turkse tortel',5,0,1,0,'PLTF',2,52,'EE',NULL),('Streptopelia turtur','Zomertortel',4,1,1,1,'PLTF',1,51,'EE',NULL),('Strix accidentalis','Gevlekte bosuil',5,1,0,0,'CVTY',1,102,NULL,NULL),('Strix varia','Gestreepte bosuil',3,1,0,0,'CVTY',2,107,NULL,NULL),('Sturnella neglecta','Geelkaakweidespreeuw',2,0,1,0,'GRND',4,38,NULL,NULL),('Sturnus vulgaris','Spreeuw',3,0,1,1,'CVTY',4,38,'EE',NULL),('Sylvia curruca','Braamsluiper',0,1,1,0,'BOWL',2,18,'EE',NULL),('Sylvia subalpina','Moltoni\'s baardgrasmus',3,0,1,0,'BOWL',2,17,'EE',NULL),('Tachycineta bicolor','Boomzwaluw',3,0,0,1,'CVTY',4,38,NULL,NULL),('Tachycineta thalassina','Groene zwaluw',3,1,1,1,'CVTY',3,36,NULL,NULL),('Tetrax tetrax','Kleine trap',4,0,1,0,'GRND',2,110,'EE',NULL),('Thryomanes bewickii','Bewicks winterkoning',4,1,1,1,'CVTY',3,18,NULL,NULL),('Thryothorus ludovicianus','Carolinawinterkoning',1,1,0,0,'CVTY',5,20,NULL,NULL),('Tringa semipalmata','Willet',4,0,0,1,'GRND',2,66,NULL,NULL),('Troglodytes aedon','Noordelijke huiswinterkoning',1,1,1,0,'CVTY',5,15,NULL,NULL),('Turdus merula','Merel',4,1,0,0,'BOWL',5,36,'EE',NULL),('Turdus migratorius','Roodborstlijster',1,1,1,0,'BOWL',4,43,NULL,NULL),('Tympanuchus cupido','Prairiehoen',5,0,1,0,'GRND',4,71,NULL,NULL),('Tyrannus forficatus','Zwaluwstaartkoningstiran',8,0,1,0,'BOWL',2,38,NULL,NULL),('Tyrannus tyrannus','Koningstiran',2,1,1,1,'BOWL',2,38,NULL,NULL),('Tyto alba','Kerkuil',5,1,1,1,'CVTY',4,107,NULL,NULL),('Vermivora cyanoptera','Blauwvleugelzanger',8,1,1,0,'BOWL',2,20,NULL,NULL),('Vireo belli','Bells vireo',4,1,1,0,'STAR',2,18,NULL,NULL),('Vireo olivaceus','Roodoogvireo',3,1,0,0,'STAR',2,25,NULL,NULL),('Xanthocephalus xanthocephalus','Geelkroptroepiaal',4,0,0,1,'BOWL',3,38,NULL,NULL),('Zanatrichia leucophrys','Witkruingors',2,1,1,1,'GRND',2,25,NULL,NULL),('Zenaida macroura','Treurduif',0,1,1,1,'PLTF',5,46,NULL,NULL);
/*!40000 ALTER TABLE `bird` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_costs`
--

DROP TABLE IF EXISTS `food_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_costs` (
  `worms` smallint unsigned NOT NULL DEFAULT '0',
  `grains` smallint unsigned NOT NULL DEFAULT '0',
  `berries` smallint unsigned NOT NULL DEFAULT '0',
  `fish` smallint unsigned NOT NULL DEFAULT '0',
  `rats` smallint unsigned NOT NULL DEFAULT '0',
  `wild` smallint unsigned NOT NULL DEFAULT '0',
  `scientific_name` varchar(50) NOT NULL,
  PRIMARY KEY (`scientific_name`,`worms`,`grains`,`berries`,`fish`,`rats`,`wild`),
  CONSTRAINT `fk_costs_per_bird` FOREIGN KEY (`scientific_name`) REFERENCES `bird` (`scientific_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_costs`
--

LOCK TABLES `food_costs` WRITE;
/*!40000 ALTER TABLE `food_costs` DISABLE KEYS */;
INSERT INTO `food_costs` VALUES (1,0,0,0,0,0,'Aeronautes saxatalis'),(0,0,0,0,0,1,'Archillocus alexandri'),(0,1,0,0,0,1,'Aythya valisineria'),(0,1,0,0,0,1,'Branta bernicla'),(0,0,0,1,0,0,'Buteo platypterus'),(0,1,0,0,0,0,'Callipepla squamata'),(1,0,0,0,0,0,'Chaetura vauxi'),(1,0,0,1,0,0,'Mergus serrator'),(1,0,0,0,0,0,'Myioborus pictus'),(1,0,1,0,0,0,'Setophaga ruticilla');
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

-- Dump completed on 2026-06-12 23:53:22
