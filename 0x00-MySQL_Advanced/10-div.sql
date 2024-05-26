-- Description: This SQL script creates a function called SafeDiv that divides two numbers 
-- and returns the result or 0 if the second number is equal to 0.
-- The function takes two integer arguments: a and b.
-- It returns a DECIMAL(10,4) value representing the division of a by b, or 0 if b is equal to 0.
-- Author: [Ngozi Rob Agomuonso]
-- Date: [26/05/2024]
-- Version: 1.0

DELIMITER $$
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    RETURN (IF (b = 0, 0, a / b));
END
$$
DELIMITER ;
