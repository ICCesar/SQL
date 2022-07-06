/*
All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.
*/

-- 01. Find all the tracks that have a length of 5,000,000 milliseconds or more. How many tracks are returned?
SELECT *
FROM Tracks
WHERE Milliseconds >= 5000000 --2

-- 02. Find all the invoices whose total is between $5 and $15 dollars. While the query in this example is limited to 10 records, running the query correctly will indicate how many total records there are - enter that number below.
SELECT *
FROM Invoices
WHERE Total BETWEEN 5 AND 15 --168

-- 03. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY. What company does Jack Smith work for?
SELECT *
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY') --Microsoft Corp

-- 04. Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00. What was the invoice date for invoice ID 315?
SELECT *
FROM Invoices
WHERE (CustomerId IN ('56', '58')) AND (Total BETWEEN 1 AND 5) --10-27-2012

-- 05. Find all the tracks whose name starts with 'All'. While only 10 records are shown, the query will indicate how many total records there are for this query - enter that number below.
SELECT *
FROM Tracks
WHERE Name LIKE 'All%' --15

-- 06. Find all the customer emails that start with "J" and are from gmail.com. Enter the one email address returned (you will likely need to scroll to the right) below.
SELECT Email
FROM Customers
WHERE Email LIKE 'J%gmail.com' --jubarnett@gmail.com

-- 07. Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID. What is the total invoice amount of the first record returned? Enter the number below without a $ sign. Remember to sort in descending order to get the correct answer.
SELECT InvoiceId, BillingCity, Total
FROM Invoices
WHERE BillingCity IN ('Brasilia','Edmonton','Vancouver')
ORDER BY InvoiceId DESC --13.86

-- 08. Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order. What is the number of items placed for the 8th person on this list? Enter that number below. 
SELECT CustomerId, COUNT(*) AS Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Orders DESC --7

-- 09. Find the albums with 12 or more tracks. While the number of records returned is limited to 10, the query, if run correctly, will indicate how many total records there are. Enter that number below.
SELECT AlbumId, Count(*) AS Ntracks
FROM Tracks
GROUP BY AlbumId
HAVING COUNT (*) >= 12 --158
