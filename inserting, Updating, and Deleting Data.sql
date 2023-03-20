

        
 -- 		----------------  Inserting, Updating, and Deleting Data  ----------------
 
 
 -- 	------------Inserting Into Rows -----
 
 
 
 
 -- In order to insert into an existing table, you need to inspect the data type and constraints that are given on each column in order to rightly insert into the rows 
 
 USE sql_store;
 
 INSERT INTO customers
 
 VALUES (
					DEFAULT,
                    'Jhon',
                    'smith',
                    '1990-01-01',
                    NULL,
                    'address',
                    'City',
                    'CA',
                    DEFAULT);
 
 -- in the above situation, we see that we have supplied all the deatils into the rows,
 -- but we can also specify the particular columns that we want to insert into
 

 
 INSERT INTO customers (customer_id, 
											first_name, 
                                            last_name, 
                                            birth_date)
 
 VALUES (
					DEFAULT,
                    'Jhon',
                    'smith',
                    '1990-01-01');
                    
                    



 -- 	------------Inserting Into Multiple Rows -----
 
 -- we will use the shppers table
 
 -- if we see the shippers table, we notice that we can just supply the name and forget about the shipper_id since it is default value
 
 
 INSERT INTO shippers (name)
 
 VALUES ('Shipper1'),
				('Shipper2'),
                ('Shipper3'),
                ('Shipper4');
                
                
-- EXERCISE 

-- Insert three rows in the products table


-- SOLUTION
-- first inspect the products table

INSERT INTO products (
											name,
                                            quantity_in_stock,
                                            unit_price)
                                            
VALUES ('Product1', 10, 1.95),
				('Product2', 10, 1.95),
                ('Product3', 10, 1.95);





 -- 	------------ Creating a copy of a Table -----
 
 -- let's we want to creat new table which is going to contain all the info already in the orders table plus some new information, but we still want to main the order table as it, so we don't want to alter it.alter
 
 
 CREATE TABLE new_table AS 
 SELECT * FROM orders
 
 
 
-- we if we look at the new table (using the small setting icon) observe that SQL has ignored the primary key. We can add it by just ticking it and click apply

-- we can delete all the items in the table by just:
					-- right > truncate table, which will delete all the records

-- Now we can even do cool things over here, we can use the select statement as a su-query inside the INSERT statement. 

-- NOTE: FIRST TYPE THE SELECT STATEMENT THEN ADD THE INSERT STATEMENT

INSERT INTO new_table -- we already have the table names in our table so no need to indicate the table name

SELECT * 
FROM orders 
WHERE order_date < '2019-01-01'



-- EXERCISE

-- Create a copy of the invoice table and name it new_invoices
-- in this new_invoices table, instead of the client_id column, we want client_name column(which contains the clients names)
-- so we need to join the invoice table with the clients table and use it as a sub-query in a create table statement
-- also you need to copy only the invoices that do have a payment (you can observe that on at the payment_date column in the invoice table there some with null which indicates they do not have payments yet)


-- SOLUTION:


USE sql_invoicing;

-- 6 
CREATE TABLE new_invoices AS 

SELECT 

-- 3
			i.invoice_id,
            i.number,
            c.name AS client,
            i.invoice_total,  
            i.payment_total,
            i.invoice_date,  -- technically since the dates only exist in the invoice column and not the payments column, we can ignore not prefixing it with i
            i.payment_date,
            i.due_date
	
-- 1			
FROM invoices i

JOIN clients c
USING (client_id)

-- 4
WHERE payment_date IS NOT NULL

-- 2. now let's inspect the invoices table
-- 4 in order to get only the invoices that have payments, we can either use the payment date column or payment_total column(where payment > 0 )
-- 5 now finally we can use our SELECT statement as a subquery inside the CREATE TABLE statement
 
 
 -- 7 
 SELECT * 
 FROM new_invoices 
 
 


 -- 	------------ Updating a single Row -----
 
 -- let's consider the payments table
 -- we can observe that on the payment_date column, there null values in there meaning those invoices do not have payments yet
 -- let's consider a scenario that there actually a problem in the systement and that the client paid say $10 for thiat item but still reflecting null. we can 
-- we can write a query to take care of this


UPDATE invoices
SET payment_total = 10, payment_date = '2018-07-6'

WHERE invoice_id = 1

-- we can also revert what we just did,if for instance we updated the wrong invoice
                                            
UPDATE invoices
SET payment_total = 0, payment_date = NULL
WHERE invoice_id = 1

-- alternatively

UPDATE invoices
SET payment_total = DEFAULT, payment_date = NULL
WHERE invoice_id = 1
				
                
-- we can even do some cool stuff over here
-- let's 



 -- 	------------ Updating Multiple Row -----
 
 -- if we observe the client_id column on the invoices table, we can observe that client id 3 has multiple invoices, we can write a statement to update this clients info
 
 
UPDATE invoices
SET payment_total = payment_total*0.05,
		payment_date = due_date
WHERE client_id = 3

-- the above will give us an error because MySQL workbench allows only update of a single column.
-- to chane this
			-- go to MySQL Workbench (at the tool bar top there) > preferences > SQL Editor > scroll to down to the bottom > uncheck the box Safe Udate (that was checked to prevent you from accidentally deleting or updaing a bunch of records in your table)
            
            
            
-- now copy the above code 
-- reconnect to the instance of this workbench by closing this instance and reconnect from home
-- you can now paste the sql code and run


UPDATE invoices
SET payment_total = payment_total*0.05,
		payment_date = due_date
WHERE client_id IN (3,4)




-- EXERCISE

-- Write a query to give any customers born before 1990, 50 extra points


-- SOLUTION

USE sql_store;

UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01'



 -- 	------------ Deleting Data in Rows -----
 
 DELETE invoinces -- this will delete all the records in this table
 
 -- alternative, you can delete certain particular records
 
 DELETE invoinces 
 WHERE invoice_id = 1
 
 -- we canalso add a subquery
 
-- 2
DELETE invoinces 
WHERE client_id = (


-- 1 
 SELECT * 
 FROM clients
 WHERE name = 'Myworks'
 
 )
 



 
