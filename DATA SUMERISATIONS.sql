

-- -------------------------------------- DATA SUMERISATIONS -------------------------------------- 



-- SQL Functions



-- --------------------------------------- Aggregate Functions ---------------------------------------

-- Aggregate functions provide a summary of your data

-- Aggregate 				Function	Descriptions

-- count()						It returns the number of rows, including rows with NULL values in a group.
-- sum()						It returns the total summed values (Non-NULL) in a set.
-- average()					It returns the average value of an expression.
-- min()						    It returns the minimum (lowest) value in a set.
-- max()						It returns the maximum (highest) value in a set.

-- 




-- Let's create a new table for this lessson;

-- Execute the below statement to create an new_employee table:

USE sql_hr;

CREATE TABLE new_employee(  
														name varchar(45) NOT NULL,    
														occupation varchar(35) NOT NULL,    
														working_date date,  
														working_hours INT(10)  
);  




-- Execute the below statement to insert the records into the employee table:

INSERT INTO new_employee 
VALUES    
				('Robin', 'Scientist', '2020-10-04', 5),  
				('Warner', 'Engineer', '2020-10-04', 7),  
				('Peter', 'Actor', '2020-10-04', 13),  
				('Marco', 'Engineer', '2020-10-04', 11),  
				('Brayden', 'Teacher', '2020-10-04', 9),  
				('Antonio', 'Business', '2020-10-04', 11);  


SELECT * FROM new_employee


-- COUNT()


SELECT COUNT(name)
FROM new_employee


-- SUM()


SELECT SUM(working_hours)
FROM new_employee

-- AVG()

SELECT AVG(working_hours)
FROM new_employee

-- MIN()
SELECT MIN(working_hours)
FROM new_employee

SELECT * FROM new_employee


-- MAX()


SELECT MAX(working_hours)
FROM new_employee


SELECT COUNT(name) AS count,
			 MIN(working_hours) AS minimum_hours,
             MAX(working_hours) AS maximum_hours,
             AVG(working_hours) AS average_hours
FROM new_employee



-- COUNT FXN in detail


-- COUNT with WHERE


SELECT COUNT(* )
FROM new_employee
WHERE working_hours > 10

-- -- COUNT with DISTINCT

SELECT COUNT(DISTINCT occupation)
FROM new_employee

-- HAVING()


USE sql_store;


SELECT first_name, last_name, points, phone
FROM customers
HAVING points > 1000















-- EXERCISE 
-- Explore the SQL GROUP BY clause  
-- GROUP BY :  https://www.mysqltutorial.org/mysql-having.aspx
-- ROLL UP : https://www.mysqltutorial.org/mysql-rollup/







-- LENGTH()

-- CHAR_LENGTH(), CHARACTER_LENGTH()


USE sql_hr;

SELECT first_name, LENGTH(first_name) AS length_of_name
FROM  employees

--

SELECT first_name, 
				LENGTH(first_name) ,
				CHAR_LENGTH(first_name),
                CHARACTER_LENGTH(first_name)
FROM  employees



-- CONCAT()

SELECT CONCAT(first_name,' ',last_name,': ', salary)
FROM employees


-- FORMAT()

SELECT salary, FORMAT(salary,0) AS formated
FROM employees


-- INSERT()

SELECT INSERT('abcEGF',4,3,'def')

SELECT* FROM employees 

SELECT job_title, INSERT(job_title,9,9,'General')
FROM employees
WHERE employee_id = 33391


-- LOCATE()

SELECT employee_id, job_title, LOCATE('executive', job_title)
FROM employees


SELECT employee_id, 
				job_title,
                INSERT (job_title, 8,9,'Manager')
FROM employees
                
WHERE employee_id = 80529


-- UCASE() : UPPER CASE
-- LCASE() : lower case


SELECT job_title, 
				first_name,
                last_name,
                LCASE(job_title),
                UCASE(first_name)
FROM employees



















