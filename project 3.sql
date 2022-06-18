--Steps for manipulating of the data of some of the biggest names in industry.

--Looking at the data to get an idea what w are working with
SELECT *
FROM startups;

--Number of companies in table
SELECT COUNT(*)
FROM startups;

--Total value of all companies
SELECT SUM(valuation)
FROM startups;

--Max amount raised
SELECT MAX(raised)
FROM startups;

--Max raised in Seed stage
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

--Oldest company foundation year
SELECT MIN(founded)
FROM startups;

--Average valuation by category
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

--Average 
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

SELECT category, COUNT(*)
FROM startups
GROUP BY category;

SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;
