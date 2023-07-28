USE xcorp;
SELECT *
from client;
SELECT *
FROM employee;
SELECT *
FROM project;
-- Subqueries.
-- WHERE CLAUSE , CAN BE USED IN SAME TABLE.
-- Empolyees with AGE > 30 
SELECT *
FROM employee
WHERE AGE IN (
        SELECT AGE
        FROM employee
        WHERE age > 30
    );
-- WHERE clause , different table. 
SELECT *
FROM employee
WHERE emp_id IN (
        SELECT emp_id
        FROM project
        GROUP BY empId
        having count(empId) > 1
    );
-- Single value subquery.
-- emp details having age > avg(age).
SELECT *
FROM employee
WHERE age > (
        SELECT avg(age)
        from Employee
    );
-- FROM CLAUSE - derived tables.
-- SELECT MAX age person whose first name contains 'a'.
-- The below query returns the table.
/*
 The subquery returns a dervived table when been executed.
 How is it work.
 
 First it executes the subquery where it return a table 
 containing employee details where fname = 'a' ,  then 
 from the table , identify the max age among the dervied 
 employees.
 */
SELECT max(age)
FROM (
        SELECT *
        FROM employee
        where fname like '%a%'
    ) AS temp;