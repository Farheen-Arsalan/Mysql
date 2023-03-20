

-- --------------------------------- 		Transactions 	--------------------------------- 


-- Transactions are a way for a database to group related statements together to be executed as a single unit by the system. 
-- The statements are handled as a unit, with all component parts either completing successfully or reverting back to their original state. 
-- This is one way of maintaining consistency for changes that take multiple individual steps to achieve a single goal.



USE sql_hr;

CREATE TABLE Accounts(
											id INT,
                                            AccountName varchar(10),
                                            AccountBalance DECIMAL(6,3)
                                            
);



 DROP TABLE Accounts;
INSERT INTO Accounts
VALUES (1,'John',300),
				(2,'Nancy',800);
                
SELECT* FROM Accounts;
										


START TRANSACTION;
				UPDATE Accounts
					SET AccountBalance = AccountBalance-100
                    WHERE id = 1;
				UPDATE Accounts
					SET AccountBalance = AccountBalance +100
                    WHERE id = 2;
                    COMMIT;
                    

-- 

START TRANSACTION;
				UPDATE Accounts
					SET AccountBalance = AccountBalance-100
                    WHERE id = 1;
				UPDATE Accounts
					SET AccountBalance = AccountBalance +100
                    WHERE id = 3;
                    COMMIT;
                    
                    
SELECT* FROM Accounts


-- Rollback

START TRANSACTION;
				UPDATE Accounts
					SET AccountBalance = AccountBalance-100
                    WHERE id = 1;
				UPDATE Accounts
					SET AccountBalance = AccountBalance +100
                    WHERE id = 3;
                    
			ROLLBACK;
       --              COMMIT;


-- save point

INSERT INTO Accounts
VALUES (3,'George',0)

SELECT * FROM Accounts

-- 

START TRANSACTION;
				UPDATE Accounts
					SET AccountBalance = AccountBalance-100
                    WHERE id = 1;
			SAVEPOINT save_1;
				UPDATE Accounts
					SET AccountBalance = AccountBalance +100
                    WHERE id = 5;
                    
                    
                    
			ROLLBACK TO save_1;
            
				UPDATE Accounts
					SET AccountBalance = AccountBalance +100
                    WHERE id = 3;
				COMMIT;