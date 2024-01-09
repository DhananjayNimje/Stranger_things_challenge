-- Retrieve the names of the characters?
SELECT C.name AS Character_Name FROM characters C;

-- Find characters with age greater than 18?
SELECT name FROM characters WHERE age > 18;

-- Find events in Season 2?
SELECT * FROM events;
SELECT event_name FROM events WHERE season = 2;

-- Get details of the 'Mind Flayer' monster?
SELECT * FROM monsters WHERE name = 'Mind Flayer';

-- Retrieve characters and their associated events?
SELECT C.name AS Character_Name, E.event_name AS Events 
FROM characters AS C
JOIN relationships AS R ON C.character_id = R.character1_id OR C.character_id = R.character2_id
JOIN events AS E ON E.event_id = R.character1_id OR E.event_id = R.character2_id;

-- Calculate the total number of characters from each hometown?
SELECT hometown, COUNT(character_id) AS Total  FROM characters
GROUP BY hometown;

-- Retrieve characters who were involved in events in Season 1 or Season 2?
SELECT C.name AS Character_Name, E.season AS seasons 
FROM characters AS C
JOIN relationships AS R ON C.character_id = R.character1_id OR C.character_id = R.character2_id
JOIN events AS E ON E.event_id = R.character1_id OR E.event_id = R.character2_id WHERE E.season = 1 OR E.season = 2;

-- Find the top 3 oldest characters?
SELECT name, age FROM characters
ORDER BY age DESC
LIMIT 3;

-- Find the average age of characters in Hawkins?
SELECT AVG(age) AS average_age FROM characters WHERE hometown = 'Hawkins';

-- Rank characters by age in descending order?
SELECT C.name AS Character_Name, C.age, RANK() OVER(ORDER BY C.age DESC) AS Ranking FROM characters AS C;
