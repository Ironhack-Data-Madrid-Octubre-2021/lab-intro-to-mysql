-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Company_Database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Company_Database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Company_Database` DEFAULT CHARACTER SET utf8 ;
USE `Company_Database` ;

-- -----------------------------------------------------
-- Table `Company_Database`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company_Database`.`Cars` (
  `VIN` INT NOT NULL,
  `Manufacturer` VARCHAR(40) NULL,
  `Model` VARCHAR(40) NULL,
  `Year` YEAR NULL,
  `Carscol` VARCHAR(45) NULL,
  `CarID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CarID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company_Database`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company_Database`.`Invoices` (
  `Invoice_Num` INT NOT NULL,
  `Date` DATE NULL,
  `Car` VARCHAR(40) NULL,
  `Customer` VARCHAR(45) NULL,
  `Salesperson_sale` VARCHAR(45) NULL,
  PRIMARY KEY (`Invoice_Num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company_Database`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company_Database`.`Customers` (
  `CustomersID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone_Number` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Zip/PostalID` INT NULL,
  `Invoices_Invoice_Num` INT NOT NULL,
  `Cars_CarID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomersID`, `Cars_CarID`),
  INDEX `fk_Customers_Invoices_idx` (`Invoices_Invoice_Num` ASC) VISIBLE,
  INDEX `fk_Customers_Cars1_idx` (`Cars_CarID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Invoices`
    FOREIGN KEY (`Invoices_Invoice_Num`)
    REFERENCES `Company_Database`.`Invoices` (`Invoice_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customers_Cars1`
    FOREIGN KEY (`Cars_CarID`)
    REFERENCES `Company_Database`.`Cars` (`CarID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company_Database`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company_Database`.`Salespersons` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  `Invoices_Invoice_Num` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_Salespersons_Invoices1_idx` (`Invoices_Invoice_Num` ASC) VISIBLE,
  CONSTRAINT `fk_Salespersons_Invoices1`
    FOREIGN KEY (`Invoices_Invoice_Num`)
    REFERENCES `Company_Database`.`Invoices` (`Invoice_Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
