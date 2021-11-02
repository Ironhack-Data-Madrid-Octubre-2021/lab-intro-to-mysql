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
-- -----------------------------------------------------
-- Schema cardealership
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `id_car` INT NOT NULL,
  `VIN` CHAR(17) NULL,
  `manufacturer` VARCHAR(10) NULL,
  `model` VARCHAR(20) NULL,
  `year` YEAR NULL,
  `color` VARCHAR(15) NULL,
  PRIMARY KEY (`id_car`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `id_customers` INT NOT NULL,
  `name` VARCHAR(40) NULL,
  `phone_number` VARCHAR(15) NULL,
  `email` VARCHAR(100) NULL,
  `address` VARCHAR(250) NULL,
  `city` VARCHAR(60) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(3) NULL,
  `postal_code` VARCHAR(10) NULL,
  PRIMARY KEY (`id_customers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salespersons` (
  `id_staff` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id_staff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `id_invoices` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `id_car` INT NOT NULL,
  `id_customers` INT NOT NULL,
  `id_staff` INT NOT NULL,
  PRIMARY KEY (`id_invoices`),
  INDEX `fk_invoices_cars_idx` (`id_car` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`id_customers` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`id_staff` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`id_car`)
    REFERENCES `mydb`.`cars` (`id_car`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`id_customers`)
    REFERENCES `mydb`.`customers` (`id_customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`id_staff`)
    REFERENCES `mydb`.`salespersons` (`id_staff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
