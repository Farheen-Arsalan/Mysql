-- CONSTRAINS

USE testDB;

CREATE TABLE persons(
			ID INT NOT NULL,
            First_Name VARCHAR(8) NOT NULL,
            Last_Name VARCHAR(8) NULL,
            Age INT NULL 
            )

SELECT *
FROM persons;

-- 				------UNIQUE KEY-------
DROP TABLE persons;

CREATE TABLE PERSONS(
			ID INT NOT NULL,
            First_Name VARCHAR(8),
            Last_Name VARCHAR(8),
            Age INT NULL,
            UNIQUE(ID)
            );

INSERT INTO persons (First_Name, Last_Name,Age )
VALUES ('Arya','Grande',20);

SELECT *
FROM persons;

-- 				------PRIMARY KEY-------

CREATE TABLE Customers(
				Name VARCHAR(7),
                Product VARCHAR(7),
                Product_ID INT,
                PRIMARY KEY(  Product_ID)
                );
SELECT *
FROM customers;

-- 				------ALTER EXISTING TABLE(ADDING A CONSRAINT)-------

ALTER TABLE persons
ADD PRIMARY KEY(ID);

-- 				------ALTER EXISTING TABLE(DROPPING A CONSRAINT)-------

CREATE TABLE passangers(
					First_name VARCHAR(10),
                    Last_name VARCHAR(10),
                    Mobile INT,
                    Ticket_number VARCHAR(10)
                    );
                    
SELECT *
FROM passangers;

ALTER TABLE passangers
ADD CONSTRAINT UC_Passangers UNIQUE(Mobile,Ticket_number);

ALTER TABLE passangers
DROP INDEX UC_Passangers;

-- 				------ALTER EXISTING TABLE(ORDER CLAUSE)-------

SELECT first_name,last_name,points
FROM customers
ORDER BY points DESC;

-- NB 				------SFWO-------

SELECT first_name,last_name,points,birth_date
FROM customers
WHERE birth_date>'1900-01-01'
ORDER BY points DESC;

-- 				------SELECT-------

SELECT first_name,last_name,points,points+10
FROM customers;

-- BODMAS
USE sql_store;

SELECT * 
FROM order_items;

SELECT product_id,quantity,unit_price,quantity*unit_price AS total_price,ROUND((quantity*unit_price)-(quantity*unit_price)*0.05,2)AS discount
FROM order_items;

SELECT *
FROM customers;

-- DISTINCT

SELECT DISTINCT state
FROM customers;

--  ---------------WHERE CLAUSE IN DETAILS ------------

SELECT *
FROM customers
WHERE points>=2000;

--  ---------------AND OR AND NOT OPERATOR ------------

SELECT *
FROM customers
WHERE birth_date>'1990-01-01' AND city = 'chicago';

SELECT *
FROM customers
WHERE birth_date>'1990-01-01' OR city = 'chicago';

--  ---------------AND OR COMBINED  ------------
SELECT *
FROM customers
WHERE birth_date>'1990-01-01' OR city = 'chicago' AND points>1000; 

-- NOT OPERATOR

SELECT *
FROM customers
WHERE NOT (birth_date>'1990-01-01' OR city = 'chicago' AND points<1000);

-- IN OPERATOR

SELECT *
FROM customers
WHERE state IN('VA'OR'FA'OR'GA');

-- BETWEEN OPERATOR

SELECT *
FROM customers
WHERE points>=1000 AND points<=3000;

SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- LIKE OPERATOR

SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- REGEXP - REGULAR EXPRESSION

SELECT *
FROM customers
WHERE last_name REGEXP'b';

SELECT *
FROM customers
WHERE last_name REGEXP'^b';

SELECT *
FROM customers
WHERE last_name REGEXP'y$';

SELECT *
FROM customers
WHERE last_name REGEXP'y|s';

-- IS NULL

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- ORDER BY OPERATOR

SELECT *
FROM customers
ORDER BY points DESC;

SELECT *
FROM customers
ORDER BY state;

SELECT first_name,state
FROM customers
ORDER BY 1,2;

-- LIMIT OPERATOR

SELECT *
FROM customers
LIMIT 5;


SELECT *
FROM customers
LIMIT 5,5;

-- JOIN 

USE sql_store;

-- 				------ALTER EXISTING TABLE(ORDER CLAUSE)-------

SELECT first_name,last_name,points
FROM customers
ORDER BY points DESC;

-- NB 				------SFWO-------

SELECT first_name,last_name,points,birth_date
FROM customers
WHERE birth_date>'1900-01-01'
ORDER BY points DESC;

-- 				------SELECT-------

SELECT first_name,last_name,points,points+10
FROM customers;

-- BODMAS
USE sql_store;

SELECT * 
FROM order_items;

SELECT product_id,quantity,unit_price,quantity*unit_price AS total_price,ROUND((quantity*unit_price)-(quantity*unit_price)*0.05,2)AS discount
FROM order_items;

SELECT *
FROM customers;

-- DISTINCT

SELECT DISTINCT state
FROM customers;

--  ---------------WHERE CLAUSE IN DETAILS ------------

SELECT *
FROM customers
WHERE points>=2000;

--  ---------------AND OR AND NOT OPERATOR ------------

SELECT *
FROM customers
WHERE birth_date>'1990-01-01' AND city = 'chicago';

SELECT *
FROM customers
WHERE birth_date>'1990-01-01' OR city = 'chicago';

--  ---------------AND OR COMBINED  ------------
SELECT *
FROM customers
WHERE birth_date>'1990-01-01' OR city = 'chicago' AND points>1000; 

-- NOT OPERATOR

SELECT *
FROM customers
WHERE NOT (birth_date>'1990-01-01' OR city = 'chicago' AND points<1000);

-- IN OPERATOR

SELECT *
FROM customers
WHERE state IN('VA'OR'FA'OR'GA');

-- BETWEEN OPERATOR

SELECT *
FROM customers
WHERE points>=1000 AND points<=3000;

SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- LIKE OPERATOR

SELECT *
FROM customers
WHERE last_name LIKE '%b%';

-- REGEXP - REGULAR EXPRESSION

SELECT *
FROM customers
WHERE last_name REGEXP'b';

SELECT *
FROM customers
WHERE last_name REGEXP'^b';

SELECT *
FROM customers
WHERE last_name REGEXP'y$';

SELECT *
FROM customers
WHERE last_name REGEXP'y|s';

-- IS NULL

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- ORDER BY OPERATOR

SELECT *
FROM customers
ORDER BY points DESC;

SELECT *
FROM customers
ORDER BY state;

SELECT first_name,state
FROM customers
ORDER BY 1,2;

-- LIMIT OPERATOR

SELECT *
FROM customers
LIMIT 5;

-- SQL JOIN
SELECT *
FROM orders
JOIN customers
ON orders.customer_id= customers.customer_id;

SELECT order_id,first_name,last_name,orders.customer_id
FROM orders
JOIN customers
ON orders.customer_id= customers.customer_id;

SELECT *
FROM orders o
JOIN customers c
ON o.customer_id= c.customer_id;

-- JOIN ACROSS DATABASE

SELECT name,oi.unit_price,p.product_id
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id= p.product_id;

-- JOINING TABLE BY ITSELF

USE sql_hr;

SELECT e.employee_id,e.first_name,m.first_name,e.last_name
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

-- OUTER JOIN 

USE sql_store;

SELECT c.customer_id,c.first_name,o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT c.customer_id,c.first_name,o.order_id
FROM orders o
RIGHT JOIN customers c 
ON c.customer_id = o.customer_id;

USE sql_invoicing;

SELECT p.date,p.amount,c.name,pm.name
FROM payments p
JOIN clients c USING (client_id)
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;

-- INSETING INTO A SINGLE ROW

USE sql_store;

SELECT *
FROM customers;

INSERT INTO customers
VALUES (DEFAULT,'Jhon','Smith','1990-01-01',NULL,'5 Street','New York','NY',DEFAULT);