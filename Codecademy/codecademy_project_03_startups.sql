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

--Let's find out the valuations among different sectors:

--Average valuation by category
SELECT category, AVG(valuation)
FROM startups
GROUP BY category;

--Average valuation in each category rounded to two decimal places
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;

--What are the most competitive markets?

--All categories with number of companies
SELECT category, COUNT(*)
FROM startups
GROUP BY category;

--Categories with more than three companies by
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

--Let's see if there's a difference in startups sizes among different locations:

--Average size of startup by location
SELECT location, AVG(employees)
FROM startups
GROUP BY location;

--Average size of startup by location with average size > 500
SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;
