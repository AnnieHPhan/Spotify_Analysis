
/*******************************************************************************************
** 	File: Final_Project.sql
** 	Date: 12/03/2018
*******************************************************************************************/

USE `mydb`;

#1. Total of streams per Country
SELECT 
	b.country_name,
	SUM(a.streams) AS Total_Streams
FROM
    spotify_chart a
LEFT JOIN
    country b 
    ON a.Country_id = b.Country_id
GROUP BY
	b.country_name;
    

#2. Top 5 days with the most streams.
SELECT 
	b.date,
    SUM(a.streams) AS Total_Streams
FROM
    spotify_chart a
LEFT JOIN
    date b 
    ON a.date_id = b.date_id
GROUP BY
	b.date
ORDER BY
	Total_Streams DESC 
LIMIT 5;
    
#3. Top 5 countries with the most Artists
SELECT 
	b.country_name,
	COUNT(a.Artist_name) AS Artist_Total
FROM
    artists a
LEFT JOIN
    country b 
    ON a.Country_id = b.Country_id
GROUP BY
	b.country_name
ORDER BY
	Artist_Total
	DESC
Limit 5;

#4 Top 10 artists with the most streams
SELECT 
	b.artist_name,
	SUM(a.streams) AS Total_Streams
FROM
    spotify_chart a
LEFT JOIN
    artists b 
    ON a.artist_id = b.artist_id
GROUP BY
	b.artist_name
    ORDER BY
	Total_Streams
	DESC
Limit 10;

SELECT 
	a.artist_name,
    b.Streams
FROM 
    Artists a 
INNER JOIN 
    Spotify_chart b
ON a.Artist_id = b.Artist_id;

USE mydb;

# Top 5 artist who are also in the top 200 bilboad.
SELECT 
	a.Artist_id,
    a.artist_name,
    COUNT(b.Album_id) AS TotalAlbum
FROM 
    Artists a 
INNER JOIN 
    Albums_billboard b
ON a.Artist_id = b.Artist_id
GROUP BY a.Artist_id
ORDER BY TotalAlbum DESC
LIMIT 5;

SELECT * FROM spotify_chart;
SELECT * FROM artists;

# Top artists have most concerts:
SELECT 
	b.artist_name,
	Count(a.Concert_id) AS Total_Concerts
FROM
    Concerts a
LEFT JOIN
    Artists b 
    ON a.artist_id = b.artist_id
GROUP BY
	b.artist_name
    ORDER BY
	Total_Concerts DESC
Limit 10;