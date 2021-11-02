-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` DEFAULT CHARACTER SET utf8;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`SALESPERSONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`SALESPERSONS` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`INVOICES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`INVOICES` (
  `number` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `car` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `salesperson` VARCHAR(45) NOT NULL,
  `SALESPERSONS_ID` INT NOT NULL,
  PRIMARY KEY (`number`),
  UNIQUE INDEX `number_UNIQUE` (`number` ASC) VISIBLE,
  UNIQUE INDEX `customer_UNIQUE` (`customer` ASC) VISIBLE,
  UNIQUE INDEX `salesperson_UNIQUE` (`salesperson` ASC) VISIBLE,
  INDEX `fk_INVOICES_SALESPERSONS1_idx` (`SALESPERSONS_ID` ASC) VISIBLE,
  CONSTRAINT `fk_INVOICES_SALESPERSONS1`
    FOREIGN KEY (`SALESPERSONS_ID`)
    REFERENCES `new_schema1`.`SALESPERSONS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`CUSTOMERS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  `phone#` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip code` VARCHAR(45) NOT NULL,
  `SALESPERSONS_ID` INT NOT NULL,
  `INVOICES_number` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `phone#_UNIQUE` (`phone#` ASC) VISIBLE,
  INDEX `fk_CUSTOMERS_SALESPERSONS1_idx` (`SALESPERSONS_ID` ASC) VISIBLE,
  INDEX `fk_CUSTOMERS_INVOICES1_idx` (`INVOICES_number` ASC) VISIBLE,
  CONSTRAINT `fk_CUSTOMERS_SALESPERSONS1`
    FOREIGN KEY (`SALESPERSONS_ID`)
    REFERENCES `new_schema1`.`SALESPERSONS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUSTOMERS_INVOICES1`
    FOREIGN KEY (`INVOICES_number`)
    REFERENCES `new_schema1`.`INVOICES` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`CARS` (
  `index` INT NOT NULL AUTO_INCREMENT,
  `VIN` INT NOT NULL,
  `manufacturer` VARCHAR(5) NULL,
  `model` VARCHAR(5) NULL,
  `year` DATETIME NULL,
  `color` VARCHAR(5) NULL,
  `INVOICES_number` INT NOT NULL,
  `SALESPERSONS_ID` INT NOT NULL,
  UNIQUE INDEX `VIN_UNIQUE` (`VIN` ASC) VISIBLE,
  PRIMARY KEY (`index`, `INVOICES_number`),
  UNIQUE INDEX `index_UNIQUE` (`index` ASC) VISIBLE,
  INDEX `fk_CARS_INVOICES1_idx` (`INVOICES_number` ASC) VISIBLE,
  INDEX `fk_CARS_SALESPERSONS1_idx` (`SALESPERSONS_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CARS_CUSTOMERS`
    FOREIGN KEY (`index`)
    REFERENCES `new_schema1`.`CUSTOMERS` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CARS_INVOICES1`
    FOREIGN KEY (`INVOICES_number`)
    REFERENCES `new_schema1`.`INVOICES` (`number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_CARS_SALESPERSONS1`
    FOREIGN KEY (`SALESPERSONS_ID`)
    REFERENCES `new_schema1`.`SALESPERSONS` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
