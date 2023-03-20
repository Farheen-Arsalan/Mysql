-- 			---------------------------------------  NOT NULL CONSTRAINTS --------------------------------------- 


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);


-- NOT NULL on ALTER TABLE
-- To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:

ALTER TABLE Persons
MODIFY Age int NOT NULL;





-- 							---------------------------------------  UNIQUE CONSTRAINTS --------------------------------------- 


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

-- you can also write it the following way
    
DROP TABLE  Persons;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL UNIQUE,
    FirstName varchar(255),
    Age int
);



-- create multiple constraints

DROP TABLE  Persons;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
    );
    

-- dropping a constraints    
    
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName),
DROP INDEX UC_Person;




--  					---------------------------------------  PRIMARY KEY Constraint --------------------------------------- 



CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);



-- PRIMARY KEY on ALTER TABLE
-- To create a PRIMARY KEY constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD PRIMARY KEY (ID);


-- Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain NULL values (when the table was first created).


-- DROP a PRIMARY KEY Constraint
-- To drop a PRIMARY KEY constraint, use the following SQL:


ALTER TABLE Persons
DROP PRIMARY KEY;



-- 					---------------------------------------   FOREIGN KEY  	--------------------------------------- 

-- create Person's table

CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (PersonID)
);

-- create orders table

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- FOREIGN KEY on ALTER TABLE

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

-- DROP a FOREIGN KEY Constraint

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;




--       								-------------------------				MySQL CHECK Constraint  ------------------------------


-- The CHECK constraint is used to limit the value range that can be placed in a column.

-- If you define a CHECK constraint on a column it will allow only certain values for this column.

-- If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);



-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:



CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);


-- CHECK on ALTER TABLE

ALTER TABLE Persons
ADD CHECK (Age>=18);

-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

-- DROP a CHECK Constraint

ALTER TABLE Person
DROP CHK_PersonAge;



-- 					-------------------------	  DEFAULT Constraint  -------------------------	

-- The DEFAULT constraint is used to set a default value for a column.

-- The default value will be added to all new records, if no other value is specified.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

-- The DEFAULT constraint can also be used to insert system values, by using functions like CURRENT_DATE():
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

-- DEFAULT on ALTER TABLE

ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

-- DROP a DEFAULT Constraint

ALTER TABLE Persons
ALTER City DROP DEFAULT;
