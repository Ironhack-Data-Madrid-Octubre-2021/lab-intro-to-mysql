

#############################
#      CREATE THE DB        #
#############################

DROP DATABASE IF EXISTS cardealership;
CREATE DATABASE cardealership;
USE cardealership;

#############################
#      CREATE THE TABLES    #
#############################
-- -----------------------------------------------------
-- Table 'cars'
-- -----------------------------------------------------
CREATE TABLE cars(
  ID INT PRIMARY KEY NOT NULL,
  VIN CHAR(17),
  manufacturer VARCHAR(10),
  model VARCHAR(20),
  model_year YEAR,
  color VARCHAR(15)
  );

-- -----------------------------------------------------
-- Table customers
-- -----------------------------------------------------
CREATE TABLE customers (
  ID INT PRIMARY KEY NOT NULL,
  customer_id INT,
  customer_name VARCHAR(40),
  phone_number VARCHAR(20),
  email VARCHAR(100),
  address VARCHAR(250),
  city VARCHAR(60),
  state_province VARCHAR(45),
  country VARCHAR(30),
  postal_code VARCHAR(10)
  );

-- -----------------------------------------------------
-- Table salespersons
-- -----------------------------------------------------
CREATE TABLE salespersons (
  ID INT PRIMARY KEY NOT NULL,
  staff_id INT ,
  staff_name VARCHAR(60),
  store VARCHAR(45)
  );

-- -----------------------------------------------------
-- Table invoices
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoices (
  ID INT PRIMARY KEY NOT NULL,
  invoice_number INT,
  invoice_date VARCHAR(10),
  ID_car INT,
  ID_customer INT,
  ID_staff INT,  
  FOREIGN KEY(ID_car) REFERENCES cars(ID) ON DELETE SET NULL,
  FOREIGN KEY(ID_customer) REFERENCES customers(ID) ON DELETE SET NULL,
  FOREIGN KEY(ID_staff) REFERENCES salespersons(ID) ON DELETE SET NULL
  );
    
  
