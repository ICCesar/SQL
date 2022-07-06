-- 01. Retrieve all the records from the Employees table.
SELECT * FROM Employees --590 Columbia Boulevard West, Lethbridge, AB, CANADA T1K 5N8

-- 02. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
SELECT FirstName, 
LastName, 
Birthdate, 
Address, 
City, 
State
FROM Employees; --Steve

-- 03. Retrieve all the columns from the Tracks table, but only return 20 rows.
SELECT * FROM Tracks
LIMIT 20 --375418
