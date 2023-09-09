-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Id` int NOT NULL,
  `TableNumber` int NOT NULL,
  `Guests` tinyint NOT NULL,
  `Date` datetime NOT NULL,
  `CustomerId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Bookings_Customers1_idx` (`CustomerId`),
  CONSTRAINT `fk_Bookings_Customers1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cousinetypes`
--

DROP TABLE IF EXISTS `cousinetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cousinetypes` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cousinetypes`
--

LOCK TABLES `cousinetypes` WRITE;
/*!40000 ALTER TABLE `cousinetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cousinetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `PhoneNumber` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverydetails`
--

DROP TABLE IF EXISTS `deliverydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverydetails` (
  `Id` int NOT NULL,
  `Date` datetime NOT NULL,
  `DeliveryTypeId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_DeliveryDetails_DeliveryTypes1_idx` (`DeliveryTypeId`),
  CONSTRAINT `fk_DeliveryDetails_DeliveryTypes1` FOREIGN KEY (`DeliveryTypeId`) REFERENCES `deliverytypes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverydetails`
--

LOCK TABLES `deliverydetails` WRITE;
/*!40000 ALTER TABLE `deliverydetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverytypes`
--

DROP TABLE IF EXISTS `deliverytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverytypes` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverytypes`
--

LOCK TABLES `deliverytypes` WRITE;
/*!40000 ALTER TABLE `deliverytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemtypes`
--

DROP TABLE IF EXISTS `itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemtypes` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtypes`
--

LOCK TABLES `itemtypes` WRITE;
/*!40000 ALTER TABLE `itemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `IsSeasonal` bit(1) NOT NULL,
  `IsAvailable` bit(1) NOT NULL,
  `CousineTypeId` int NOT NULL,
  `ItemTypeId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_MenuItem_CousineTypes1_idx` (`CousineTypeId`),
  KEY `fk_MenuItem_ItemType1_idx` (`ItemTypeId`),
  CONSTRAINT `fk_MenuItem_CousineTypes1` FOREIGN KEY (`CousineTypeId`) REFERENCES `cousinetypes` (`Id`),
  CONSTRAINT `fk_MenuItem_ItemType1` FOREIGN KEY (`ItemTypeId`) REFERENCES `itemtypes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Cost` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_has_menuitems`
--

DROP TABLE IF EXISTS `menus_has_menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus_has_menuitems` (
  `MenuId` int NOT NULL,
  `MenuItemId` int NOT NULL,
  PRIMARY KEY (`MenuId`,`MenuItemId`),
  KEY `fk_Menus_has_MenuItem_MenuItem1_idx` (`MenuItemId`),
  KEY `fk_Menus_has_MenuItem_Menus1_idx` (`MenuId`),
  CONSTRAINT `fk_Menus_has_MenuItem_MenuItem1` FOREIGN KEY (`MenuItemId`) REFERENCES `menuitems` (`Id`),
  CONSTRAINT `fk_Menus_has_MenuItem_Menus1` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_has_menuitems`
--

LOCK TABLES `menus_has_menuitems` WRITE;
/*!40000 ALTER TABLE `menus_has_menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus_has_menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id` int NOT NULL,
  `Date` datetime NOT NULL,
  `Discount` decimal(6,2) NOT NULL DEFAULT '0.00',
  `DeliveryDetailsId` int NOT NULL,
  `CustomerId` int NOT NULL,
  `BookingId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Orders_DeliveryDetails1_idx` (`DeliveryDetailsId`),
  KEY `fk_Orders_Customers1_idx` (`CustomerId`),
  KEY `fk_Orders_Bookings1_idx` (`BookingId`),
  CONSTRAINT `fk_Orders_Bookings1` FOREIGN KEY (`BookingId`) REFERENCES `bookings` (`Id`),
  CONSTRAINT `fk_Orders_Customers1` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`Id`),
  CONSTRAINT `fk_Orders_DeliveryDetails1` FOREIGN KEY (`DeliveryDetailsId`) REFERENCES `deliverydetails` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_menus`
--

DROP TABLE IF EXISTS `orders_has_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_menus` (
  `OrderId` int NOT NULL,
  `MenuId` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderId`,`MenuId`),
  KEY `fk_Orders_has_Menus_Menus1_idx` (`MenuId`),
  KEY `fk_Orders_has_Menus_Orders1_idx` (`OrderId`),
  CONSTRAINT `fk_Orders_has_Menus_Menus1` FOREIGN KEY (`MenuId`) REFERENCES `menus` (`Id`),
  CONSTRAINT `fk_Orders_has_Menus_Orders1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_menus`
--

LOCK TABLES `orders_has_menus` WRITE;
/*!40000 ALTER TABLE `orders_has_menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_has_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Surname` varchar(45) NOT NULL,
  `Salary` decimal(6,2) NOT NULL,
  `StaffRoleId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Staff_StaffRoles_idx` (`StaffRoleId`),
  CONSTRAINT `fk_Staff_StaffRoles` FOREIGN KEY (`StaffRoleId`) REFERENCES `staffroles` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffroles`
--

DROP TABLE IF EXISTS `staffroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffroles` (
  `Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffroles`
--

LOCK TABLES `staffroles` WRITE;
/*!40000 ALTER TABLE `staffroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffroles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 15:31:06
