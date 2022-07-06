-- 01. Retrieve all the data from the tracks table. Who is the composer for track 18?
Select *
From Tracks; --AC/DC

-- 02. Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?
Select *
From Artists; --6

-- 03. Retrieve all data from the invoices table. What is the billing address for customer 31?
Select *
From Invoices; --194A Chain Lake Drive, Halifax, NS, CANADA B3S 1C5

-- 04. Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?
Select 
Playlistid,
Name
From Playlists; --18

-- 05. Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?
Select CustomerId,
InvoiceDate, 
BillingCity 
From Invoices; --Bordeaux and 2009-04-04

-- 06. Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?
Select FirstName, 
LastName, 
Email, 
Phone
From Customers; --+1 (604) 688-2255

-- 07. Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?
Select TrackId, 
GenreId, 
Composer, 
UnitPrice 
From Tracks; --0.99

-- 08. Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?
Select *
From Playlist_track 
Limit 10; --To view data, and have an idea how to utilize the data.

-- 09. Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?
Select *
From Media_types
Limit 50; --No, there were only 5.

-- 10. Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table? 
Select *
From Albums; --Three, Plays Metallica By Four Cellos

