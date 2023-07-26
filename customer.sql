CREATE DATABASE temp;
USE temp;
-- Create table named "customer".
CREATE TABLE Customer (
    id integer PRIMARY KEY,
    cname varchar (225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode integer
);
-- Insert entires into the customer tables.
INSERT INTO Customer
VALUES (
        1251,
        'Ram Kumar',
        'Dilbagh Nagar',
        'M',
        'Jalandhar',
        144002
    ),
    (
        1300,
        'Shayam Singh',
        'Ludhiana H.O',
        'M',
        'Ludhiana',
        141001
    ),
    (
        245,
        'Neelabh Shukla',
        'Ashok Nagar',
        'M',
        'Jalandar',
        144003
    ),
    (
        210,
        'Barkha Singh',
        'Dilbagh Nagar',
        'F',
        'Jalandhar',
        144002
    ),
    (
        500,
        'Rohan Arora',
        'Ludhiana H.O',
        'M',
        'Ludhiana',
        141001
    );
-- Show all the tuples into the customer table
SELECT *
from customer;
-- Create a table "order_details"
CREATE TABLE Order_details (
    Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id)
);
-- Inserting an order in table "order_details".
INSERT INTO Order_details
VALUES(1, '2019-03-11', 245);
-- Show all entries in the order_details table.
SELECT *
FROM order_details;