-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `ID_salespersons` INT NOT NULL AUTO_INCREMENT,
  `Staff ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_salespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `ID_invoices` INT NOT NULL AUTO_INCREMENT,
  `Invoice number` INT NOT NULL,
  `Date` DATE NULL,
  `Car` INT NULL,
  `Customer` INT NULL,
  `Sales persons` INT NULL,
  `Salespersons_ID_salespersons` INT NOT NULL,
  PRIMARY KEY (`ID_invoices`),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_ID_salespersons` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_ID_salespersons`)
    REFERENCES `mydb`.`Salespersons` (`ID_salespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `id_cars` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(40) NULL,
  `Manufacturer` VARCHAR(20) NULL,
  `Model` VARCHAR(20) NULL,
  `Year` VARCHAR(20) NULL,
  `Color` VARCHAR(30) NULL,
  `Invoices_ID_invoices` INT NOT NULL,
  PRIMARY KEY (`id_cars`),
  INDEX `fk_cars_Invoices_idx` (`Invoices_ID_invoices` ASC) VISIBLE,
  CONSTRAINT `fk_cars_Invoices`
    FOREIGN KEY (`Invoices_ID_invoices`)
    REFERENCES `mydb`.`Invoices` (`ID_invoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Consumer_id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` VARCHAR(20) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` INT NULL,
  `Invoices_ID_invoices` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Customers_Invoices1_idx` (`Invoices_ID_invoices` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Invoices1`
    FOREIGN KEY (`Invoices_ID_invoices`)
    REFERENCES `mydb`.`Invoices` (`ID_invoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
