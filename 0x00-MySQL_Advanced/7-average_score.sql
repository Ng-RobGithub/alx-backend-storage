-- Description: This stored procedure computes and stores the average score for a student based on their correction scores.
-- Procedure: ComputeAverageScoreForUser
-- Input: user_id - the ID of the user for whom the average score needs to be computed
-- Output: Updates the average_score field in the users table with the computed average score
-- Assumptions: user_id is linked to an existing user in the users table
-- Author: [Your Name]
-- Date: [Current Date]
-- Version: 1.0

DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(IN `user_id` INT)
BEGIN 
    UPDATE users
    SET average_score = (SELECT AVG(score)
                        FROM corrections
                        WHERE corrections.user_id = user_id)
    WHERE id = user_id;
END $$
DELIMITER ;$$
