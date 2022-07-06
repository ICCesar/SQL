/*
Lyft Trip Data
*/

--Calling the three tables
SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

--Primary key for the three tables is id

--Looking at joining riders and cars
SELECT riders.first,
   riders.last,
   cars.model
FROM riders, cars; --Not very helpful

--Using a LEFT JOIN on trips and riders for trip log
SELECT *
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;
  
--Too many columns with unwanted info. Now reducing for specific columns
SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;
  
--Inner join of cars and trips on id
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;
  
--Combinding new data   
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

--What is average cost for a trip
SELECT AVG(cost)
FROM trips;

--Joining riders and riders two in order to find irregular users.
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

--Number of active cars
SELECT COUNT(*)
FROM cars
WHERE status = 'active';

--Top two cars with most trips.
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
