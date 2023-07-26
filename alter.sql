USE temp;
-- We are going to use the account table from the 
-- to perform ALTER Table.
-- Adding a new column into the account table
ALTER TABLE account
ADD interest FLOAT NOT NULL DEFAULT 0;
-- Modify a datatype of a certain attribute "interest"
ALTER TABLE account
MODIFY interest DOUBLE NOT NULL DEFAULT 0;
-- Describe the table , using DESCRIBE Command.
DESC account;
-- Rename a Column from interest to savings account interest).
-- old_name , new_name , datatype.
ALTER TABLE account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;
-- DROPPING COLUMN --> (dropping saving_interest).
ALTER TABLE account DROP COLUMN saving_interest;
-- Rename the table
ALTER TABLE account
    RENAME TO account_details;