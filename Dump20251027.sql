CREATE DATABASE  IF NOT EXISTS `gym` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: gym
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fk_idplan` int NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `role` char(1) NOT NULL DEFAULT 'U',
  `imagen` text,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Clientes_plan_idx` (`fk_idplan`),
  CONSTRAINT `fk_Clientes_plan` FOREIGN KEY (`fk_idplan`) REFERENCES `plan` (`idplan`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (6,'sara','sara@gmail.com','$2b$10$UznmuTSArBoxvt8aiHdT8O0dxIlxaQvk1KE/MmhdnczI8.cZyYkse',3,NULL,'U',NULL),(7,'admin','admin@gmail.com','$2b$10$3uthuaUqwTo9tbEhTcKde..5PEioxXyS.F.GuDEMS1mvypq8mL6DK',1,NULL,'A',NULL),(8,'Pepe','pepe@gmail.com','$2b$10$TNW4Lr0tS3tlXHoztcaUDOHHB1kBeNbXgvNraCXKceWKzW7inG4K2',1,NULL,'U',NULL),(10,'Pepe','pepe2@gmail.com','$2b$10$tGO9z4/XLtic4WgyUp/H/ej5aUQOuIreBwy/lA2O89K3EL8VucfgG',7,NULL,'U',NULL),(11,'algo','a@a','$2b$10$OE2XWeDw70VMSqcgdrsoGOfdWMK7bk.3xIxfNHfwNgHH1y0/Lu.Pe',1,NULL,'U','https://res.cloudinary.com/dpyviyavp/image/upload/v1761580208/Gym/a4vxury86q3k72hvmjfj.jpg');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_has_entrenador`
--

DROP TABLE IF EXISTS `clientes_has_entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_has_entrenador` (
  `fk_idCliente` int NOT NULL,
  `fk_idempleados` int NOT NULL,
  `id_entrenador_cliente` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_entrenador_cliente`),
  KEY `fk_clientes_has_entrenador_entrenador1_idx` (`fk_idempleados`),
  KEY `fk_clientes_has_entrenador_clientes1_idx` (`fk_idCliente`),
  CONSTRAINT `fk_clientes_has_entrenador_clientes1` FOREIGN KEY (`fk_idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_clientes_has_entrenador_entrenador1` FOREIGN KEY (`fk_idempleados`) REFERENCES `entrenador` (`idempleados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_has_entrenador`
--

LOCK TABLES `clientes_has_entrenador` WRITE;
/*!40000 ALTER TABLE `clientes_has_entrenador` DISABLE KEYS */;
INSERT INTO `clientes_has_entrenador` VALUES (6,1,1),(7,3,2),(8,3,3);
/*!40000 ALTER TABLE `clientes_has_entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `sueldo` float NOT NULL,
  PRIMARY KEY (`idempleados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES (1,'Pedro',1800),(2,'Juan',1850),(3,'Marta',2000);
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `idnomina` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `fk_idempleados` int NOT NULL,
  PRIMARY KEY (`idnomina`),
  KEY `fk_nomina_entrenador1_idx` (`fk_idempleados`),
  CONSTRAINT `fk_nomina_entrenador1` FOREIGN KEY (`fk_idempleados`) REFERENCES `entrenador` (`idempleados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `idplan` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`idplan`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Plan VIP',85,''),(2,'PLAN Premium',70.2,''),(3,'Plan esencial',50.3,''),(7,'Plan vagabundo',25.5,''),(8,'plan basico',35,''),(9,'algo2',3.14152,'');
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-27 17:18:30
