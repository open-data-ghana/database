-- This code creates the database. Run this entire script only once unless there's a major update.
-- WARNING: Running this script multiple times will create duplicate databases. Proceed with caution!

-- Create the database 
CREATE DATABASE open_data_ghana
  ENCODING = 'UTF8';

-- Create database schema to organize data into logical groups
-- Schemas will be used to logically partition the database and manage access permissions
CREATE SCHEMA datasets;
