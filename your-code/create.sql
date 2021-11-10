DROP DATABASE IF EXISTS lab_mysql;
CREATE DATABASE lab_mysql;
USE lab_mysql;

CREATE TABLE IF NOT EXISTS cars(
	car_id INT PRIMARY KEY NOT NULL,
    VIN VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45),
    model VARCHAR(45),
    year YEAR,
    color VARCHAR(45) 
    
    );
    

CREATE TABLE IF NOT EXISTS customers(
	customer_id INT PRIMARY KEY NOT NULL,
	name VARCHAR(45) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(45),
    addres VARCHAR(80),
    city VARCHAR(45),
    satate_provincce VARCHAR(45),
    country VARCHAR(45),
    zip_postal_code VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS salespersons(
	staff_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(45),
    store VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS invoices(
	id INT PRIMARY KEY NOT NULL,
    number VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    cars_id INT,
    customers_id INT,
    staff_id INT,
    FOREIGN KEY (cars_id) REFERENCES cars(car_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (customers_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES salespersons(staff_id) ON UPDATE CASCADE ON DELETE CASCADE
    );