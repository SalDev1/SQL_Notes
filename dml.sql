USE temp;
-- INSERT INTO customer(id, cname)
-- VALUES(121, 'Bob');
SELECT *
from customer;
-- UPDATE A ROW DETAILS;
UPDATE customer
SET Address = 'Mumbai',
    Gender = 'M'
WHERE id = 121;
-- UPDATING MULTIPLE ROWS.
-- Changing specific digit of pincode of each customer
-- Not using where will select every customer
-- By default , SQL wil not allow use to make changes thinking that it is unauthorized access.
SET SQL_SAFE_UPDATES = 0;
UPDATE customer
SET Pincode = 11000;
UPDATE customer
SET Pincode = Pincode + 1;
-- DELETE COMMAND
DELETE FROM customer
WHERE id = 121;
-- To delete the entire table
DELETE from