

-- ---------------------------------------------				Views    ---------------------------------------------	

-- Select all employes that do not hold a VP position



SELECT* FROM employees
WHERE job_title NOT LIKE '%VP%'  AND reports_to IS NOT NULL

-- now sometimes you will want to save this kind of query so that you do not have to remember how exactly you wrote the query to get the results.

-- you can then store the results and view it later. Note we are not creating any data, we are only storing our query so that 
-- we will not have to rememeber to write it over and over again.and
-- it also helps others to build upon that query later on


-- Create VIEWS
CREATE VIEW employee_results

AS

SELECT* FROM employees
WHERE job_title NOT LIKE '%VP%'  AND reports_to IS NOT NULL



-- Use VIEWS


-- Now we can treat this view as a table

SELECT * FROM employee_results

-- you can now build upon this view


SELECT 
			first_name, 
            last_name,
            salary,
           FORMAT(salary*0.05 + salary,0) AS salary_increase_5_percent -- we can also use the round() function to format that results to number of decimal places


FROM employee_results



-- Alter VIEW

ALTER VIEW  employee_results
AS

SELECT* FROM employees
WHERE job_title NOT LIKE '%VP%' 



SELECT * FROM employee_results


-- Drop VIEWS

DROP VIEW employee_results



SELECT * FROM employee_results


