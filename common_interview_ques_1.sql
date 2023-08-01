USE ORG;
/*
 We are using the "ORG Table" to understand
 common data interviews by solving some questions.
 */
SELECT *
FROM worker;
SELECT *
from bonus;
SELECT *
FROM title;
/*
 Q.1. Write an SQL Query to fetch "FIRST_NAME" from Worker table using the alias name
 as <WORKER_NAME>
 */
SELECT FIRST_NAME AS WORKER_NAME
FROM worker;
-- Q.2 Write an SQL Query to fetch "FIRST_NAME" from Worker Table in upper case.
SELECT UPPER(FIRST_NAME)
FROM worker;
-- OR
SELECT ucase(FIRST_NAME)
FROM worker;
-- Q.3 Write an SQL Query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT
from worker;
-- OR Using Group BY.
SELECT DEPARTMENT
FROM worker
GROUP BY DEPARTMENT;
-- Q.4 Write an SQL Query to print the first three characters of FIRST_NAME from Worker Table.
SELECT substring(FIRST_NAME, 1, 3)
from worker;
-- Q.5 Write an SQL Query to find the position of the alphabet ('b') in the first name column 
-- 'Amitabh' from worker table.
SELECT INSTR(FIRST_NAME, 'b')
FROM worker
where FIRST_NAME = 'Amitabh';
-- Q.6 Write an SQL Query to print the first_name from worker table after removing white
-- spaces from the right side. 
SELECT RTRIM(FIRST_NAME)
from worker;
-- Q.7 Write an SQL Query to print the DEPARTMENT from Worker Table after removing white spaces from
-- the left space.
SELECT LTRIM(DEPARTMENT)
from worker;
-- Q.8 Write an SQL Query that fetches the unique values of DEPARTMENT from worker table
-- and prints its length.
SELECT DISTINCT DEPARTMENT,
    LENGTH(DEPARTMENT)
from worker;
-- Q.9 , Write an SQL Query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'.
SELECT REPLACE(FIRST_NAME, 'a', 'A')
from worker;
-- Q.10 , Write an SQL Query to print the FIRST_NAME and LAST_NAME from Worker table into a single column
-- COMPLETE_NAME.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME
from worker;
-- Q.11 Write an SQL Query to print all worker details from the worker table order by FIRST_NAME ascending.
-- ORDER BY --> ASC By default.
SELECT *
FROM worker
ORDER BY FIRST_NAME;
-- Q.12 Write an SQL Query to print all Worker details from the worker table order by FIRST_NAME Ascending.
-- and DEPARTMENT descending.
SELECT *
FROM worker
ORDER BY FIRST_NAME,
    DEPARTMENT DESC;
-- Q.13 Write and SQL Query to print details for Workers with the first name as "Vipul" and
-- "Satish" from WORKER Table.
SELECT *
FROM worker
WHERE FIRST_NAME IN('Vipul', 'Satish');
-- Q.14 Write and SQL Query to print details for Workers excluding first names , "Vipul" and "Satish"
-- from worker table.
SELECT *
FROM worker
WHERE FIRST_NAME NOT IN('Vipul', 'Satish');
-- Q.15 Write an SQL query to print details of Workers with DEPARTMENT name as 'Admin%'.
SELECT *
FROM worker
WHERE DEPARTMENT = 'Admin%';
-- Q.16 Write an SQL query to print details of the workers whose FIRST_NAME contains 'a'.
SELECT *
from worker
WHERE FIRST_NAME LIKE '%a%';
-- Q.17 Write an SQL query to print details of the workers whose FIRST_NAME ends with 'a'.
SELECT *
from worker
WHERE FIRST_NAME LIKE '%a';
-- Q.18 Write an SQL query to print details of the workers whose FIRST_NAME 
-- ends with 'h' and contains six alphabets.
SELECT *
from worker
WHERE FIRST_NAME LIKE '%h'
    AND LENGTH(FIRST_NAME) = 7;
-- OR
SELECT *
FROM worker
WHERE FIRST_NAME LIKE '______h';
-- Q.19 Write an SQL query to print details of the workers WHOSE SALARY lies between 
-- 100000 and 500000
SELECT *
FROM worker
WHERE SALARY BETWEEN 100000 AND 500000;
-- Q.20] Write an SQL Query to print details of the workers who have 
-- joined in Feb'2014.
SELECT *
FROM worker
WHERE YEAR(JOINING_DATE) = 2014
    AND MONTH(JOINING_DATE) = 02;
-- Q.21] Write an SQL Query to fetch the count of employees working in the department.
SELECT DEPARTMENT,
    COUNT(DEPARTMENT)
FROM worker
WHERE DEPARTMENT = 'Admin';
-- Q.22] Write an SQL Query to fetch worker with full names with salaries >= 500000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME)
FROM worker
WHERE SALARY BETWEEN 50000 AND 100000;
-- Q.23] Write an SQL Query to fetch the no of workers for each department in the descending
-- order.
SELECT DEPARTMENT,
    COUNT(WORKER_ID)
FROM worker
GROUP BY DEPARTMENT
ORDER BY COUNT(WORKER_ID) DESC;
-- Q.24] Write an SQL Query to print details of thw workers who are also Managers.
-- You can use AND as well.
SELECT W.*
FROM worker AS W
    INNER JOIN title as T ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';
-- Q.25] Write an SQL Query to fetch number (more than 1) of different titles in the ORG.
-- SELECT WORKER_TITLE,
--     COUNT(WORKER_TITLE) as count
-- FROM title
-- GROUP BY WORKER_TITLE
-- HAVING COUNT(WORKER_TITLE) > 1;
/* 
 OR 
 */
SELECT WORKER_TITLE,
    COUNT(WORKER_TITLE) as count
FROM title
GROUP BY WORKER_TITLE
HAVING COUNT(WORKER_TITLE) > 1;
-- Q.26] Write an SQL Query to show only odd rows from a table.
-- <> --> ANOTHER WAY TO REPRESENT NOT EQUAL.
SELECT *,
    WORKER_ID
from worker
WHERE MOD(WORKER_ID, 2) = 1;
-- Q.27] Write an SQL Query to show only even rows from a table.
SELECT *,
    WORKER_ID
from worker
WHERE MOD(WORKER_ID, 2) = 0;
-- Q.28] Write an SQL Query to clone a new table from another table.
-- You will have no data, attributes will be same.
CREATE TABLE worker_clone LIKE worker;
SELECT *
FROM worker_clone;
-- Inserting all the data into the worker_clone.
INSERT INTO worker_clone
SELECT *
from worker;
-- Q.29] Write a SQL query to fetch interesecting records of two tables. 
SELECT worker.*
FROM worker
    INNER JOIN worker_clone USING(WORKER_ID);
-- Q.30 Write an SQL Query to show records from one table that another table does not have.
-- MINUS;
SELECT worker.*
FROM worker
    LEFT JOIN worker_clone USING(worker_id)
WHERE worker_clone.worker_id is NULL;
-- Q.31] Write an SQL Query to show the current date and time.
SELECT curdate();
SELECT now();
-- Q.32] Write an SQL Query to determine the nth (say n=5) highest salary from
-- a table.
SELECT *
FROM worker
ORDER BY SALARY DESC
LIMIT 5;
-- Q.33] Write an SQL Query to determine the nth (say n=5) highest salary from a 
-- table , Give me the entries that comes after 4.
SELECT *
FROM worker
ORDER BY SALARY DESC
LIMIT 4, 1;
-- Q.34] Write an SQL Query to determine the 5th highest salary without using 
-- LIMIT keyword.
-- Corelated SubQueries.
SELECT salary
FROM worker W1
WHERE 4 = (
        SELECT COUNT(DISTINCT(w2.salary))
        from worker w2
        where w2.salary >= w1.salary
    );
/*
 
 */
-- Q.35] Write an SQL Query to fetch the list of employees with the same salary.
SELECT w1.*
FROM worker w1,
    worker w2
WHERE w1.salary = w2.salary
    AND w1.worker_id != w2.worker_id;
--  Q.36] Write an SQL to show the second highest salary from a table.
-- a] USING LIMIT.
SELECT *
FROM worker
GROUP BY WORKER_ID
ORDER BY SALARY DESC
LIMIT 2;
-- b] Using subquery.
-- OR. 
-- 500000 ke alawa jitni bhi salary hai , usme se max nikal ke diya hai.
SELECT max(salary)
FROM worker
WHERE SALARY NOT IN (
        SELECT MAX(SALARY)
        FROM WORKER
    );
-- Q.37] Write an SQL Query to show one row twice in results from a table.
-- UNION will show distinct values , USING ALL will remove the distinct property.
SELECT *
FROM WORKER w1
UNION ALL
SELECT *
from WORKER w2;
-- Q.38] Write an SQL Query to list of employees not receiving the bonus.
-- Think of SubQuey to be used.
SELECT worker_id
from worker
where worker_id NOT IN(
        SELECT worker_id
        from worker w
            INNER JOIN bonus B ON w.worker_id = b.WORKER_REF_ID
    );
-- OR 
SELECT worker_id
from worker
where worker_id NOT IN (
        SELECT WORKER_REF_ID
        FROM BONUS
    );
-- Q.39] Write an SQL Query to fetch the first 50% records 
-- from a table.
-- Using SubQueries.
SELECT *
from worker
WHERE WORKER_ID <= (
        SELECT COUNT(worker_id) / 2
        from worker
    );
-- Q.40] Write an SQL Query to show all departments along that have less
-- than 4 people in it.
SELECT DEPARTMENT,
    COUNT(DEPARTMENT)
from worker
GROUP BY DEPARTMENT
HAVING COUNT(DEPARTMENT) < 4;
-- Q.41] Write an SQL Query to show all departments along with the number 
-- of people in there.
SELECT DEPARTMENT,
    COUNT(DEPARTMENT) AS PEOPLE
from worker
GROUP BY DEPARTMENT;
-- Q.42] Write am SQL Query to show the last record from a table.
-- We know that the last record of the table is 8 , Then using the max function
-- I can dervive the last row as worker_id is max + show its details.
SELECT *
from worker
WHERE worker_id = (
        SELECT MAX(WORKER_ID)
        FROM worker
    );
-- Q.43] Write an SQL Query to show the first record from a table.
SELECT *
from worker
WHERE worker_id = (
        SELECT MIN(WORKER_ID)
        FROM worker
    );
-- Q.44] Write an SQL Query to fetch the last five records from a table.
(
    SELECT *
    from worker
    ORDER BY WORKER_ID DESC
    LIMIT 5
)
ORDER BY WORKER_ID;