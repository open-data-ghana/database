-- this code creates the database. run this entire script only once unless there's a major update.

-- check if the database exists
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

/*
 if above query returns false then you can run the
 CREATE DATABASE and CREATE SCHEMA commands if not
 skip to the CREATE TABLE commands.
 
 if you want to run the whole script irrespecti
*/
-- create the database 
CREATE DATABASE open_data_ghana
  ENCODING = 'UTF8';

-- create database schema 
CREATE SCHEMA datasets;

-- Create table to store regions information
CREATE TABLE datasets.regions (
	region_code INT PRIMARY KEY,
    region_name VARCHAR(255) NOT NULL,
    capital VARCHAR(255) NOT NULL,
    alpha_2_code VARCHAR(2) NOT NULL,
    alpha_3_code VARCHAR(3) NOT NULL
);

-- create constituencies table
CREATE TABLE datasets.constituencies (
	constituency_id INT PRIMARY KEY,
	constituency_name VARCHAR(255) NOT NULL,
	-- ISO 3166-1 alpha-2
	region_code VARCHAR(2) NOT NULL
);


-- create population table
CREATE TABLE datasets.population (
    region_code VARCHAR(2) NOT NULL,
    pop_2021 INT,
    pop_2010 INT,
    pop_2000 INT,
    pop_1984 INT,
    pop_1970 INT,
    pop_1960 INT
);

-- create election years table
CREATE TABLE datasets.elections (
    election_id SERIAL PRIMARY KEY,
    election_year VARCHAR(4) NOT NULL
);

-- create political parties table
CREATE TABLE datasets.political_parties (
    party_id SERIAL PRIMARY KEY,
    party_name VARCHAR(255) NOT NULL,
    acronym VARCHAR(10) NOT NULL
);

-- election candidatws table
CREATE TABLE datasets.candidates (
    candidate_id SERIAL PRIMARY KEY,
    candidate_name VARCHAR(255) NOT NULL,
    party_id INT NOT NULL,
    election_id INT NOT NULL,
    FOREIGN KEY (party_id) REFERENCES datasets.parties(party_id),
    FOREIGN KEY (election_id) REFERENCES datasets.elections(election_id)
);

-- 2020 election results table
CREATE TABLE datasets.election_results_2020 (
    party_id INT NOT NULL,
    candidate_id INT NOT NULL,
    votes INT NOT NULL,
    FOREIGN KEY (party_id) REFERENCES datasets.political_parties(party_id),
    FOREIGN KEY (candidate_id) REFERENCES datasets.candidates(candidate_id)
);
