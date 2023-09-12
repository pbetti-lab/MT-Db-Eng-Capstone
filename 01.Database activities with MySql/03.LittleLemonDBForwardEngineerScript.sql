-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `LittleLemonDB` ;

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Customers` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `Id` INT NOT NULL,
  `FullName` VARCHAR(70) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffRoles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`StaffRoles` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffRoles` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Staff` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(8,2) NOT NULL,
  `StaffRoleId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Staff_StaffRoles_idx` (`StaffRoleId` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_StaffRoles`
    FOREIGN KEY (`StaffRoleId`)
    REFERENCES `LittleLemonDB`.`StaffRoles` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Cuisines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Cuisines` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cuisines` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Starters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Starters` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Starters` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Courses` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Courses` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Sides`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Sides` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Sides` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Drinks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Drinks` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Drinks` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Desserts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Desserts` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Desserts` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `CuisineId` INT NOT NULL,
  `StarterId` INT NOT NULL,
  `CourseId` INT NOT NULL,
  `SideId` INT NOT NULL,
  `DrinkId` INT NOT NULL,
  `DessertId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Menus_Cuisines1_idx` (`CuisineId` ASC) VISIBLE,
  INDEX `fk_Menus_Starters1_idx` (`StarterId` ASC) VISIBLE,
  INDEX `fk_Menus_Courses1_idx` (`CourseId` ASC) VISIBLE,
  INDEX `fk_Menus_Sides1_idx` (`SideId` ASC) VISIBLE,
  INDEX `fk_Menus_Drinks1_idx` (`DrinkId` ASC) VISIBLE,
  INDEX `fk_Menus_Desserts1_idx` (`DessertId` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_Cuisines1`
    FOREIGN KEY (`CuisineId`)
    REFERENCES `LittleLemonDB`.`Cuisines` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Starters1`
    FOREIGN KEY (`StarterId`)
    REFERENCES `LittleLemonDB`.`Starters` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Courses1`
    FOREIGN KEY (`CourseId`)
    REFERENCES `LittleLemonDB`.`Courses` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Sides1`
    FOREIGN KEY (`SideId`)
    REFERENCES `LittleLemonDB`.`Sides` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Drinks1`
    FOREIGN KEY (`DrinkId`)
    REFERENCES `LittleLemonDB`.`Drinks` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_Desserts1`
    FOREIGN KEY (`DessertId`)
    REFERENCES `LittleLemonDB`.`Desserts` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`BookingStates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`BookingStates` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`BookingStates` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `Id` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `Guests` TINYINT NOT NULL,
  `Date` DATETIME NOT NULL,
  `CustomerId` INT NOT NULL,
  `BookingStateId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Bookings_Customers1_idx` (`CustomerId` ASC) VISIBLE,
  INDEX `fk_Bookings_BookingStates1_idx` (`BookingStateId` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `LittleLemonDB`.`Customers` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_BookingStates1`
    FOREIGN KEY (`BookingStateId`)
    REFERENCES `LittleLemonDB`.`BookingStates` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`DeliveryTypes` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryTypes` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Countries` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Countries` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`DeliveryDetails` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryDetails` (
  `Id` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `DeliveryTypeId` INT NOT NULL,
  `PostalCode` INT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CountryId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_DeliveryDetails_DeliveryTypes1_idx` (`DeliveryTypeId` ASC) VISIBLE,
  INDEX `fk_DeliveryDetails_Country1_idx` (`CountryId` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryDetails_DeliveryTypes1`
    FOREIGN KEY (`DeliveryTypeId`)
    REFERENCES `LittleLemonDB`.`DeliveryTypes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DeliveryDetails_Country1`
    FOREIGN KEY (`CountryId`)
    REFERENCES `LittleLemonDB`.`Countries` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `Id` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `DeliveryDetailsId` INT NOT NULL,
  `CustomerId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Orders_DeliveryDetails1_idx` (`DeliveryDetailsId` ASC) VISIBLE,
  INDEX `fk_Orders_Customers1_idx` (`CustomerId` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_DeliveryDetails1`
    FOREIGN KEY (`DeliveryDetailsId`)
    REFERENCES `LittleLemonDB`.`DeliveryDetails` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `LittleLemonDB`.`Customers` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`OrderDetails` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDetails` (
  `OrderId` INT NOT NULL,
  `MenuId` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Sales` DECIMAL(6,2) NOT NULL,
  `Cost` DECIMAL(6,2) NOT NULL,
  `Discount` DECIMAL(6,2) NOT NULL,
  `DeliveryCost` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`OrderId`, `MenuId`),
  INDEX `fk_OrderDetails_Courses1_idx` (`MenuId` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDetails_Menus1`
    FOREIGN KEY (`MenuId`)
    REFERENCES `LittleLemonDB`.`Menus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Orders1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
