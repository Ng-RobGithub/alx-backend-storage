-- Create a stored procedure named ComputeAverageWeightedScoreForUser that computes and stores the average weighted score for a student
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;
    DECLARE weighted_average FLOAT;

    -- Initialize variables
    SET total_score = 0;
    SET total_weight = 0;

    -- Calculate total weighted score and total weight for the given user
    SELECT SUM(c.score * p.weight), SUM(p.weight)
    INTO total_score, total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    -- Calculate weighted average score
    IF total_weight > 0 THEN
        SET weighted_average = total_score / total_weight;
    ELSE
        SET weighted_average = 0;
    END IF;

    -- Update the average_score for the given user
    UPDATE users
    SET average_score = weighted_average
    WHERE id = user_id;
END //

DELIMITER ;
