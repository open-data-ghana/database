-- Create table to store regions information
CREATE TABLE datasets.gh_regions (
    -- Unique identifier for each region, serves as the primary key
    region_code INT PRIMARY KEY,
    
    -- Name of the region, must not be null
    region_name VARCHAR(255) NOT NULL,
    
    -- Capital city of the region, must not be null
    capital VARCHAR(255) NOT NULL
);
