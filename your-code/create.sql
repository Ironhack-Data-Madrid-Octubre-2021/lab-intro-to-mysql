-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema conces
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema conces
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `conces` DEFAULT CHARACTER SET utf8 ;
USE `conces` ;

-- -----------------------------------------------------
-- Table `conces`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conces`.`Cars` (
  `idCars` INT NOT NULL AUTO_INCREMENT,
  `Vehicle_id_numbers` VARCHAR(100) NOT NULL,
  `manufacturer` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conces`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conces`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone_number` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  `adress` VARCHAR(100) NOT NULL,
  `city` VARCHAR(100) NOT NULL,
  `province` VARCHAR(100) NULL,
  `country` VARCHAR(100) NOT NULL,
  `Zip-code` INT NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conces`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conces`.`Staff` (
  `Staff-id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff-id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `conces`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conces`.`Invoice` (
  `In.Number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `customer_customer_id` INT NOT NULL,
  `Cars_idCars` INT NOT NULL,
  `Staff_Staff-id` INT NOT NULL,
  PRIMARY KEY (`In.Number`),
  INDEX `fk_Invoice_customer1_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_Invoice_Cars1_idx` (`Cars_idCars` ASC) VISIBLE,
  INDEX `fk_Invoice_Staff1_idx` (`Staff_Staff-id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_customer1`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `conces`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_idCars`)
    REFERENCES `conces`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Staff1`
    FOREIGN KEY (`Staff_Staff-id`)
    REFERENCES `conces`.`Staff` (`Staff-id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
