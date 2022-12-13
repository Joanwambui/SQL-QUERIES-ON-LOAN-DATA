---WE WILL EXPLORE THE THREE TABLES WITH THE FOLLOWING QUESTIONS
---Using the tables above, please write the SQL code that would answer each of the following questions (write the code below each of them).

 --1.) Select all the clients called Paul in first_name or middle_name and who are more than 25 years old.
   -- In the results, create a column with the client's age in years. 
   -- Order them from older to younger.
select* from client

---calculating the age of the clients
SELECT DATEDIFF(yy,[date_of_birth],getdate())+(CASE WHEN DATEPART (MONTH,GETDATE())-DATEPART(MONTH,[date_of_birth])<0 THEN -1 ELSE 0 END) as Age
FROM client

SELECT client_id,first_name,middle_name,last_name,date_of_birth,DATEDIFF(yy,[date_of_birth],getdate())+(CASE WHEN DATEPART (MONTH,GETDATE())-DATEPART(MONTH,[date_of_birth])<0 THEN -1 ELSE 0 END) as Age
FROM client
---alternatively,
ALTER TABLE client ADD Age AS DATEDIFF(YEAR, date_Of_birth, GETDATE()) 

select *
from client
order by Age DESC;
--Select all the clients called Paul in first_name or middle_name and who are more than 25 years old.
SELECT first_name,middle_name,Age
FROM client
WHERE first_name ='Paul' AND Age>25
OR middle_name='Paul'

---- Add a column to the table from question (1) that contains the number of loans each customer made.
   -- If there is no loan, this column should show 0.
select *
from client
select * 
from loan
select * 
from vehicle
--- 

3. -- Select the 100cc, 125cc and 150cc bikes from the vehicle table.
   -- Add an engine_size column to the output (that contains the engine size).
select * 
from vehicle



SELECT  *,
CASE 
    WHEN model_name LIKE '%100cc%' THEN 100
	WHEN model_name LIKE '%125cc%' THEN 125
	WHEN model_name LIKE '%150cc%' THEN 150
	END AS engine_size
FROM vehicle



-- Calculate the total principal_amount per client full name (one column that includes all the names for each client) and per vehicle make.
select *
from client
select * 
from loan
select * 
from vehicle


-- Select the loan table and add an extra column that shows the chronological loan order for each client based on the submitted_on_date column:
SELECT  *,
RANK() OVER(PARTITION BY client_id ORDER BY submitted_on_date ASC) loan_order
FROM loan
