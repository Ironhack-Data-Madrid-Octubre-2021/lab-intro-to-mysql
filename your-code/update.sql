USE lab_mysql;

update salespersons
set store = "Miami"
where staff_id = 5;

/*
Pablo Picasso	ppicasso@gmail.com
Abraham Lincoln	lincoln@us.gov
Napoléon Bonaparte	hello@napoleon.me
*/

UPDATE customers 
SET email = "ppicasso@gmail.com"
WHERE name = "Pablo Picasso";

UPDATE customers 
SET email = "lincoln@us.gov"
WHERE name = "Abraham Lincoln";

UPDATE customers 
SET email = "hello@napoleon.me"
WHERE name = "Napoléon Bonaparte";