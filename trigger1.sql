

-- -------------------------------------------		Before Insert Trigger -------------------------------------------------------

USE sql_store;

CREATE TRIGGER new_price

BEFORE INSERT
ON products
FOR EACH ROW

SET NEW.unit_price = NEW.unit_price-NEW.unit_price*0.1


--


INSERT INTO products

VALUES (12, 'BOOKS', 30,50.0)


SELECT * FROM products






-- -------------------------------------------		AFTER Insert Trigger -------------------------------------------------------

USE invoicing;

DROP TRIGGER payments_default;

CREATE TRIGGER payments_default
AFTER INSERT
ON payments
FOR EACH ROW


INSERT INTO clients (client_id, name)
VALUES (6, 'client name not provided');



--

INSERT INTO payments (payment_id, invoice_id, amount,payment_method)

VALUES (20, 30.5,9, 3);



--

DROP TRIGGER trigger_invoice;
CREATE TRIGGER trigger_invoice
AFTER INSERT
ON invoices
FOR EACH ROW


INSERT INTO clients (client_id, name)
VALUES (client_id, 'client name not provided');


--

INSERT INTO invoices ( invoice_id,  payment_total)

VALUES (20,5)


ALTER TABLE `invoicing`.`invoices` 
DROP FOREIGN KEY `FK_client_id`
