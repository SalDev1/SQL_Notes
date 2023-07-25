-- Using the current database according to our needs.
USE temp;
-- -- Insert values into the table 'studentdetails' of the database temp
INSERT INTO studentdetails
VALUES(1, 'salman');
-- This syntax retrieves all the data that exists in the studentdetails table.
SELECT *
FROM studentdetails;
-- Deletes the database from the entire mqsql server.
DROP DATABASE IF EXISTS temp;