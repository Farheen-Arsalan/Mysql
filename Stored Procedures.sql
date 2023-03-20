


-- ---------------------------------------------STORED PROCEDURE ----------------------------------------------


-- A Stored Procedure is a group of SQL statements that have been created and stored in a database

--  A stored  procedure can accept input paramers and we will look at that today, that means a single stored procedure can be used by several different users and we can all be using different input data.
-- it can also reduce the network traffic on your databse and improve the performance
-- and if we modify that stored procedure, everyone on that network will get that update.


-- Let's start with something simple and then later can get more complicated with it.

-- creating a stored procedure is similar to creating a view but different concept behind

CREATE  PROCEDURE test ()

SELECT * 
FROM orders
WHERE order_date > '2018-01-01'



-- execute procedure

CALL test()


-- Alternatively, you can create a stored procedure like:

CREATE PROCEDURE `new_procedure` ()
BEGIN

-- your queries go here

END



-- ----------------------------- Stored Procedure with PARAMETERS -----------------------------


-- let's create a stored procedure that will accept office id and return all the employees in that office


USE sql_hr;

CREATE  PROCEDURE test1 (office_id INT) -- the argument is going to act as a place holder so that later u can supply values to it.

SELECT office_id, first_name,last_name, job_title, salary 
FROM employees

-- 

CALL test1(10)

-- ----------------------- Multiple parameters



CREATE  PROCEDURE test2 (id INT, sal DECIMAL) -- the argument is going to act as a place holder so that later u can supply values to it.

SELECT office_id, first_name,last_name, job_title, salary 
FROM employees
WHERE office_id=id AND  salary > sal

-- 

CALL test2(1, 1000)

-- ----------------------------- Alter Stored Procedure-----------------------------

-- you can right click on a stored procedure to edit it.







-- -- -----------------------------DROP  Stored Procedure-----------------------------

-- -- you can right click on a stored procedure to drop it.

-- or you can use the DROP command to drop it

DROP PROCEDURE test2






--





