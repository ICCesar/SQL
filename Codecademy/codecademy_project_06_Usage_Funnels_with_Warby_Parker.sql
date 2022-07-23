-- Question 1 Quiz Funnel
/* 
To help users find their perfect frame, Warby Parker has a Style Quiz that has the following questions:

“What are you looking for?”
“What’s your fit?”
“Which shapes do you like?”
“Which colors do you like?”
“When was your last eye exam?”
The users’ responses are stored in a table called survey.

Select all columns from the first 10 rows. What columns does the table have?
*/

SELECT *
FROM survey
LIMIT 10;

-- Question 2 What is the number of responses for each question?

SELECT question, COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;

-- Question 3 
/*
Using a spreadsheet program like Excel or Google Sheets, calculate the percentage of users who answer each question:
Which question(s) of the quiz have a lower completion rates?
What do you think is the reason?

1. What are you looking for?      500.00    100.00%
2. What's your fit?               475.00    95.00%
3. Which shapes do you like?      380.00    76.00%
4. Which colors do you like?      361.00    72.20%
5. When was your last eye exam?   270.00    54.00%
*/

-- Home Try-On Funnel

-- Question 4
/*
Let’s find out whether or not users who get more pairs to try on at home will be more likely to make a purchase.

The data will be distributed across three tables:

quiz
home_try_on
purchase
Examine the first five rows of each table

What are the column names?
*/
SELECT *
FROM quiz
LIMIT 5;
 
SELECT *
FROM home_try_on
LIMIT 5;
 
SELECT *
FROM purchase
LIMIT 5;

--Question 5
/*
We’d like to create a new table with the following layout:

user_id	  is_home_try_on	number_of_pairs	is_purchase
4e8118dc	 True	          3	              False
291f1cca	 True	          5	              False
75122300	 False	         NULL	           False

Each row will represent a single user from the browse table:

If the user has any entries in home_try_on, then is_home_try_on will be True.
number_of_pairs comes from home_try_on table
If the user has any entries in purchase, then is_purchase will be True.
Use a LEFT JOIN to combine the three tables, starting with the top of the funnel (quiz) and ending with the bottom of the funnel (purchase).

Select only the first 10 rows from this table (otherwise, the query will run really slowly).
*/

SELECT DISTINCT quiz.user_id,
   home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on 
   ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
   ON purchase.user_id = quiz.user_id
LIMIT 10;

--Question 6 What are some actionable insights for Warby Parker?

WITH quiz AS (
  SELECT "1-quiz" AS stage, 
  COUNT(DISTINCT user_id)
  FROM quiz
),
home_try_on AS (
  SELECT "2-home-try-on" AS stage, 
  COUNT(DISTINCT user_id)
  FROM home_try_on
),
purchase AS (
  SELECT "3-purchase" AS stage, COUNT(DISTINCT user_id)
  FROM purchase
)
SELECT *
FROM quiz
UNION ALL SELECT *
FROM home_try_on
UNION ALL SELECT *
FROM purchase;
      
WITH base_table AS (
  SELECT DISTINCT quiz.user_id,
  home_try_on.user_id IS NOT NULL AS "is_home_try_on",
  home_try_on.number_of_pairs AS "AB_variant",
  purchase.user_id IS NOT NULL AS "is_purchase"
  FROM quiz
  LEFT JOIN home_try_on
  ON quiz.user_id = home_try_on.user_id
  LEFT JOIN purchase
  ON purchase.user_id = quiz.user_id
)
SELECT AB_variant,
SUM(CASE WHEN is_home_try_on = 1
    THEN 1
    ELSE 0
    END) "home_trial",
SUM(CASE WHEN is_purchase = 1
    THEN 1
    ELSE 0
    END) "purchase"    
FROM base_table
GROUP BY AB_variant
HAVING home_trial > 0;

