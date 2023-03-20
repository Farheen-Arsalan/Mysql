


-- ---------------------------------------------STORED PROCEDURE ----------------------------------------------


-- A Stored Procedure is a group of SQL statements that have been created and stored in a database

--  A stored  procedure can accept input paramers and we will look at that today, that means a single stored procedure can be used by several different users and we can all be using different input data.
-- it can also reduce the network traffic on your databse and improve the performance
-- and if we modify that stored procedure, everyone on that network will get that update.


-- Let's start with something simple and then later can get more complicated with it.

-- creating a stored procedure is similar to creating a view but different concept behind

USE sql_store;

CREATE PROCEDURE test()

SELECT * 
FROM orders
WHERE order_date > '2018-01-01'


CALL test()


-- ----------------------- Stored Procedure With SINGLE PARAMETERS

USE sql_hr;


CREATE PROCEDURE test1(office_id INT)

SELECT office_id, 
				first_name, 
                last_name,
                job_title,
                salary
FROM employees
--

CALL test1(5)




-- ----------------------- Stored Procedure With MULTIPLE PARAMETERS


CREATE PROCEDURE test2(id INT, sal DECIMAL)

SELECT office_id, 
				first_name, 
                last_name,
                job_title,
                salary
FROM employees
WHERE office_id = id AND salary > sal

--
CALL test2(2,65000)


---

DROP PRECEDURE test
