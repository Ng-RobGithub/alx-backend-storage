-- This SQL script creates a trigger that resets the attribute valid_email
-- only when the email has been changed


CREATE TRIGGER reset_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Trigger logic here
    IF NEW.email IS NULL THEN
        SET NEW.valid_email = 0;
    ELSE
        SET NEW.valid_email = 1;
    END IF;
END;

