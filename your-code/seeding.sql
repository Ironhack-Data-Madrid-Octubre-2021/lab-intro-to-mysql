
USE conces;


INSERT INTO Staff VALUES
(00001,	'Petey Cruiser', 'Madrid');
INSERT INTO Staff VALUES
(00002, 'Anna Sthesia', 'Barcelona');
INSERT INTO Staff VALUES
(00003,	'Paul Molive',	'Berlin');
INSERT INTO Staff VALUES
(00004,'Gail Forcewind','Paris');
INSERT INTO Staff VALUES
(00005,	'Paige Turner', 'Mimia');
INSERT INTO Staff VALUES
(00006,'Bob Frapples', 'Mexico City');
INSERT INTO Staff VALUES
(00007, 'Walter Melon', 'Amsterdam');
INSERT INTO Staff VALUES
(00008,	'Shonda Leer', 'São Paulo');


INSERT INTO customer VALUES
(10001,	'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045);
INSERT INTO customer VALUES
(20001, 'Abraham Lincoln', '+1 305 907 7086', '-', '120,SW 8th St', 'Miami', 'Florida',	'United States', 33130);
INSERT INTO customer VALUES
(30001,	'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40, Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO Invoice VALUES
(852399038,	'22-08-2018', 10001, 1, 00001);
INSERT INTO Invoice VALUES
(731166526,	'31-12-2018', 20001, 3,	00006);
INSERT INTO Invoice VALUES
(271135104,	'22-01-2019',30001,	2,	00007);

INSERT INTO Cars VALUES
(0,'3K096I98581DHSNUP','Volkswaguen', 'Tiguan' , 2019, 'Blue');
INSERT INTO Cars VALUES
(1,'ZM8G7BEUQZ97IH46', 'Peugeot', 'Rifter', 2019, 'Red');
INSERT INTO Cars VALUES
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White');
INSERT INTO Cars VALUES
(3,	'HKNDGS7CU31E9Z7JW','Toyota', 'RAV4', 2018, 'Silver');
INSERT INTO Cars VALUES
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019,'Gray');
INSERT INTO Cars VALUES
(5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');
