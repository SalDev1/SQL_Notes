/*
 Remove all the reversed number pairs 
 from the given table.
 
 A | B
 1 | 2
 2 | 4
 2 | 1
 3 | 2
 4 | 2
 5 | 6
 6 | 5
 7 | 8
 
 Reversed Pairs :- 
 1,2 <--> 2,1
 2,3 <--> 3,2
 
 Output.
 A | B 
 1 | 2
 2 | 4
 3 | 2 
 5 | 6
 7 | 8
 */
USE ORG;
CREATE TABLE DEMO_2 (A_id INT, B_id INT);
SELECT *
FROM demo_2;
INSERT INTO demo_2
VALUES (1, 2),
    (2, 4),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 6),
    (6, 5),
    (7, 8);
/*
 The answer query.
 */
/*
 Method 1 :- USING JOINS.
 I was correct using LEFT JOIN , which will
 give me the pairs.
 Use the simple logic + concept to write down the sql code.
 */
SELECT d1.*
FROM demo_2 as d1
    LEFT JOIN demo_2 as d2 ON d1.A_id = d2.B_id
    AND d1.B_id = d2.A_id
WHERE d2.A_id is NULL
    OR d1.A_id < d2.A_id;
/*
 Method 2 :- USING CORELATED SUBQUERY.
 For each tuple , it executes the inner query.
 */
SELECT *
from demo_2 d1
WHERE NOT EXISTS (
        SELECT *
        FROM demo_2 d2
        WHERE d1.B_id = d2.A_id
            AND d1.A_id = d2.B_id
            AND d1.A_id > d2.A_id
    );