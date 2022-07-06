-- 02. Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query.
SELECT 
DISTINCT Extended_Step
FROM salary_range_by_job_classification --5

-- 03. Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
SELECT 
MIN(Biweekly_High_Rate)
FROM salary_range_by_job_classification
WHERE Biweekly_High_Rate != '$0.00' --$100.00

-- 04. What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
SELECT 
MAX(Biweekly_High_Rate) 
FROM salary_range_by_job_classification --$9726.38

-- 05. What is the pay type for all the job codes that start with '03'? The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.
Select
Job_Code,
Pay_Type
From salary_range_by_job_classification
WHERE Job_Code LIKE '03%' --B

-- 06. Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query.
SELECT
Grade,
Eff_Date,
Sal_End_Date
From salary_range_by_job_classification
WHERE Grade = 'Q90H0' --12/26/2009 12:00:00 AM

-- 07. Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query. Are these values properly sorted?
SELECT
Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC --No

-- 08. Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400?
SELECT
Step,
Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code BETWEEN '0110' AND '0400'
ORDER BY Job_Code ASC --1

-- 09. Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
SELECT
(Biweekly_High_Rate - Biweekly_Low_Rate) AS Diff,
Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code = '0170' --0

-- 10. Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 
SELECT
Extended_Step,
Pay_Type
FROM salary_range_by_job_classification
WHERE Pay_Type IN ('M', 'H', 'D') --0

-- 11. Write and run a query, with no starter code or hints to answer this question: What is the step for
Union Code 990 and a Set ID of SFMTA or COMMN? 
SELECT
Step,
Union_Code,
SetID
FROM salary_range_by_job_classification
WHERE Union_Code = '990' AND (SetID = 'SFTMTA' OR SetID = 'COMMN') --1
