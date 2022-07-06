/*
Part 1
*/

--1. How many orders were placed in January?
SELECT COUNT(orderid)
FROM BIT_DB.JanSales; -- 9723

--2. How many of those orders were for an iPhone?
SELECT COUNT(orderid)
FROM BIT_DB.JanSales
WHERE Product='iPhone'; --379

--3. Select the customer account numbers for all the orders that were placed in February.
SELECT acctnum
FROM BIT_DB.customers cust
INNER JOIN BIT_DB.FebSales Feb
ON cust.order_id=FEB.orderid;

--4. Which product was the cheapest one sold in January, and what was the price? For this one, you are going to use the commands distinct and MIN(). Using 'SELECT distinct' will remove duplicate rows from your results. The MIN() command will allow you to select the smallest value from the price column. This is a hard one - see if you can do it, but don't be afraid to look at the hint or answer if you need to!
SELECT distinct Product, price
FROM BIT_DB.JanSales
WHERE  price IN (SELECT MIN(price) FROM BIT_DB.JanSales); --AAA Batteries (4-pack) $2.99

--5. What is the total revenue for each product sold in January? (Revenue can be calculated using the number of products sold and the price of the products).
SELECT SUM(quantity)*price AS revenue, product
FROM BIT_DB.JanSales
GROUP BY product;

--6. Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
SELECT sum(Quantity), 
product, 
sum(quantity)*price as revenue
FROM BIT_DB.FebSales 
WHERE location = '548 Lincoln St, Seattle, WA 98101'
GROUP BY product; --2, AA Batteries (4-pack), $7.68

--7. How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?
select 
count(cust.acctnum), 
avg(quantity*price)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE Feb.Quantity>2; --890, at $4.17

/*
Part 2
*/

--1. Data filtered by date examples
SELECT orderdate
FROM BIT_DB.FebSales
WHERE orderdate between '02/13/19 00:00' AND '02/18/19 00:00';

SELECT location
FROM BIT_DB.FebSales 
WHERE orderdate = '02/18/19 01:35';

SELECT sum(quantity)
FROM BIT_DB.FebSales 
WHERE orderdate like '02/18/19%';

SELECT distinct Product
FROM BIT_DB.FebSales
WHERE Product like '%Batteries%';

SELECT distinct Product, Price
FROM BIT_DB.FebSales 
WHERE Price like '%.99';

--3. List all the products sold in Los Angeles in February, and include how many of each were sold.
SELECT Product, SUM(quantity)
FROM BIT_DB.FebSales 
WHERE location like '%Los Angeles%'
GROUP BY Product;

/*
Part 3
*/

--1. Which locations in New York received at least 3 orders in January, and how many orders did they each receive?
SELECT DISTINCT location, COUNT(orderID)
FROM BIT_DB.JanSales
WHERE location LIKE '%NY%'
GROUP BY location
HAVING COUNT(orderID)>2;

/*
148 Elm St, New York City, NY 10001	        3
515 Lincoln St, New York City, NY 10001	        3
916 Pine St, New York City, NY 10001    	3
961 Jefferson St, New York City, NY 10001	4
*/

--2. How many of each type of headphone was sold in February?
SELECT sum(Quantity) as quantity,
Product
FROM BIT_DB.FebSales 
WHERE Product like '%Headphones%'
GROUP BY Product;

/*
1013	Apple Airpods Headphones
844	Bose SoundSport Headphones
1282	Wired Headphones
*/

--3. What was the average amount spent per account in February?
SELECT SUM(quantity*price)/COUNT(cust.acctnum)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id; --181.46

--4. What was the average quantity of products purchased per account in February? 
select sum(quantity)/count(cust.acctnum)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id;

--5. Which product brought in the most revenue in January and how much revenue did it bring in total? 
SELECT product, 
SUM(quantity*price)
FROM BIT_DB.JanSales 
GROUP BY product
ORDER BY SUM(quantity*price) DESC
LIMIT 1; --399500
