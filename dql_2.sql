USE ORG;
SELECT *
FROM worker;
-- Show me tuples form the worker table where income > 10000
-- This is how WHERE keyword is used.
SELECT *
from worker
WHERE SALARY > 100000;
-- Show me tuples form the worker table where Department == HR
-- This is how WHERE keyword is used.
SELECT *
from worker
WHERE DEPARTMENT = 'HR';
-- Show me all the workers details have salary(800000 - 130000)
SELECT *
FROM worker
WHERE SALARY BETWEEN 80000 AND 300000;
-- reduce OR statements.
-- Show me details of the employees working in HR , Admin Department
SELECT *
FROM worker
WHERE DEPARTMENT = 'HR'
    OR DEPARTMENT = 'ADMIN'
    OR DEPARTMENT = 'Account';
-- BETTER WAY 
SELECT *
FROM worker
WHERE DEPARTMENT IN('HR', 'ADMIN', 'Account');
-- Show me the employees that doesn't belong to the HR department.
-- That's what NOT does 
SELECT *
FROM worker
WHERE DEPARTMENT NOT IN ('HR', 'ADMIN');