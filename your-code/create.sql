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
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `Car_ID` INT NOT NULL,
  `VIN` VARCHAR(40) NOT NULL,
  `Manufacturer` VARCHAR(20) NOT NULL,
  `Model` VARCHAR(20) NOT NULL,
  `Year` INT NOT NULL,
  `Color` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Car_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Cust_ID` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(20) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(20) NULL,
  `State` VARCHAR(20) NULL,
  `Country` VARCHAR(20) NOT NULL,
  `Zip` INT NULL,
  PRIMARY KEY (`Cust_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salesperson` (
  `Staff_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `Invoice_Number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Customer_Cust_ID1` INT NOT NULL,
  `Salesperson_Staff_ID1` INT NOT NULL,
  `Cars_Car_ID` INT NOT NULL,
  PRIMARY KEY (`Invoice_Number`),
  INDEX `fk_Invoice_Customer1_idx` (`Customer_Cust_ID1` ASC) VISIBLE,
  INDEX `fk_Invoice_Salesperson1_idx` (`Salesperson_Staff_ID1` ASC) VISIBLE,
  INDEX `fk_Invoice_Cars1_idx` (`Cars_Car_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_Cust_ID1`)
    REFERENCES `mydb`.`Customer` (`Cust_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Salesperson1`
    FOREIGN KEY (`Salesperson_Staff_ID1`)
    REFERENCES `mydb`.`Salesperson` (`Staff_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_Car_ID`)
    REFERENCES `mydb`.`Cars` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
