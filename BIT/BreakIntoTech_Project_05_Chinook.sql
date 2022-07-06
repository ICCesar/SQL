/*
Answers to Final Project
*/

-- 01. Show Customers (their full names, customer ID, and country) who are not in the US. (Hint: != or <> can be used to say "is not equal to").
SELECT 
FirstName, 
LastName, 
CustomerId, 
Country 
FROM chinook.customers 
WHERE Country != "USA";

-- 02. Show only the Customers from Brazil.
SELECT * 
FROM chinook.customers 
WHERE Country = "Brazil";

-- 03. Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
SELECT 
cust.FirstName, 
cust.LastName, 
inv.InvoiceId, 
inv.BillingCountry, 
inv.InvoiceDate
FROM chinook.invoices AS inv 
LEFT JOIN chinook.customers AS cust 
ON inv.CustomerId = cust.CustomerId 
WHERE inv.BillingCountry = "Brazil";

-- 04. Show the Employees who are Sales Agents.
SELECT * 
FROM chinook.Employees
WHERE Title = "Sales Support Agent";

-- 05. Find a unique/distinct list of billing countries from the Invoice table.
SELECT 
DISTINCT BillingCountry 
FROM chinook.Invoices;

-- 06. Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
SELECT 
emp.LastName, 
emp.Firstname, 
inv.InvoiceId
FROM chinook.Employees emp 
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId

-- 07. Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
SELECT 
emp.LastName, 
emp.Firstname, 
cust.FirstName, 
cust.LastName, 
cust.Country, 
inv.total
FROM chinook.employees emp 
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId;

-- 08. How many Invoices were there in 2009?
SELECT 
COUNT(*)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'; --83

-- 09. What are the total sales for 2009?
SELECT 
SUM(Total)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'; --449.46

-- 10. Write a query that includes the purchased track name with each invoice line item.
SELECT 
t.Name, 
i.InvoiceLineId
FROM chinook.Invoice_items i
JOIN chinook.Tracks t 
ON i.TrackId = t.TrackId;

-- 11. Write a query that includes the purchased track name AND artist name with each invoice line item.
SELECT 
t.Name, 
t.Composer, 
i.InvoiceLineId
FROM chinook.Invoice_items i 
JOIN chinook.Tracks t 
ON i.TrackId = t.TrackId;

-- 12. Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
SELECT 
t.Name 
AS 'Tracks', 
a.Title 
AS 'Album name', 
m.Name 
AS 'Media type', 
g.Name 
AS 'Genre'
FROM chinook.tracks t
JOIN chinook.Albums a 
ON a.AlbumId = t.AlbumId
JOIN chinook.Media_Types m 
ON m.MediaTypeId = t.MediaTypeId
JOIN chinook.Genres g 
ON g.GenreId = t.GenreId;

-- 13. Show the total sales made by each sales agent.
SELECT 
emp.FirstName, 
emp.LastName,
ROUND(SUM(Inv.Total), 2) AS 'TotalSales' 
FROM chinook.Employees emp
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
GROUP BY emp.FirstName;

/*
FirstName LastName TotalSales
Jane	    Peacock	 833.04
Margaret	Park	   775.40
Steve	    Johnson	 720.16
*/

-- 14. Which sales agent made the most in sales in 2009?
SELECT 
emp.FirstName, 
emp.LastName,
ROUND(SUM(Inv.Total), 2) AS 'TotalSales' 
FROM chinook.Employees emp
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
AND Inv.InvoiceDate 
LIKE '2009%' 
GROUP BY emp.FirstName
ORDER BY (round(sum(Inv.Total), 2)) DESC 
LIMIT 1; --Steve Johnson 164.34
