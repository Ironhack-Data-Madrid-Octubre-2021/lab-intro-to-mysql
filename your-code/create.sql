USE lab_mysql;
Create Table cars(
id_car  INT PRIMARY KEY,
VIN VARCHAR(40) UNIQUE,
manufacturer VARCHAR(40),
model  VARCHAR(40),
Year DATE,
Color VARCHAR(40)
);
CREATE TABLE Costumer(
Id_customer INT PRIMARY KEY,
Name VARCHAR(40),
Phone VARCHAR(40),
Email  VARCHAR(40),
Adress VARCHAR(40),
City	VARCHAR(40),
Country VARCHAR(40),
Codigo_postal INT
);

CREATE TABLE Salespersons (
Id_staff INT PRIMARY KEY,
Name VARCHAR(40),
Store VARCHAR(40)
);

CREATE TABLE Invoices (
Id_invoce INT PRIMARY KEY,
Invoice_Number INT NOT NULL,
Date DATE,
Car TINYINT,
Customer  TINYINT,
Salesperson TINYINT
);
