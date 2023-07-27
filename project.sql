-- Creating a separate database for the following example.
CREATE DATABASE IF NOT EXISTS xcorp;
USE xcorp;
-- Create the employee table.
CREATE TABLE Employee(
    emp_id INT PRIMARY KEY,
    fname VARCHAR(225),
    lname VARCHAR(225),
    age INT(15),
    emailId VARCHAR(225),
    PhoneNo INT(15),
    City VARCHAR(225)
);
-- Insert entries into the table.
INSERT INTO employee
VALUES(
        1,
        'Aman',
        'Proto',
        32,
        'aman@gmail.com',
        898,
        'Delhi'
    ),
    (
        2,
        'Yagya',
        'Narayan',
        44,
        'yagya@gmail.com',
        222,
        'Palam'
    ),
    (
        3,
        'Rahul',
        'BD',
        22,
        'rahul@gmail.com',
        444,
        'Kolkata'
    ),
    (
        4,
        'Jatin',
        'Hermit',
        31,
        'jatin@gmail.com',
        666,
        'Raipur'
    ),
    (
        5,
        'PK',
        'Pandey',
        21,
        'pk@gmail.com',
        555,
        'Jaipur'
    );
SELECT *
FROM employee;
-- DROP TABLE Employee;
-- Create the project table.
CREATE TABLE Project(
    id INT PRIMARY KEY,
    empId INT,
    pname VARCHAR(225),
    s_date DATE,
    clientID INT,
    FOREIGN KEY(empId) REFERENCES employee(emp_id),
    FOREIGN KEY(clientID) REFERENCES client(id)
);
-- Insert entires into the project.
INSERT INTO Project
VALUES (1, 1, 'A', '2021-04-21', 3),
    (2, 2, 'B', '2021-03-12', 1),
    (3, 3, 'C', '2021-01-16', 5),
    (4, 4, 'D', '2021-04-27', 2),
    (5, 5, 'E', '2021-05-01', 4)
    /*
     Show entries in the project table.
     */
SELECT *
FROM Project;
-- Create a separate table for client.
CREATE TABLE Client(
    id INT PRIMARY KEY,
    empID INT,
    fname VARCHAR(225),
    lname VARCHAR(225),
    age INT(15),
    emailId VARCHAR(225),
    PhoneNo INT(15),
    City VARCHAR(225),
    FOREIGN KEY(empID) REFERENCES employee(emp_id)
)
INSERT INTO Client
VALUES(
        1,
        3,
        'Mac',
        'Rogers',
        47,
        'mac@gmail.com',
        333,
        'Kolkata'
    ),
    (
        2,
        3,
        'Max',
        'Porier',
        27,
        'max@gmail.com',
        222,
        'Kolkata'
    ),
    (
        3,
        1,
        'Peter',
        'Jain',
        24,
        'peter@abc.com',
        111,
        'Delhi'
    ),
    (
        4,
        5,
        'Sushant',
        'Aggarwal',
        23,
        'sushant@yahoo.com',
        45454,
        'Hyderabad'
    ),
    (
        5,
        2,
        'Pratap',
        'Singh',
        36,
        'p@xyz.com',
        77767,
        'Mumbai'
    );
--> Show entries in the client table.
SELECT *
FROM Client;