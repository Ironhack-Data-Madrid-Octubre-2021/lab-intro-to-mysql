# Now you find an error you need to fix in your existing data - in the Salespersons table, 
# you mistakenly spelled *Miami* as *Mimia* for Paige Turner. 
UPDATE salespersons
SET store = 'Miami'
WHERE staff_name = 'Paige Turner' ;


# Also, you received the email addresses of the three customers:
#| Name | Email |
#| --- | ---|
#| Pablo Picasso | ppicasso@gmail.com |
#| Abraham Lincoln | lincoln@us.gov |
#| Napoléon Bonaparte | hello@napoleon.me |

UPDATE customers SET email = 'ppicasso@gmail.com' WHERE customer_name = 'Pablo Picasso'      ;
UPDATE customers SET email = 'lincoln@us.gov'     WHERE customer_name = 'Abraham Lincoln'    ;
UPDATE customers SET email = 'hello@napoleon.me'  WHERE customer_name = 'Napoléon Bonaparte' ;
