USE ORG;
-- GROUP BY
-- You get the same output as distinct.
-- GROUP BY gets treated as DISTINCT if not using as AGGEGRATION Function
SELECT department
from worker
GROUP BY department;
-- Using Aggegration 
-- You get the count of emplpoyees belonging to the specific department.
SELECT department,
    COUNT(*)
from worker
GROUP BY department;
-- Better practice.
SELECT department,
    COUNT(department)
from worker
GROUP BY department;
-- Show me the average salary per department.
SELECT department,
    AVG(salary)
from worker
GROUP BY department;
-- Show me min salary per department. 
SELECT department,
    MIN(salary)
from worker
GROUP BY department;
-- Show me max salary per department. 
SELECT department,
    MAX(salary)
from worker
GROUP BY department;
-- Show me total salary per department. 
SELECT department,
    SUM(salary)
from worker
GROUP BY department;
-- HAVING
-- Show me those departments that are having more than two employees.
-- department , count , having , more than 2 workers. 
SELECT department,
    COUNT(department)
from worker
GROUP BY department
HAVING count(department) > 2;