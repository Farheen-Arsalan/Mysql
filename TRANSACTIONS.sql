


-- --------------------------------- 		Transactions and Concurrency 	--------------------------------- 


-- Transactions are a way for a database to group related statements together to be executed as a single unit by the system. 
-- The statements are handled as a unit, with all component parts either completing successfully or reverting back to their original state. 
-- This is one way of maintaining consistency for changes that take multiple individual steps to achieve a single goal.



USE sql_hr;

DROP TABLE Accounts;

CREATE TABLE Accounts(
											id INT ,
											AccountName VARCHAR (10),
                                            AccountBalance DECIMAL(6,2)
											);



INSERT INTO Accounts
VALUES (1,'John', 300),
			   (2,'Nancy', 800);
               
               

SELECT * FROM Accounts;


-- Transactions


 START TRANSACTION;
 
			UPDATE Accounts
               SET AccountBalance = AccountBalance - 100
             WHERE id = 1;
            UPDATE Accounts
               SET AccountBalance =AccountBalance + 100
             WHERE id = 2;
            COMMIT;
		
        

SELECT * FROM Accounts;



-- --------------------------------- 		ROLLING BACK transactions 	--------------------------------- 


-- 
-- Transactions can be rolled back either automatically or manually. 
-- MySQL automatically rolls back transactions if one of the statements within results in an error or in other scenarios to avoid problems.

-- For instance, supposing we're using the same bank accounts example we were using before, 
-- if we find out after issuing the UPDATE statements that we accidentally transferred the wrong amount or used the wrong accounts, 
-- we could rollback the changes instead of committing them:



 START TRANSACTION;
 
			UPDATE Accounts
               SET AccountBalance = AccountBalance - 100
             WHERE id = 1;
            UPDATE Accounts
               SET AccountBalance =AccountBalance + 100
             WHERE id = 3;   -- Wrong account number here!  Must rollback
             
/* Gets us back to where we were before the transaction started */
         ROLLBACK;
    --         COMMIT;
    
    
    
    
    
-- --------------------------------- 		Using SAVEPOINT when rolling back	--------------------------------- 


-- By default, the ROLLBACK command resets the transaction to where it was when the START TRANSACTION or BEGIN commands were first called. But what if we only want to revert some of the statements within the transaction?
-- 
-- While you cannot specify arbitrary places to roll back to when issuing ROLLBACK command, you can roll back to any "save points" that you've set throughout the transaction. You can mark places in your transaction ahead of time with the SAVEPOINT command and then reference those specific locations when you need to roll back.
-- 
-- These save points allow you to create an intermediate roll back point. You can then optionally revert any statements made between where you are currently and the save point and then continue working on your transaction.
-- 
-- To specify a save point, issue the SAVEPOINT command followed by a name for the save point:


-- Let's add one more row in our table

INSERT INTO Accounts
VALUES (4,'George', 0)


SELECT * FROM Accounts;

    
    
--

START TRANSACTION;
   
			UPDATE Accounts
               SET AccountBalance = AccountBalance - 100
             WHERE id = 1;
             
             
/* Set a save point that we can return to */
        SAVEPOINT save_1;
        
        
           UPDATE Accounts
               SET AccountBalance =AccountBalance + 100
             WHERE id = 3;   -- Wrong account number here!  We can rollback to the save point though!
/* Gets us back to the state of the transaction at `save_1` */
         
         ROLLBACK TO save_1;
         
/* Continue the transaction with the correct account number */
UPDATE Accounts
               SET AccountBalance =AccountBalance + 100
             WHERE id = 4; 
           COMMIT;





