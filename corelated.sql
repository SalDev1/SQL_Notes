USE xcorp;
SELECT *
FROM employee;
/*
 Corelated subquery. (V.V.Imp)
 Find the 3rd oldest employee + show me the employee details.
 
 Outer query ek age value ke liye inner query ek baar 
 execute hoga completely for each e1.age.
 OR
 for each e1.age (outer) --> inner execute completely for one time.
 
 Dry Run :- 
 Let's say we set e1.age = 31.
 Now the inner loop will run to find emp whose age >= 31 (e1.age).
 
 From the innner loop , we found two employees with age 32 and 44.
 The value return by inner loop = 2 (Two emp with age >= e1.age).
 
 Now , the outer loop , it check whether 3 == 2.
 
 Similarly , we run the same thing consider all emp age as e1.age 
 and executing the inner query comppletey for one time until the 
 outer query condition is satisified. i.e (3 == count).
 */
SELECT *
FROM employee AS e1
WHERE 3 = (
        SELECT COUNT (e2.age)
        from employee AS e2
        WHERE e2.age >= e1.age
    );