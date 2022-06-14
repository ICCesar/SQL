--View all restaurant info
SELECT *
FROM nomnom;

--What are the distinct neighborhoods?
SELECT DISTINCT neighborhood
FROM nomnom;

--What are the distinct cuisine types?
SELECT DISTINCT cuisine
FROM nomnom;

--What are our Chinese takeout options?
SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

--All the restaurants with reviews of 4 and above
SELECT *
FROM nomnom
WHERE review >= 4;

--Return all the restaurants that are Italian and $$$
SELECT *
FROM nomnom
WHERE cuisine = 'Italian'
   AND price = '%$$$%';

--Find all the close by spots in Midtown, Downtown or Chinatown
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';   

--Find all the close by spots in Midtown, Downtown or Chinatown
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
   OR neighborhood = 'Downtown'
   OR neighborhood = 'Chinatown'; 

--Missing health score
SELECT *
FROM nomnom
WHERE health IS NULL;   

--Top 10 Restaurants Ranking based on reviews
SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

--
SELECT name,
 CASE
  WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'Poor'
 END AS 'Review'
FROM nomnom;
