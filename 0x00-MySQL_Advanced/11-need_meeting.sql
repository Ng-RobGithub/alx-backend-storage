-- Create a view named 'need_meeting' that lists all students who have a score under 80 (strict)
-- and no 'last_meeting' or more than one month.

DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR DATEDIFF(CURDATE(), last_meeting) > 30);

-- Test the 'need_meeting' view
-- Select all students from the 'need_meeting' view
SELECT * FROM need_meeting;

-- Update the score of 'Bob' to 40
UPDATE students SET score = 40 WHERE name = 'Bob';

-- Check the updated 'need_meeting' view
SELECT * FROM need_meeting;

-- Update the score of 'Steeve' to 80
UPDATE students SET score = 80 WHERE name = 'Steeve';

-- Check the updated 'need_meeting' view
SELECT * FROM need_meeting;

-- Update the 'last_meeting' date of 'Jean' to the current date
UPDATE students SET last_meeting = CURDATE() WHERE name = 'Jean';

-- Check the updated 'need_meeting' view
SELECT * FROM need_meeting;

-- Update the 'last_meeting' date of 'Jean' to two months ago
UPDATE students SET last_meeting = ADDDATE(CURDATE(), INTERVAL -2 MONTH) WHERE name = 'Jean';

-- Check the updated 'need_meeting' view
SELECT * FROM need_meeting;

-- Show the SQL statement used to create the 'need_meeting' view
SHOW CREATE TABLE need_meeting;

-- Show the SQL statement used to create the 'students' table
SHOW CREATE TABLE students;
