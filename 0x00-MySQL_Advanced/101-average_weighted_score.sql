-- Create a stored procedure named ComputeAverageWeightedScoreForUsers
-- that computes and stores the average weighted score for all students

DROPPROCEDURE IF EXISTS ComputerAverageWeightedScoreForUsers;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE user_id_var INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cur;

    -- Start looping through each user
    my_loop: LOOP
        -- Fetch the next user id
        FETCH cur INTO user_id_var;

        -- Check if no more users to process
        IF done THEN
            LEAVE my_loop;
        END IF;

        -- Call the stored procedure ComputeAverageWeightedScoreForUser for each user
        CALL ComputeAverageWeightedScoreForUser(user_id_var);
    END LOOP;

    -- Close the cursor
    CLOSE cur;
END //

DELIMITER ;
