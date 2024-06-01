-- Create table to store regions information
DROP TABLE IF EXISTS datasets.regions;
CREATE TABLE datasets.regions (
    -- Unique identifier for each region, serves as the primary key
    region_code INT PRIMARY KEY,
    
    -- Name of the region, must not be null
    region_name VARCHAR(255) NOT NULL,
    
    -- Capital city of the region, must not be null
    capital VARCHAR(255) NOT NULL

    -- ISO 3166-1 alpha-2 code
    alpha2_code VARCHAR(2)

    -- ISO 3166-1 alpha-3 code
    alpha2_code VARCHAR(3)
);


-- Populate regions table with regions data
INSERT INTO datasets.regions (region_code, region_name, capital, alpha_2_code, alpha_3_code) VALUES
    (01, 'Ahafo', 'Goaso', 'AH', 'AHF'),
    (02, 'Ashanti', 'Kumasi', 'AS', 'ASH'),
    (03, 'Bono', 'Sunyani', 'BO', 'BON'),
    (04, 'Bono East', 'Techiman', 'BE', 'BOE'),
    (05, 'Central', 'Cape Coast', 'CN', 'CEN'),
    (06, 'Eastern', 'Koforidua', 'EA', 'EST'),
    (07, 'Greater Accra', 'Accra', 'GA', 'GAC'),
    (08, 'North East', 'Nalerigu', 'NE', 'NOE'),
    (09, 'Northern', 'Tamale', 'NO', 'NOR'),
    (10, 'Oti', 'Dambai', 'OT', 'OTI'),
    (11, 'Savannah', 'Damongo', 'SA', 'SAV'),
    (12, 'Upper East', 'Bolgatanga', 'UE', 'UPE'),
    (13, 'Upper West', 'Wa', 'UW', 'UPW'),
    (14, 'Volta', 'Ho', 'VO', 'VOL'),
    (15, 'Western', 'Sekondi-Takoradi', 'WE', 'WES'),
    (16, 'Western North', 'Sefwi Wiawso', 'WN', 'WNO');