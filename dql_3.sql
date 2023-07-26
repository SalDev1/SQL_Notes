USE ORG;
-- Pattern / WildCard Matching
-- Show me the name of those employees that has 'i' in between their names.
SELECT *
FROM worker
WHERE FIRST_NAME LIKE '%i%';
-- Show me the name of those employees that has i in second position 
-- in their first name.
SELECT *
FROM worker
WHERE FIRST_NAME LIKE '_i%';
-- Show the employees data sorted by their salary (increasing order of salary)
-- Sorting using order by. 
SELECT *
FROM worker
ORDER BY SALARY;
-- Showing the data in descending order of salary.
SELECT *
FROM worker
ORDER BY SALARY DESC;
-- Showing the data in increasing order of salary.
SELECT *
FROM worker
ORDER BY SALARY ASC;
-- DISTINCT
-- I want all the distinct departments from the department column.
SELECT DISTINCT Department
FROM worker;