-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: registro_detenidos
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `causa`
--

DROP TABLE IF EXISTS `causa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `causa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEPARTAMENTOJUDICIAL` varchar(255) DEFAULT NULL,
  `DELITO_ID` int(11) DEFAULT NULL,
  `NUMEROCAUSA` varchar(255) DEFAULT NULL,
  `DEFENSORIA_ID` int(11) DEFAULT NULL,
  `FISCALIA_ID` int(11) DEFAULT NULL,
  `JUZGADO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CAUSA_FISCALIA_ID` (`FISCALIA_ID`),
  KEY `FK_CAUSA_DEFENSORIA_ID` (`DEFENSORIA_ID`),
  KEY `FK_CAUSA_JUZGADO_ID` (`JUZGADO_ID`),
  CONSTRAINT `FK_CAUSA_DEFENSORIA_ID` FOREIGN KEY (`DEFENSORIA_ID`) REFERENCES `defensoria` (`ID`),
  CONSTRAINT `FK_CAUSA_FISCALIA_ID` FOREIGN KEY (`FISCALIA_ID`) REFERENCES `fiscalia` (`ID`),
  CONSTRAINT `FK_CAUSA_JUZGADO_ID` FOREIGN KEY (`JUZGADO_ID`) REFERENCES `juzgado` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causa`
--

LOCK TABLES `causa` WRITE;
/*!40000 ALTER TABLE `causa` DISABLE KEYS */;
INSERT INTO `causa` VALUES (39,'Trenque Lauquen',8,'17-0-111111/24',36,36,36),(40,'Trenque Lauquen',26,'17-0-111111/24',36,37,37),(41,'Trenque Lauquen',26,'17-0-111111/24',36,36,36),(42,'Trenque Lauquen',3,'17-0-111111/24',36,36,36),(43,'Trenque Lauquen',3,'17-0-111111/24',36,36,36),(44,'Trenque Lauquen',13,'121212',36,36,36),(45,'Trenque Lauquen',3,'121212',36,36,36),(46,'Trenque Lauquen',3,'17-0-111111/24',36,36,36),(47,'Trenque Lauquen',6,'17-0-111111/24',36,37,36),(48,'Trenque Lauquen',9,'17-0-111111/24',36,36,36),(49,'Trenque Lauquen',16,'121212',36,36,36),(50,'Trenque Lauquen',3,'121212',36,36,36),(51,'Trenque Lauquen',13,'C-12324',36,36,36);
/*!40000 ALTER TABLE `causa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defensoria`
--

DROP TABLE IF EXISTS `defensoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defensoria` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensoria`
--

LOCK TABLES `defensoria` WRITE;
/*!40000 ALTER TABLE `defensoria` DISABLE KEYS */;
INSERT INTO `defensoria` VALUES (36,'DEFENSORIA OFICIAL','EN TURNO'),(37,'DEFENSOR PARTICULAR','A ASIGNAR');
/*!40000 ALTER TABLE `defensoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delito`
--

DROP TABLE IF EXISTS `delito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delito` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delito`
--

LOCK TABLES `delito` WRITE;
/*!40000 ALTER TABLE `delito` DISABLE KEYS */;
INSERT INTO `delito` VALUES (3,'HOMICIDIO SIMPLE'),(4,'HOMICIDIO AGRAVADO'),(5,'HURTO'),(6,'ROBO'),(7,'LESIONES CULPOSAS'),(8,'LESIONES LEVES'),(9,'LESIONES GRAVES'),(10,'ATENTADO Y RESISTENCIA A LA AUTORIDAD'),(11,'ABUSO SEXUAL CON ACCESO CARNAL'),(12,'ABUSO SEXUAL SIMPLE'),(13,'NARCOTRÁFICO'),(14,'TRÁFICO DE PERSONAS'),(15,'EXTORSIÓN'),(16,'ESTAFA'),(17,'FRAUDE'),(18,'AMENAZAS'),(19,'DAÑO'),(20,'FALSIFICACIÓN DE DOCUMENTOS'),(21,'USURPACCIÓN'),(22,'CONTRABANDO'),(23,'ABANDONO DE PERSONAS'),(24,'INJURIAS'),(25,'CALUMNIAS'),(26,'CIBERCRIMEN'),(27,'SECUESTRO'),(28,'ACOSO SEXUAL'),(29,'INCUMPLIMIENTO DE DEBERES DE ASISTENCIA'),(30,'INFRACCIÓN A LA LEY DE ARMAS');
/*!40000 ALTER TABLE `delito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denunciante`
--

DROP TABLE IF EXISTS `denunciante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denunciante` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `causa_id` int(11) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DENUNCIANTE_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  KEY `FK_DENUNCIANTE_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  KEY `FK_DENUNCIANTE_causa_id` (`causa_id`),
  CONSTRAINT `FK_DENUNCIANTE_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  CONSTRAINT `FK_DENUNCIANTE_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`),
  CONSTRAINT `FK_DENUNCIANTE_causa_id` FOREIGN KEY (`causa_id`) REFERENCES `causa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denunciante`
--

LOCK TABLES `denunciante` WRITE;
/*!40000 ALTER TABLE `denunciante` DISABLE KEYS */;
INSERT INTO `denunciante` VALUES (42,'Perez',NULL,'Catamarca 123, Casbas','37757085','1995-01-22',NULL,'Juan',NULL,NULL,'2923530178',48,NULL,NULL,NULL,NULL),(43,'Illescas',NULL,'Rivadavia','37757084','1994-08-28',NULL,'Jonathan',NULL,NULL,'02923530179',50,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `denunciante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detenido`
--

DROP TABLE IF EXISTS `detenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detenido` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `CALIDAD` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `FECHAEGRESO` date DEFAULT NULL,
  `FECHAINGRESO` date DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT 3,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `causa_id` int(11) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `FK_DETENIDO_causa_id` (`causa_id`),
  KEY `FK_DETENIDO_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  KEY `FK_DETENIDO_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  CONSTRAINT `FK_DETENIDO_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  CONSTRAINT `FK_DETENIDO_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`),
  CONSTRAINT `FK_DETENIDO_causa_id` FOREIGN KEY (`causa_id`) REFERENCES `causa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detenido`
--

LOCK TABLES `detenido` WRITE;
/*!40000 ALTER TABLE `detenido` DISABLE KEYS */;
INSERT INTO `detenido` VALUES (42,'Jonathan','Illescas','37757084','No posee','APREHENDIDO','9 de julio 1031 2b, Trenque Lauquen',NULL,'2024-10-30','1994-08-28','SI',9,1,'02923530179',48,33,35,0),(43,'Marcelo','Juarez','12457889','no posee','APREHENDIDO','9 de julio 1031 2b',NULL,'2024-10-30','1994-08-28','SI',1,1,'02923530179',49,33,35,0),(44,'Marcos','PaÃ±a','12457888','no posee','APREHENDIDO','Casbas 123, Dorrego',NULL,'2024-10-30','2019-01-21','SI',1,1,'292355544',50,33,39,0),(45,'Pedro','Picapiedras','1245788','No posee','APREHENDIDO','calle a 123, chubut',NULL,'2024-10-30','2002-01-21','SI',11,2,'02923530179',51,33,38,0);
/*!40000 ALTER TABLE `detenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocivil` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (33,'Soltero/a'),(34,'Casado/a'),(35,'Divorciado/a'),(36,'Viudo/a'),(37,'Separado/a'),(38,'Unión convivencial');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadousuario`
--

DROP TABLE IF EXISTS `estadousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadousuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadousuario`
--

LOCK TABLES `estadousuario` WRITE;
/*!40000 ALTER TABLE `estadousuario` DISABLE KEYS */;
INSERT INTO `estadousuario` VALUES (1,'activo'),(2,'inactivo');
/*!40000 ALTER TABLE `estadousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscalia`
--

DROP TABLE IF EXISTS `fiscalia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fiscalia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscalia`
--

LOCK TABLES `fiscalia` WRITE;
/*!40000 ALTER TABLE `fiscalia` DISABLE KEYS */;
INSERT INTO `fiscalia` VALUES (36,'UFI N° 1','CARINA TALARICO'),(37,'UFI N° 2','MANUEL IGLESIAS');
/*!40000 ALTER TABLE `fiscalia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juzgado`
--

DROP TABLE IF EXISTS `juzgado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juzgado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `TITULAR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juzgado`
--

LOCK TABLES `juzgado` WRITE;
/*!40000 ALTER TABLE `juzgado` DISABLE KEYS */;
INSERT INTO `juzgado` VALUES (36,'CORRECIONAL N°1','MARTIN GARRIZ'),(37,'CORRECIONAL N°2','HERNAN CRESPO');
/*!40000 ALTER TABLE `juzgado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (35,'Argentina'),(36,'Brasil'),(37,'Uruguay'),(38,'Paraguay'),(39,'Chile'),(40,'Bolivia'),(41,'Peru'),(42,'Ecuador'),(43,'Colombia'),(44,'Venezuela');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion`
--

DROP TABLE IF EXISTS `ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocupacion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion`
--

LOCK TABLES `ocupacion` WRITE;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` VALUES (1,'Empleado/a'),(2,'Desempleado/a'),(3,'Estudiante'),(4,'Ama de casa'),(5,'Autónomo/a'),(6,'Jubilado/a'),(7,'Empresario/a'),(8,'Docente'),(9,'Funcionario/a público/a'),(10,'Comerciante'),(11,'Artista'),(12,'Deportista'),(13,'Otro');
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PERSONA_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  KEY `FK_PERSONA_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  CONSTRAINT `FK_PERSONA_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  CONSTRAINT `FK_PERSONA_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policia`
--

DROP TABLE IF EXISTS `policia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policia` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `APODO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `INSTUCCION` varchar(255) DEFAULT NULL,
  `JERARQUIA` varchar(255) DEFAULT NULL,
  `LEGAJO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `OCUPACION` varchar(255) DEFAULT NULL,
  `SEXO` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `ESTADOCIVIL_ID` int(11) DEFAULT NULL,
  `NACIONALIDAD_ID` int(11) DEFAULT NULL,
  `ESTADO` int(1) NOT NULL DEFAULT 1,
  `OCUPACION_ID` int(11) DEFAULT NULL,
  `SEXO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_POLICIA_NACIONALIDAD_ID` (`NACIONALIDAD_ID`),
  KEY `FK_POLICIA_ESTADOCIVIL_ID` (`ESTADOCIVIL_ID`),
  CONSTRAINT `FK_POLICIA_ESTADOCIVIL_ID` FOREIGN KEY (`ESTADOCIVIL_ID`) REFERENCES `estadocivil` (`ID`),
  CONSTRAINT `FK_POLICIA_NACIONALIDAD_ID` FOREIGN KEY (`NACIONALIDAD_ID`) REFERENCES `nacionalidad` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policia`
--

LOCK TABLES `policia` WRITE;
/*!40000 ALTER TABLE `policia` DISABLE KEYS */;
INSERT INTO `policia` VALUES (1,'Illescas',NULL,NULL,'37757084',NULL,NULL,'OFICIAL AYUDANTE','195826','Michael ',NULL,NULL,'2923530179',NULL,NULL,0,NULL,NULL),(5,'Pereyra',NULL,NULL,'123456',NULL,NULL,'COMISARIO','132222','Jose Luis',NULL,NULL,'12311231',NULL,NULL,1,NULL,NULL),(6,'Illescas',NULL,NULL,'12121212',NULL,NULL,'OFICIAL AYUDANTE','195826','Jonathan',NULL,NULL,'122122',NULL,NULL,1,NULL,NULL),(8,'Stangley',NULL,NULL,'124578',NULL,NULL,'OFICIAL','1234567','termo',NULL,NULL,'29235330179',NULL,NULL,0,NULL,NULL),(9,'Arias',NULL,NULL,'37757084',NULL,NULL,'OFICIAL','123444','Julieta',NULL,NULL,'2923530179',NULL,NULL,1,NULL,NULL),(10,'Gadea',NULL,NULL,'37757084',NULL,NULL,'SARGENTO','123456','juan Carlos',NULL,NULL,'2923530179',NULL,NULL,0,NULL,NULL),(14,'perez',NULL,NULL,'3212345',NULL,NULL,'OFICIAL','12345678','jose',NULL,NULL,'2923530179',NULL,NULL,0,NULL,NULL),(15,'botella',NULL,NULL,'1111111',NULL,NULL,'OFICIAL','12456','tapita',NULL,NULL,'112222',NULL,NULL,0,NULL,NULL),(16,'solana',NULL,NULL,'33221144',NULL,NULL,'SUBTENIENTE','445566','Carlos',NULL,NULL,'12121',NULL,NULL,0,NULL,NULL),(17,'acompaÃ±ada',NULL,NULL,'0303456',NULL,NULL,'SUBTENIENTE','0303456','chichi',NULL,NULL,'22333665',NULL,NULL,1,NULL,NULL),(18,'Picapiedras',NULL,NULL,'1244557',NULL,NULL,'MAYOR','1245777','Pedro',NULL,NULL,'292365301',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `policia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHAREGISTRO` date DEFAULT NULL,
  `OBSERVACIONES` varchar(255) DEFAULT NULL,
  `CAUSA_ID` int(11) DEFAULT NULL,
  `USUARIO_ID` int(11) DEFAULT NULL,
  `ESTADO` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `FK_REGISTRO_CAUSA_ID` (`CAUSA_ID`),
  KEY `FK_REGISTRO_USUARIO_ID` (`USUARIO_ID`),
  CONSTRAINT `FK_REGISTRO_CAUSA_ID` FOREIGN KEY (`CAUSA_ID`) REFERENCES `causa` (`ID`),
  CONSTRAINT `FK_REGISTRO_USUARIO_ID` FOREIGN KEY (`USUARIO_ID`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (46,'2024-10-30','sin observaciones',48,1,1),(47,'2024-10-30','sin observaciones',49,1,1),(48,'2024-10-30','sin observaciones',50,1,1),(49,'2024-10-30','',51,1,1);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHACREACION` date DEFAULT NULL,
  `FECHAFIN` date DEFAULT NULL,
  `FECHAINICIO` date DEFAULT NULL,
  `REGISTRO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REPORTE_REGISTRO_ID` (`REGISTRO_ID`),
  CONSTRAINT `FK_REPORTE_REGISTRO_ID` FOREIGN KEY (`REGISTRO_ID`) REFERENCES `registro` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Femenino'),(3,'otro');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLAVE` varchar(255) DEFAULT NULL,
  `CONTADOR` int(11) DEFAULT 0,
  `NOMBREUSUARIO` varchar(255) DEFAULT NULL,
  `ROL` varchar(255) DEFAULT NULL,
  `ESTADO_ID` int(11) DEFAULT NULL,
  `POLICIA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USUARIO_ESTADO_ID` (`ESTADO_ID`),
  KEY `FK_USUARIO_POLICIA_ID` (`POLICIA_ID`),
  CONSTRAINT `FK_USUARIO_ESTADO_ID` FOREIGN KEY (`ESTADO_ID`) REFERENCES `estadousuario` (`ID`),
  CONSTRAINT `FK_USUARIO_POLICIA_ID` FOREIGN KEY (`POLICIA_ID`) REFERENCES `policia` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'202cb962ac59075b964b07152d234b70',6,'jonaIlles','ADMINISTRADOR',1,1),(10,'202cb962ac59075b964b07152d234b70',1,'prueba','ADMINISTRADOR',1,1),(14,'373536a3cebd7e2d83f429abb92301e2',1,'prueba1','USUARIO',1,5),(15,'202cb962ac59075b964b07152d234b70',1,'illescas','ADMINISTRADOR',1,6),(18,'202cb962ac59075b964b07152d234b70',0,'termo','ADMINISTRADOR',1,8),(19,'9e8b3db6934a0e659a3e6458ba65d60c',1,'pruebaClaves','USUARIO',1,9),(21,'0aa1dfb7aa30bf75502133fec53e2fc7',1,'PPIEDRAS','USUARIO',2,18),(22,'202cb962ac59075b964b07152d234b70',0,'CGADEA','USUARIO',1,10);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 12:26:59
