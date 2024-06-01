/* 
This code creates the database. Run this entire script only once unless there's a major update. 
Run the first query to check if database exists. If it returns false, then you can run the entire script.
*/

-- Check if the database exists
SELECT
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM pg_database
            WHERE datname = 'open_data_ghana'
        )
        THEN 'true'
        ELSE 'false'
    END AS db_available;


-- Create the database 
CREATE DATABASE open_data_ghana
  ENCODING = 'UTF8';

-- Create database schema to organize data into logical groups
-- Schemas will be used to logically partition the database and manage access permissions
CREATE SCHEMA datasets;