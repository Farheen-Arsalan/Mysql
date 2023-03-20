

-- CONSTRAINTS

-- 								-------- NOT NULL -----
USE new_database;

CREATE TABLE persons (
							ID INT NOT NULL,
                            First_name VARCHAR(8) NOT NULL,
                            Last_name VARCHAR(8) NULL,
                            Age INT NULL
                            )


SELECT * 
FROM persons;
                            
                            
-- 								-------- UNIQUE CONTRAINTS -----

DROP TABLE persons;

DROP TABLE persons;
CREATE TABLE persons( 
						ID INT NOT NULL ,
                        First_name VARCHAR(19), 
                        Last_name VARCHAR(20),
                        Age INT NULL,
                        UNIQUE(ID)
                        );


INSERT INTO persons (First_name,Last_name,Age)
VALUES ('Arya','Grande', 20);



SELECT * 
FROM persons;

-- 								-------- DEFAULT Constraint -----




DROP TABLE persons;
CREATE TABLE persons( 
						ID INT NULL DEFAULT 100,
                        First_name VARCHAR(19), 
                        Last_name VARCHAR(20),
                        Age INT NULL, 
                        UNIQUE(ID)
                        );
                        
INSERT INTO persons (First_name,Last_name,Age)
VALUES ('Jhon','Mason', 29);



SELECT * 
FROM persons;



-- 								-------- PRIMARY KEY -----



CREATE TABLE Customers(
						name VARCHAR(7),
                        Product VARCHAR(13),
                        Product_ID INT,
                        PRIMARY KEY(Product_ID)
                        );
                        
                        
                        
-- 								-------- Altering Existing Table(Adding a constraint) -----

ALTER TABLE persons
ADD PRIMARY KEY(ID);




-- 								-------- Altering Existing Table(Dropping a constraint) -----




CREATE TABLE passengers(
							first_name VARCHAR(10),
                            last_name VARCHAR(10),
                            mobile INT,
                            ticket_number VARCHAR(5)
                            )
                            
                            
SELECT *
FROM passengers;


ALTER TABLE passengers
ADD CONSTRAINT UC_passengers UNIQUE (mobile, ticket_number);

ALTER TABLE passengers
DROP INDEX UC_passengers;




-- 								-------- FOREIGN KEY-----



CREATE TABLE customers2 (
							Customer_ID INT NOT NULL,
                            First_name VARCHAR(20),
                            Last_name VARCHAR(20),
                            Age INT,
                            PRIMARY KEY (Customer_ID));
                            
                            
CREATE TABLE orders(
						   orderID INT NOT NULL,
                           orderNumber INT NOT NULL,
                           Customer_ID INT,
                           PRIMARY KEY (orderID),
                           FOREIGN KEY (Customer_ID ) REFERENCES customers2 (Customer_ID)
                           );
                           

