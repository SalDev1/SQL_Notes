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
-- Q.45] Write an SQL Query to print all the name of the employees having the highest 
-- salary in each department.
/*
 Step 1 :- Find out the highest salary of employee in each department.
 Step 2 :- Show its employee details.
 Using the dervived table concept.
 */
SELECT w.DEPARTMENT,
    w.FIRST_NAME,
    w.SALARY
from (
        SELECT MAX(SALARY) AS max_sal,
            DEPARTMENT
        from worker
        GROUP BY DEPARTMENT
    ) AS temp
    INNER JOIN worker w ON temp.DEPARTMENT = w.DEPARTMENT
    and temp.max_sal = w.SALARY;
-- Q.46] Write an SQL Query to fetch three max salaries from a table.
-- USING LIMIT.
SELECT *
FROM worker
ORDER BY SALARY DESC
LIMIT 3;
-- USING CORELATED SubQuery.
SELECT DISTINCT SALARY
from worker w1
WHERE 3 >= (
        SELECT COUNT(DISTINCT(SALARY))
        FROM worker w2
        where w1.salary <= w2.salary
    )
ORDER BY w1.SALARY;
-- Q.47] Write an SQL Query to fetch three min salaries from a table 
--  Using LIMIT
SELECT *
FROM worker
ORDER BY SALARY
LIMIT 3;
-- USING CORELATED SUBQUERY.
SELECT DISTINCT SALARY
from worker w1
WHERE 3 >= (
        SELECT COUNT(DISTINCT(SALARY))
        FROM worker w2
        WHERE w1.salary >= w2.salary
    )
ORDER BY w1.SALARY;
-- Q.48] Write an SQL Query to fetch nth max salaries from a table.  
-- Same as Q.46] or Q.47]
SELECT DISTINCT SALARY
from worker w1
WHERE n >= (
        SELECT COUNT(DISTINCT(SALARY))
        FROM worker w2
        where w1.salary <= w2.salary
    )
ORDER BY w1.SALARY;
-- Q.49] Write an SQL Query to fetch departments along with the total salaries
-- paid for each of them.
SELECT DISTINCT DEPARTMENT,
    SUM(SALARY) as depsal
from worker
GROUP BY DEPARTMENT
ORDER BY depsal DESC;
-- Q.50] Write an SQL Query to fetch the name of workers 
-- who earns the highest salary.
-- USING LIMIT.
SELECT *
FROM WORKER
ORDER BY SALARY DESC
LIMIT 1;
-- USING Correlated SubQuery. 
SELECT first_name,
    last_name
FROM worker
WHERE salary = (
        SELECT MAX(SALARY)
        FROM WORKER
    );