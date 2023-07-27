USE temp;
SELECT *
FROM customer;
-- Replace some information with the data already present
-- with reference to the primary key 
-- Using REPLACE , remaining attributes will be replaced by NULL
-- if not defined in the REPLACE Function.
REPLACE INTO customer(id, City)
VALUES(1251, 'Jalandhar');
/* If you call a replace function with an id number that doesn't exist
 in the table then REPLACE WILL WORK / TREAT AS INSERT.
 id is used in REPLACE function to find the data in the database */
REPLACE INTO customer(id, cname, City)
VALUES(1333, 'Salman', 'Colony');
-- 2nd way of using REPLACE 
REPLACE INTO customer
SET id = 1300,
    cname = 'Mac',
    City = 'Utah';
-- 3rd Way of using REPLACE
/*
 Phele mein id, cname , city se data nikaluga , fir unke alawa mein baki cheez 
 replace kar duga.
 */
REPLACE INTO customer(id, cname, City)
SELECT id,
    cname,
    City
FROM customer
WHERE id = 500;