
-- 	Inserting Into A single Row

SELECT*
FROM customers;


INSERT INTO customers

VALUES (DEFAULT, 
				'Jhon',
				'smith',
                '1990-01-01', 
                NULL, 
                'address',
                'city',
                'CA',
                DEFAULT)
			
            
INSERT INTO shippers
VALUES(DEFAULT, 'shipper1'),
			(DEFAULT, 'shipper2'),
            (DEFAULT, 'shipper3'),
            (DEFAULT, 'shipper4')




SELECT*
FROM shippers


-- Creating a Copy of a Table

CREATE TABLE new_orders AS
SELECT* FROM orders

SELECT* FROM new_orders


INSERT INTO new_orders 

SELECT *
FROM orders
WHERE order_date <'2019-01-01'



-- Updating Existing Table


UPDATE payments
SET date='2018-08-01', amount=40.02, payment_method=1
WHERE payment_id = 2


SELECT*
FROM payments




UPDATE invoices

SET payment_total = 10, payment_date = due_date

WHERE invoice_id = 5


SELECT* 
FROM invoices


-- UPDATE Multiple records


UPDATE invoices
SET payment_total = 40
WHERE client_id = 5

--

UPDATE invoices
SET payment_total = 100
WHERE client_id IN (5,3)


