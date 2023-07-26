USE temp;
-- Try to make use of unique + check keyword.
CREATE TABLE Account(
    id int primary key,
    name varchar(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0 -- CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);
-- Insert entries into the account table.
INSERT INTO account(id, name, balance)
VALUES(1, 'A', 10000);
-- Show every tuple into the account table.
SELECT *
FROM ACCOUNT;
-- We can't the below entry because using UNIQUE constraint
-- It has identified that there is already an entry having named 'A'.
INSERT INTO account(id, name, balance)
VALUES(2, 'A', 20000);
-- The below entry will not be pushed into the table 
-- Because the balance is less than 1000 and it is 
-- verified by CHECK constraint.
INSERT INTO account(id, name, balance)
VALUES(2, 'B', 900);
-- Remove the table "account";
DROP TABLE account;