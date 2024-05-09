-- Description: This SQL script creates a function called SafeDiv that divides two numbers and returns the result or 0 if the second number is equal to 0.
-- The function takes two integer arguments: a and b.
-- It returns a DECIMAL(10,4) value representing the division of a by b, or 0 if b is equal to 0.
-- Author: [Your Name]
-- Date: [Current Date]
-- Version: 1.0

DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS DECIMAL(10,4)
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
END //

DELIMITER ;
