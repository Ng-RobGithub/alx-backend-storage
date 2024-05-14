-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS reduce_quantity;

-- Change the delimiter for trigger definition
DELIMITER $$

-- Create the trigger to reduce quantity after inserting a new order
CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Declare a variable to store the quantity of the item
    DECLARE item_quantity INT;

    -- Check if the item exists in the items table
    SELECT quantity INTO item_quantity
    FROM items
    WHERE name = NEW.item_name;

    -- If the item exists, update its quantity
    IF item_quantity IS NOT NULL THEN
        UPDATE items
        SET quantity = quantity - NEW.number
        WHERE name = NEW.item_name;
    ELSE
        -- Handle the case where the item doesn't exist
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Item does not exist in the items table';
    END IF;
END $$

-- Reset the delimiter back to semicolon
DELIMITER ;
