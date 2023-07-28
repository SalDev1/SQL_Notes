use xcorp;
-- VIEW
/*
 Views are created separately in the database.
 */
SELECT *
FROM employee;
-- CREATING A VIEW
CREATE VIEW custom_view AS
SELECT fname,
    age
FROM Employee;
/*
 You will only see the data that is been pushed 
 when creating the VIEW from a table.
 
 Assume VIEW to be the Virtual template or 
 virtual / custom table created according to
 the needs.
 */
--  VIEWING FROM VIEW.
SELECT *
FROM custom_view;
-- Dropping VIEW If exists.
DROP VIEW IF EXISTS custom_view;
-- ALTERING THE VIEW
ALTER VIEW custom_view AS
SELECT fname,
    lname,
    age
from employee;