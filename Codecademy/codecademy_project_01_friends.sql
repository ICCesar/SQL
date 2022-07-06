--Create friends table
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

--Insert data into table
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');
INSERT INTO friends (id, name, birthday)
VALUES (2, 'Luke Emerson', '2000-08-15');
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Steven Smartz', '1998-01-10');

--Inspect
SELECT *
FROM friends;

--Change Ororo to Storm
UPDATE friends
SET name = 'Storm'
WHERE id = 1;

--Add column
ALTER TABLE friends
ADD COLUMN email TEXT;

--Add email to Storm
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

--Delete false people
DELETE FROM friends
WHERE id = 1;

--Review table
SELECT *
FROM friends;
