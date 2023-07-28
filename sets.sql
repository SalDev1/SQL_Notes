USE xcorp;
-- Create table "dept1"
CREATE TABLE dept1 (
    empID INT PRIMARY KEY,
    name VARCHAR(225),
    role VARCHAR(255)
);
-- CREATE TABLE "dept2"
CREATE TABLE dept2 (
    empID INT PRIMARY KEY,
    name VARCHAR(225),
    role VARCHAR(255)
);
-- Show details of dept1.
SELECT *
FROM dept1;
-- Show details of dept2.
SELECT *
FROM dept2;
-- Insert values into the tables.
INSERT INTO dept1
VALUES(1, 'A', 'engineer'),
    (2, 'B', 'salesman'),
    (3, 'C', 'manager'),
    (4, 'D', 'salesman'),
    (5, 'E', 'engineer');
-- Insert values into the tables.
INSERT INTO dept2
VALUES(3, 'C', 'manager'),
    (6, 'F', 'marketing'),
    (7, 'G', 'salesman');
-- Union
-- List out all the employees in the company.
SELECT *
FROM dept1
UNION
SELECT *
FROM dept2;
-- List out all the employees in the company who works as the salesman.
SELECT *
FROM dept1
WHERE role = 'salesman'
UNION
SELECT *
FROM dept2 AS d2
WHERE role = 'salesman';
-- Intersection.
-- List out the employees who work in both department , meaning common employee.
SELECT *
FROM dept1
    INNER JOIN dept2 USING(empID);
-- Or to reduce the number of columns , use the alternative way.
SELECT dept1.*
FROM dept1
    INNER JOIN dept2 USING(empID);
-- Set difference
-- List out all the employees working in dept1 but not in dept2.
SELECT dept1.*
from dept1
    LEFT JOIN dept2 using(empid)
WHERE dept2.empId is NULL