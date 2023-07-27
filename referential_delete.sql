USE temp;
-- We are going to use 
-- the customer table.
-- We are creating a new customer table.
CREATE TABLE customer_2(
    id integer PRIMARY KEY,
    cname varchar(225),
    Address varchar(225),
    Gender char(2),
    City varchar(225),
    Pincode integer
);
SELECT *
from customer_2;
-- Insert entires into the customer table.
INSERT INTO customer_2
VALUES(
        1,
        'Ram_Kumar3',
        'Dilbagh Nagar',
        'M',
        'Jalandhar',
        NULL
    );
-- Creating a new order_details table.
CREATE TABLE order_details_2(
    Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES customer_2(id) on DELETE CASCADE
);
SELECT *
FROM order_details_2;
-- Inserting into the order_details_2 table.
-- The order made at that particular date is having an custId 
-- == the id of the customer that have placed the order.
INSERT INTO order_details_2
VALUES(245, '2019-03-11', 1);
INSERT INTO order_details_2
VALUES(246, '2019-04-11', 1);
-- Delete the customer with id 1 
-- When we do that , all the order that he had placed
-- will be deleted too.
-- In simple words , if the customer is deleted , then all the 
-- orders related to him will be deleted too.
-- The below code will give you an error , because it has some
-- references in the other child table.
DELETE FROM customer_2
WHERE id = 1;
-- To overcome the above thing , we use ON DELETE CASCADE.
-- Make changes in the child table (order_details_2).
-- This will the ensure the consistency throughout the entire database.
DELETE FROM customer_2
WHERE id = 1;
-- DROP TABLE order_details_2;
-- Case 2
-- Instead of deleting all the references of the order_details , when 
-- the customer is been deleted at the same time , 
-- We want to keep the references of the order details , even after 
-- customer is deleted , this is achieved by ON DELETE SET NULL.
CREATE TABLE order_details_2(
    Order_id integer PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES customer_2(id) on DELETE
    SET NULL
);
-- Hey , you in future , currently order_details_2 in set in 
-- on DELETE SET NULL , don't get confused.