SELECT FIRST_NAME,
    SALARY
FROM worker;
-- Doing this , the sql creates dual tables to avoid usage
-- of FROM , when using SELECT + below codes are working cause
-- of dual tables.
SELECT 44 + 11;
-- The below command lets you know the server time.
SELECT now();
SELECT ucase("LAKSHAY");