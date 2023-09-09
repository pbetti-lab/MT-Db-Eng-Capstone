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
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
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
  `Salary` DECIMAL(6,2) NOT NULL,
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
-- Table `LittleLemonDB`.`CousineTypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`CousineTypes` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`CousineTypes` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`ItemType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`ItemType` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`ItemType` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(6,2) NOT NULL,
  `IsSeasonal` BIT NOT NULL,
  `IsAvailable` BIT NOT NULL,
  `CousineTypeId` INT NOT NULL,
  `ItemTypeId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_MenuItem_CousineTypes1_idx` (`CousineTypeId` ASC) VISIBLE,
  INDEX `fk_MenuItem_ItemType1_idx` (`ItemTypeId` ASC) VISIBLE,
  CONSTRAINT `fk_MenuItem_CousineTypes1`
    FOREIGN KEY (`CousineTypeId`)
    REFERENCES `LittleLemonDB`.`CousineTypes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuItem_ItemType1`
    FOREIGN KEY (`ItemTypeId`)
    REFERENCES `LittleLemonDB`.`ItemType` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menus` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus_has_MenuItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Menus_has_MenuItem` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus_has_MenuItem` (
  `MenuId` INT NOT NULL,
  `MenuItemId` INT NOT NULL,
  PRIMARY KEY (`MenuId`, `MenuItemId`),
  INDEX `fk_Menus_has_MenuItem_MenuItem1_idx` (`MenuItemId` ASC) VISIBLE,
  INDEX `fk_Menus_has_MenuItem_Menus1_idx` (`MenuId` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_has_MenuItem_Menus1`
    FOREIGN KEY (`MenuId`)
    REFERENCES `LittleLemonDB`.`Menus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_has_MenuItem_MenuItem1`
    FOREIGN KEY (`MenuItemId`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `Id` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `Guests` VARCHAR(45) NOT NULL,
  `Date` DATETIME NOT NULL,
  `CustomersId` INT NOT NULL,
  `StaffId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Bookings_Customers1_idx` (`CustomersId` ASC) VISIBLE,
  INDEX `fk_Bookings_Staff1_idx` (`StaffId` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`CustomersId`)
    REFERENCES `LittleLemonDB`.`Customers` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Staff1`
    FOREIGN KEY (`StaffId`)
    REFERENCES `LittleLemonDB`.`Staff` (`Id`)
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
-- Table `LittleLemonDB`.`DeliveryDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`DeliveryDetails` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryDetails` (
  `Id` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `DeliveryTypes_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_DeliveryDetails_DeliveryTypes1_idx` (`DeliveryTypes_Id` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryDetails_DeliveryTypes1`
    FOREIGN KEY (`DeliveryTypes_Id`)
    REFERENCES `LittleLemonDB`.`DeliveryTypes` (`Id`)
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
  `CustomerId` INT NULL,
  `BookingId` INT NULL,
  `StaffId` INT NOT NULL,
  `DeliveryDetailsId` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Orders_Customers1_idx` (`CustomerId` ASC) VISIBLE,
  INDEX `fk_Orders_Bookings1_idx` (`BookingId` ASC) VISIBLE,
  INDEX `fk_Orders_Staff1_idx` (`StaffId` ASC) VISIBLE,
  INDEX `fk_Orders_DeliveryDetails1_idx` (`DeliveryDetailsId` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`CustomerId`)
    REFERENCES `LittleLemonDB`.`Customers` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Bookings1`
    FOREIGN KEY (`BookingId`)
    REFERENCES `LittleLemonDB`.`Bookings` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Staff1`
    FOREIGN KEY (`StaffId`)
    REFERENCES `LittleLemonDB`.`Staff` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_DeliveryDetails1`
    FOREIGN KEY (`DeliveryDetailsId`)
    REFERENCES `LittleLemonDB`.`DeliveryDetails` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders_has_MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LittleLemonDB`.`Orders_has_MenuItems` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders_has_MenuItems` (
  `OrderId` INT NOT NULL,
  `MenuItemId` INT NOT NULL,
  PRIMARY KEY (`OrderId`, `MenuItemId`),
  INDEX `fk_Orders_has_MenuItems_MenuItems1_idx` (`MenuItemId` ASC) VISIBLE,
  INDEX `fk_Orders_has_MenuItems_Orders1_idx` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_has_MenuItems_Orders1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `LittleLemonDB`.`Orders` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_MenuItems_MenuItems1`
    FOREIGN KEY (`MenuItemId`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
