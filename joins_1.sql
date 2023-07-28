USE xcorp;
-- INNER JOIN
/*
 Enlist all the employees ID's , names along with the project allocated to them.
 */
SELECT E.emp_id,
    E.fname,
    E.lname,
    P.id,
    P.pname
FROM employee AS E
    INNER JOIN project AS P ON e.emp_id = p.empId;
/*
 Fetch out all the employees ID's and their contact detail who have been working 
 from Jaipur with the clients name working in Hyderabad.
 */
SELECT E.emp_id,
    E.PhoneNo,
    C.emailId,
    C.fname,
    C.lname
FROM employee AS E
    INNER JOIN client AS C ON e.emp_id = c.empId
WHERE E.City = 'Jaipur'
    AND C.City = 'Hyderabad';
-- LEFT JOIN.
/*
 Fetch out each project allocated to each employee.
 */
SELECT e.fname,
    e.lname,
    p.pname
FROM employee as e
    LEFT JOIN project as p ON e.emp_id = p.empId;
SELECT *
FROM employee;
-- RIGHT JOIN.
/*
 List out all the projects along with the employee's name and their respective 
 allocated email ID.
 */
SELECT e.fname,
    e.lname,
    e.emailId,
    p.pname,
    p.id
FROM employee as e
    RIGHT JOIN project as p ON e.emp_id = p.empId;
-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname,
    e.lname,
    p.id,
    p.pname
from employee AS e
    CROSS JOIN project AS p;
-- Alernative of performing the INNER JOIN Operation is
/*
 Syntax is quite similar to the INNER JOIN , only change we have 
 to make is using WHERE Clause.
 */
SELECT E.emp_id,
    E.fname,
    E.lname,
    P.id,
    P.pname
FROM employee AS E,
    project AS P
WHERE e.emp_id = p.empId;