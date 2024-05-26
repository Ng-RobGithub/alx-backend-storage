-- Description: This SQL script creates an index on the first letter of the name column in the names table.
-- The index is named idx_name_first and is created on the SUBSTRING(name, 1, 1) expression.
-- This index will help optimize simple searches that involve filtering by the first letter of the name.
-- Author: [Your Name]
-- Date: [Current Date]
-- Version: 1.0

CREATE INDEX idx_name_first ON names(name(1));
