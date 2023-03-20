
-- A trigger is a stored program invoked automatically in response to an event such as insert, 
-- update, or delete that occurs in the associated table. 
-- For example, you can define a trigger that is invoked automatically before a new row is inserted into a table.
-- or sending an email confirmation to customers after booking a flight ticket.
-- 

-- Before Insert Trigger 
-- After Insert Trigger



-- -------------------------------------------		Before Insert Trigger -------------------------------------------------------

CREATE TRIGGER new_price
BEFORE INSERT
ON products
FOR EACH ROW

SET NEW.unit_price = NEW.unit_price-NEW.unit_price*0.01; -- To distinguish between the value of the columns BEFORE and AFTER the DML has fired, you use the NEW and OLD modifiers.


-- 


INSERT INTO products
VALUES 
			(11,'PEN',5,5.5);



-- 




SELECT* FROM products;






-- -------------------------------------------		After Insert Trigger -------------------------------------------------------


USE sql_invoicing;

CREATE TRIGGER payment_default
AFTER INSERT
ON payments
FOR EACH ROW


INSERT INTO payment_methods
VALUES 
			(new.payment_id,'no payment option available');




INSERT INTO payments (payment_id,client_id,invoice_id,amount,payment_method) -- we did not add the date, also i have removed the NON NULL constraints from the date column so that i can leave it empty
VALUES 
			(9,2,5,20.5,3);
            
            
select *
from payments


SELECT * FROM payment_methods

-- 

-- -------------------------------------------		DROP TRIGGER -------------------------------------------------------


DROP TRIGGER payment_default;



-- For more on SQL triggers: https://www.mysqltutorial.org/mysql-triggers/
