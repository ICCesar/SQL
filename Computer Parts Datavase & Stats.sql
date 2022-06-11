--Data Creation
CREATE TABLE store(
  id        INTEGER PRIMARY KEY, 
  item      TEXT, 
  section   TEXT, 
  price     INTEGER, 
  necessity INTEGER
);

--Data Input
INSERT INTO store VALUES (01, "CPU", "hardware", 699.99, 1);
INSERT INTO store VALUES (02, "Motherboard", "hardware", 249.99, 1);
INSERT INTO store VALUES (03, "OS", "software", 99.99, 1);
INSERT INTO store VALUES (04, "Case", "hardware", 49.99, 2);
INSERT INTO store VALUES (05, "Fans", "hardware", 4.99, 5);
INSERT INTO store VALUES (06, "Mouse", "input", 78.25, 3);
INSERT INTO store VALUES (07, "Monitor", "output", 219.99, 2);
INSERT INTO store VALUES (08, "Office", "software", 99.99, 5);
INSERT INTO store VALUES (09, "Adobe", "software", 999.99, 5);
INSERT INTO store VALUES (10, "Keyboard", "input", 79.99, 3);
INSERT INTO store VALUES (11, "Speakers", "output", 34.99, 4);
INSERT INTO store VALUES (12, "Microphone", "input", 14.99, 4);
INSERT INTO store VALUES (13, "Power supply", "hardware", 149.99, 1);
INSERT INTO store VALUES (14, "RAM", "hardware", 249.99, 1);
INSERT INTO store VALUES (15, "Web Cam", "input", 19.99, 5);

--Data ordered by price
SELECT * FROM store
ORDER BY price desc;

--Average price of hardware
SELECT AVG(price) "Average hardware item price"
FROM store
WHERE section = 'hardware';

--Top 5 important items
SELECT item, price, necessity
FROM store
ORDER BY necessity ASC
LIMIT 5;
