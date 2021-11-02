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
  `car_ID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Fabricante` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Año` YEAR(4) NULL,
  PRIMARY KEY (`car_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `customer_ID` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `phone` VARCHAR(12) NULL,
  `mail` VARCHAR(45) NULL,
  `dirección` VARCHAR(45) NULL,
  `Cod_Postal` CHAR(5) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `País` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_ID`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salesman`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salesman` (
  `salesman_ID` INT NOT NULL,
  `staff_number` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`salesman_ID`),
  UNIQUE INDEX `staff_number_UNIQUE` (`staff_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoice` (
  `invoice_ID` INT NOT NULL,
  `fecha` DATE NULL,
  `Customer_customer_ID` INT NOT NULL,
  `Vendedor_salesman_ID` INT NOT NULL,
  `Cars_car_ID` INT NOT NULL,
  PRIMARY KEY (`invoice_ID`),
  INDEX `fk_Invoice_Customer1_idx` (`Customer_customer_ID` ASC) VISIBLE,
  INDEX `fk_Invoice_Vendedor1_idx` (`Vendedor_salesman_ID` ASC) VISIBLE,
  INDEX `fk_Invoice_Cars1_idx` (`Cars_car_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_customer_ID`)
    REFERENCES `mydb`.`Customer` (`customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_Vendedor1`
    FOREIGN KEY (`Vendedor_salesman_ID`)
    REFERENCES `mydb`.`Salesman` (`salesman_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_Cars1`
    FOREIGN KEY (`Cars_car_ID`)
    REFERENCES `mydb`.`Cars` (`car_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
