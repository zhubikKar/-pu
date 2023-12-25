
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema estates
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema estates
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `property` DEFAULT CHARACTER SET utf8 ;
USE `property` ;

-- -----------------------------------------------------
-- Table `property`.`Owners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`Owners` (
  `ID` INT NOT NULL,
  `firstname` VARCHAR(128) NOT NULL,
  `surname` VARCHAR(128) NOT NULL,
  `email` VARCHAR(200) NULL,
  `telegram` VARCHAR(200) NULL,
  `vk` VARCHAR(200) NULL,
  `update` TIMESTAMP NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`Realtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`Realtor` (
  `ID` INT NOT NULL,
  `firstname` VARCHAR(128) NOT NULL,
  `surname` VARCHAR(128) NOT NULL,
  `email` VARCHAR(200) NULL,
  `telegram` VARCHAR(200) NULL,
  `vk` VARCHAR(200) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`Apartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`Apartment` (
  `ID` INT NOT NULL,
  `ownersID` INT NULL,
  `full_area` DECIMAL(10,2) UNSIGNED NULL,
  `live_area` DECIMAL(10,2) UNSIGNED NOT NULL,
  `kitchen_size` DECIMAL(10,2) UNSIGNED NULL,
  `rooms` TINYINT UNSIGNED NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `apartment_floors` TINYINT UNSIGNED NULL,
  `floor` TINYINT UNSIGNED NULL,
  `cost` DECIMAL(10,2) UNSIGNED NULL DEFAULT 0,
  `register_date` TIMESTAMP NULL,
  `update` TIMESTAMP NULL,
  PRIMARY KEY (`ID`),
  INDEX `ownersID_idx` (`ownersID` ASC) VISIBLE,
  CONSTRAINT `ownersID`
    FOREIGN KEY (`ownersID`)
    REFERENCES `property`.`owners` (`ID`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`Apartment_Realtors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`Apartment_Realtors` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `realtorID` INT NOT NULL,
  `apartmentID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `realtorID_idx` (`realtorID` ASC) VISIBLE,
  INDEX `apartmentID_idx` (`apartmentID` ASC) VISIBLE,
  CONSTRAINT `realtorID`
    FOREIGN KEY (`realtorID`)
    REFERENCES `property`.`Realtor` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `apartmentID`
    FOREIGN KEY (`apartmentID`)
    REFERENCES `property`.`Apartment` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `property` ;

-- -----------------------------------------------------
-- Placeholder table for view `property`.`owners_flats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`owners_flats` (`ID` INT, `surname` INT, `firstname` INT, `flats` INT);

-- -----------------------------------------------------
-- Placeholder table for view `property`.`flats_2room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`flats_2room` (`ownersID` INT, `live_area` INT, `address` INT, `cost` INT);

-- -----------------------------------------------------
-- Placeholder table for view `property`.`mid_flat_cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`mid_flat_cost` (`rooms` INT, `mid_cost` INT);

-- -----------------------------------------------------
-- View `property`.`owners_flats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property`.`owners_flats`;
USE `property`;
CREATE  OR REPLACE VIEW owners_flats AS
    SELECT Owners.ID, surname, firstname, Count(*) as flats
    FROM Owners
    LEFT JOIN Apartment as apart ON apart.ownersID = Owners.ID
    GROUP BY owners.ID;

-- -----------------------------------------------------
-- View `property`.`flats_2room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property`.`flats_2room`;
USE `property`;
CREATE  OR REPLACE VIEW flats_2room AS
    SELECT ownersID, live_area, address, cost
    FROM Apartment
    WHERE rooms = 2;

-- -----------------------------------------------------
-- View `property`.`mid_flat_cost`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `property`.`mid_flat_cost`;
USE `property`;
CREATE  OR REPLACE VIEW mid_flat_cost AS
    SELECT rooms, ROUND(AVG(cost), 2) as mid_cost
    FROM Apartment
    GROUP BY rooms;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
