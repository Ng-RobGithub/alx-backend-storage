-- Description: This stored procedure computes and stores the average score for a student based on their correction scores.
-- Procedure: ComputeAverageScoreForUser
-- Input: user_id - the ID of the user for whom the average score needs to be computed
-- Output: Updates the average_score field in the users table with the computed average score
-- Assumptions: user_id is linked to an existing user in the users table
-- Author: [Your Name]
-- Date: [Current Date]
-- Version: 1.0

DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score INT;
    DECLARE total_projects INT;

    -- Calculate the total score and total number of projects for the user
    SELECT SUM(score), COUNT(*) INTO total_score, total_projects
    FROM corrections
    WHERE user_id = user_id;

    -- Update the average_score field in the users table
    UPDATE users
    SET average_score = total_score / total_projects
    WHERE id = user_id;
END //

DELIMITER ;
