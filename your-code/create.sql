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
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `car_id` INT NOT NULL,
  `VIN` VARCHAR(25) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_no` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NULL,
  `email` VARCHAR(65) NULL,
  `address` VARCHAR(65) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postalcode` INT NULL,
  PRIMARY KEY (`customer_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `staff_no` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `name` VARCHAR(55) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `id` INT NOT NULL,
  `invoice_number` INT NOT NULL,
  `date` DATE NULL,
  `cars_car_id` INT NOT NULL,
  `customers_customer_no` INT NOT NULL,
  `salesperson_staff_no` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoices_customers1_idx` (`customers_customer_no` ASC) VISIBLE,
  INDEX `fk_invoices_salesperson1_idx` (`salesperson_staff_no` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_car_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_customer_no`)
    REFERENCES `mydb`.`customers` (`customer_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salesperson1`
    FOREIGN KEY (`salesperson_staff_no`)
    REFERENCES `mydb`.`salesperson` (`staff_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_car_id`)
    REFERENCES `mydb`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
